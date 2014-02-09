from datetime import datetime

from google.appengine.api import search
from google.appengine.ext import (
  deferred,
  ndb,
)
from protorpc import (
  message_types,
)
import endpoints
import tap
import tap.endpoints

from api import api
import message
import model

rate_limit = tap.endpoints.rate_limit(rate=50, size=50, key=tap.endpoints.get_user_id, tag="timecard:api")

@api.api_class(resource_name="issue", path="issue")
class Issue(tap.endpoints.CRUDService):

  @endpoints.method(message.IssueRequestList, message.IssueResponseCollection)
  @ndb.toplevel
  @rate_limit
  def list(self, request):
    project_key = ndb.Key(model.Project, request.project)
    user_id = tap.endpoints.get_user_id(raises=False)
    if user_id is None:
      user = None
      project = yield project_key.get_async()
    else:
      user_key = model.User.gen_key(user_id)
      user, project = yield ndb.get_multi_async((user_key, project_key))

    if not project:
      raise endpoints.NotFoundException()
    if not project.is_public and (not user or user.key not in project.member):
      raise endpoints.ForbiddenException()

    project_id = tap.base62_encode(project.key.integer_id())
    key_start = ndb.Key(model.Issue, project_id)
    key_end   = ndb.Key(model.Issue, "{0}/\xff".format(project_id))
    query = model.Issue.query(ndb.AND(model.Issue.key >= key_start,
                                      model.Issue.key <= key_end))
    entities, cursor, more = yield tap.fetch_page_async(
      query = query,
      cursor_string = request.pagination,
      page = 20,
    )

    items = list()
    for issue in entities:
      items.append(message.IssueResponse(
        project       = issue.project_key.integer_id()      ,
        subject       = issue.subject      ,
        description   = issue.description  ,
        assignee      = issue.assignee.integer_id() if issue.assignee else None     ,
        key           = issue.key.string_id().decode("utf-8")          ,
        closed_on     = issue.closed_on    ,
        will_start_at = issue.will_start_at,
        author        = issue.author_key.integer_id()       ,
      ))
    raise ndb.Return(message.IssueResponseCollection(
      items = items,
      pagination = cursor.urlsafe() if more else None,
    ))

  @endpoints.method(message.IssueRequestSearch, message.IssueResponseCollection)
  @ndb.toplevel
  @rate_limit
  def search(self, request):
    if len(request.query.encode("utf-8")) < 3:
      raise endpoints.BadRequestException("Bad query")

    project_key = ndb.Key(model.Project, request.project)
    user_id = tap.endpoints.get_user_id(raises=False)
    if user_id is None:
      user = None
      project = yield project_key.get_async()
    else:
      user_key = model.User.gen_key(user_id)
      user, project = yield ndb.get_multi_async((user_key, project_key))

    if not project:
      raise endpoints.NotFoundException()
    if not project.is_public and (not user or user.key not in project.member):
      raise endpoints.ForbiddenException()

    query = search.Query(
      query_string = u'a: "{0}" AND p: "{1}"'.format(request.query,
                                                     tap.base62_encode(project.key.integer_id())),
      options = search.QueryOptions(
        limit  = 20,
        cursor = search.Cursor(web_safe_string=request.pagination),
        returned_fields = ["i"],
      ),
    )

    key_list = list()
    documents = IssueSearchIndex.search_index.search(query)
    for document in documents:
      for field in document.fields:
        if field.name == "i":
          key_list.append(ndb.Key(model.Issue, field.value))
    if key_list:
      entities = yield ndb.get_multi_async(key_list)
    else:
      entities = list()

    items = list()
    for issue in entities:
      items.append(message.IssueResponse(
        project       = issue.project_key.integer_id()      ,
        subject       = issue.subject      ,
        description   = issue.description  ,
        assignee      = issue.assignee.integer_id() if issue.assignee else None     ,
        key           = issue.key.string_id().decode("utf-8")          ,
        closed_on     = issue.closed_on    ,
        will_start_at = issue.will_start_at,
        author        = issue.author_key.integer_id()       ,
      ))

    if documents.cursor:
      cursor_string = documents.cursor.web_safe_string
    else:
      cursor_string = None

    raise ndb.Return(message.IssueResponseCollection(
      items = items,
      pagination = cursor_string,
    ))

  @endpoints.method(message.IssueRequestNew, message.IssueResponse)
  @ndb.toplevel
  @rate_limit
  def create(self, request):
    user_key = model.User.gen_key(tap.endpoints.get_user_id())
    project_key = ndb.Key(model.Project, int(request.project))
    if request.assignee is not None:
      assignee_key = ndb.Key(model.User, request.assignee)
      user, project, assignee = yield ndb.get_multi_async((user_key, project_key, assignee_key))
    else:
      assignee_key = None
      user, project = yield ndb.get_multi_async((user_key, project_key))

    if not user:
      raise endpoints.UnauthorizedException()
    if not project:
      raise endpoints.BadRequestException()
    if not user.key in project.member:
      raise endpoints.ForbiddenException()
    if assignee_key is not None and not assignee:
      raise endpoints.BadRequestException()

    issue_key = model.Issue.gen_key(
      project_key   = project_key,
      will_start_at = datetime.utcnow(),
      author_id     = user.key.string_id(),
      author_name   = user.name,
    )
    issue = model.Issue(
      key           = issue_key          ,
      subject       = request.subject       ,
      description   = request.description   ,
      assignee      = assignee_key      ,
    )
    _issue_key = yield issue.put_async()

    IssueSearchIndex.update(issue, project)

    raise ndb.Return(message.IssueResponse(
      project       = issue.project_key.integer_id()  ,
      subject       = issue.subject      ,
      description   = issue.description  ,
      assignee      = issue.assignee.integer_id() if issue.assignee else None     ,
      key           = issue.key.string_id().decode("utf-8"),
      closed_on     = issue.closed_on    ,
      will_start_at = issue.will_start_at,
      author        = issue.author_key.integer_id()       ,
    ))

  @endpoints.method(message.IssueRequest, message.IssueResponse)
  @ndb.toplevel
  @rate_limit
  def update(self, request):
    user_key = ndb.Key(model.User, tap.endpoints.get_user_id())
    issue_key = ndb.Key(model.Issue, request.key)
    project_key, _will_start_at, _user_id, _name = model.Issue.parse_key(issue_key)
    user, issue, project = yield ndb.get_multi_async((user_key, issue_key, project_key))

    if not user:
      raise endpoints.UnauthorizedException()
    if not issue:
      raise endpoints.NotFoundException()
    if user.key not in project.member:
      raise endpoints.ForbiddenException()

    issue.subject     = request.subject
    issue.description = request.description
    issue.closed_on   = request.closed_on
    issue.assignee    = ndb.Key(model.User, int(request.assignee)) if issue.assignee else None
    _issue_key = yield issue.put_async()

    IssueSearchIndex.update(issue, project)

    raise ndb.Return(message.IssueResponse(
      project       = issue.project_key.integer_id()  ,
      subject       = issue.subject      ,
      description   = issue.description  ,
      assignee      = issue.assignee.integer_id() if issue.assignee else None     ,
      key           = issue.key.string_id().decode("utf-8"),
      closed_on     = issue.closed_on    ,
      will_start_at = issue.will_start_at,
      author        = issue.author_key.string_id()       ,
    ))

  @endpoints.method(message.IssueRequestToggle, message.IssueResponse)
  @ndb.toplevel
  @rate_limit
  def close(self, request):
    user_key = model.User.gen_key(tap.endpoints.get_user_id())
    issue_key = ndb.Key(model.Issue, request.key)
    project_key, _will_start_at, _user_id, _name = model.Issue.parse_key(issue_key)
    user, issue, project = yield ndb.get_multi_async((user_key, issue_key, project_key))

    if not user:
      raise endpoints.UnauthorizedException()
    if not issue:
      raise endpoints.NotFoundException()
    if user.key not in project.member:
      raise endpoints.ForbiddenException()

    issue.closed_on   = datetime.utcnow()
    _issue_key = yield issue.put_async()

    raise ndb.Return(message.IssueResponse(
      project       = issue.project_key.integer_id()  ,
      subject       = issue.subject      ,
      description   = issue.description  ,
      assignee      = issue.assignee.integer_id() if issue.assignee else None     ,
      key           = issue.key.string_id().decode("utf-8"),
      closed_on     = issue.closed_on    ,
      will_start_at = issue.will_start_at,
      author        = issue.author_key.string_id()       ,
    ))

  @endpoints.method(message.IssueRequestToggle, message.IssueResponse)
  @ndb.toplevel
  @rate_limit
  def reopen(self, request):
    user_key = model.User.gen_key(tap.endpoints.get_user_id())
    issue_key = ndb.Key(model.Issue, request.key)
    project_key, _will_start_at, _user_id, _name = model.Issue.parse_key(issue_key)
    user, issue, project = yield ndb.get_multi_async((user_key, issue_key, project_key))

    if not user:
      raise endpoints.UnauthorizedException()
    if not issue:
      raise endpoints.NotFoundException()
    if user.key not in project.member:
      raise endpoints.ForbiddenException()

    issue.closed_on   = None
    _issue_key = yield issue.put_async()

    raise ndb.Return(message.IssueResponse(
      project       = issue.project_key.integer_id()  ,
      subject       = issue.subject      ,
      description   = issue.description  ,
      assignee      = issue.assignee.integer_id() if issue.assignee else None     ,
      key           = issue.key.string_id().decode("utf-8"),
      closed_on     = issue.closed_on    ,
      will_start_at = issue.will_start_at,
      author        = issue.author_key.string_id()       ,
    ))

class IssueSearchIndex(object):

  search_index = search.Index(name="timecard:issue")

  @classmethod
  def doc_id(cls, issue):
    return "/".join(issue.key.string_id().split("/", 3)[:-1])

  @classmethod
  def update(cls, issue, project):
    doc_id = cls.doc_id(issue)
    if project.language == "ja":
      queue = "yahoo-japan-jlp-ma"
    else:
      queue = "default"
    text = " ".join((issue.subject, issue.description))
    deferred.defer(cls.put,
                   doc_id, text,
                   tap.base62_encode(project.key.integer_id()),
                   issue.key.string_id(),
                   project.language,
                   _queue=queue)

  @classmethod
  def put(cls, doc_id, text, project_id, issue_id, language):
    if language == "ja":
      from util import jlp_api
      fields = [search.TextField(name="a", value=word, language=language) for word in jlp_api.ma(text)]
    else:
      fields = [search.TextField(name="a", value=text, language=language)]
    fields.extend([
      search.AtomField(name="p", value=project_id),
      search.AtomField(name="i", value=issue_id),
    ])
    cls.search_index.put(search.Document(
      doc_id = doc_id,
      fields = fields,
    ))
