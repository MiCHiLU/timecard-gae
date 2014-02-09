from google.appengine.api import (
  oauth,
  search,
)
from google.appengine.ext import (
  deferred,
  ndb,
)
from protorpc import (
  message_types,
)
from webapp2_extras import security
import endpoints
import tap
import tap.endpoints

from api import api
import message
import model

rate_limit = tap.endpoints.rate_limit(rate=50, size=50, key=tap.endpoints.get_user_id_or_ip, tag="timecard:api")

@api.api_class(resource_name="project", path="project")
class Project(tap.endpoints.CRUDService):

  @endpoints.method(message.ProjectRequestList, message.ProjectResponseCollection)
  @ndb.toplevel
  @rate_limit
  def list(self, request):
    user_id = tap.endpoints.get_user_id(raises=False)
    if user_id:
      user_key = model.User.gen_key(user_id)
      user = yield user_key.get_async()
    else:
      user = None

    if user:
      query = model.Project.query(ndb.OR(model.Project.is_public == True,
                                         model.Project.member == user_key))
      query = query.order(model.Project.key)
    else:
      query = model.Project.query(model.Project.is_public == True)
    entities, cursor, more = yield tap.fetch_page_async(
      query = query,
      cursor_string = request.pagination,
      page = 20,
    )

    items = list()
    for project in entities:
      items.append(message.ProjectResponse(
        key         = project.key.integer_id(),
        name        = project.name       ,
        description = project.description,
        is_public   = project.is_public  ,
        closed      = project.closed     ,
        admin       = [key.string_id() for key in project.admin],
        member      = [key.string_id() for key in project.member],
        language    = project.language      ,
      ))
    raise ndb.Return(message.ProjectResponseCollection(
      items = items,
      pagination = cursor.urlsafe() if more else None,
    ))

  @endpoints.method(message.ProjectRequestSearch, message.ProjectResponseCollection)
  @ndb.toplevel
  @rate_limit
  def search(self, request):
    if len(request.query.encode("utf-8")) < 3:
      raise endpoints.BadRequestException("Bad query")

    query = search.Query(
      query_string = request.query,
      options = search.QueryOptions(
        limit  = 20,
        cursor = search.Cursor(web_safe_string=request.pagination),
        ids_only = True,
      ),
    )

    key_list = list()
    documents = ProjectSearchIndex.search_index.search(query)
    for document in documents:
      key_list.append(ndb.Key(model.Project, tap.base62_decode(document.doc_id)))
    if key_list:
      entities = yield ndb.get_multi_async(key_list)
    else:
      entities = list()

    items = list()
    for project in entities:
      if project is None:
        continue
      items.append(message.ProjectResponse(
        key         = project.key.integer_id(),
        name        = project.name       ,
        description = project.description,
        is_public   = project.is_public  ,
        closed      = project.closed     ,
        admin       = [key.string_id() for key in project.admin],
        member      = [key.string_id() for key in project.member],
        language    = project.language      ,
      ))

    if documents.cursor:
      cursor_string = documents.cursor.web_safe_string
    else:
      cursor_string = None

    raise ndb.Return(message.ProjectResponseCollection(
      items = items,
      pagination = cursor_string,
    ))

  @endpoints.method(message.ProjectRequestNew, message.ProjectResponse)
  @ndb.toplevel
  @rate_limit
  def create(self, request):
    user_key = model.User.gen_key(tap.endpoints.get_user_id())
    user = yield user_key.get_async()
    if user is None:
      raise endpoints.UnauthorizedException()

    project = model.Project(
      name        = request.name       ,
      description = request.description,
      is_public   = request.is_public  ,
      admin       = (user.key,)        ,
      member      = (user.key,)        ,
      language    = user.language      ,
    )
    future = project.put_async()
    if future.check_success():
      raise future.get_exception()

    if project.is_public:
      ProjectSearchIndex.update(project, will_un_public=False)

    raise ndb.Return(message.ProjectResponse(
      key         = project.key.integer_id(),
      name        = project.name       ,
      description = project.description,
      is_public   = project.is_public  ,
      closed      = project.closed     ,
      admin       = [key.string_id() for key in project.admin],
      member      = [key.string_id() for key in project.member],
      language    = project.language      ,
    ))

  @endpoints.method(message.ProjectRequest, message.ProjectResponse)
  @ndb.toplevel
  @rate_limit
  def update(self, request):
    user_key = model.User.gen_key(tap.endpoints.get_user_id())
    project_key = ndb.Key(model.Project, request.key)
    user, project = yield ndb.get_multi_async((user_key, project_key))

    if not user:
      raise endpoints.UnauthorizedException()
    if not project:
      raise endpoints.NotFoundException()
    if not user.key in project.admin:
      raise endpoints.ForbiddenException()

    if request.is_public is False and request.is_public is True:
      will_un_public = True
    else:
      will_un_public = False

    user_id_list = list()
    for name in ("admin", "member"):
      value = request.__getattribute__(name)
      if value == []:
        continue
      if len(value) != len(set(value)):
        raise endpoints.BadRequestException()
      project.__setattr__(name, [model.User.gen_key(user_id) for user_id in value])
      user_id_list.extend(value)
    if user_id_list:
      user_key_list = [model.User.gen_key(user_id) for user_id in set(user_id_list)]
      results = yield ndb.get_multi_async(user_key_list)
      if None in results:
        raise endpoints.BadRequestException()
      modified = True
    else:
      modified = False

    for field in request.all_fields():
      name = field.name
      if name in ("key", "admin", "member"):
        continue
      value = request.__getattribute__(name)
      if value is None:
        continue
      project.__setattr__(name, value)
      modified = True
    else:
      if modified is False:
        raise endpoints.BadRequestException()

    try:
      future = project.put_async()
      future.check_success()
    except Exception as e:
      raise endpoints.BadRequestException(e.message)

    ProjectSearchIndex.update(project, will_un_public)

    raise ndb.Return(message.ProjectResponse(
      key         = project.key.integer_id(),
      name        = project.name       ,
      description = project.description,
      is_public   = project.is_public  ,
      closed      = project.closed     ,
      admin       = [key.string_id() for key in project.admin],
      member      = [key.string_id() for key in project.member],
      language    = project.language      ,
    ))

  @endpoints.method(message.ProjectRequestDelete, message_types.VoidMessage)
  @ndb.toplevel
  @rate_limit
  def delete(self, request):
    user_key = model.User.gen_key(tap.endpoints.get_user_id())
    project_key = ndb.Key(model.Project, request.key)
    user, project = yield ndb.get_multi_async((user_key, project_key))

    if not user:
      raise endpoints.UnauthorizedException()
    if not project:
      raise endpoints.NotFoundException()
    if not user.key in project.admin:
      raise endpoints.ForbiddenException()

    if not project.closed:
      raise endpoints.BadRequestException()
    if not security.compare_hashes(request.name, project.name):
      raise endpoints.BadRequestException()

    if project.is_public:
      ProjectSearchIndex.update(project, will_un_public=False)

    ProjectDelete.run(project.key)

    raise ndb.Return(message_types.VoidMessage())

class ProjectDelete(object):
  @classmethod
  def run(cls, project_key):
    project_key.delete_async()
    key_id = tap.base62_encode(project_key.integer_id())
    model_names = [
      "Comment",
      "Issue",
      "WorkLoad",
    ]
    for model_name in model_names:
      deferred.defer(cls._run, key_id, model_name)

  @classmethod
  @ndb.toplevel
  @ndb.synctasklet
  def _run(cls, key_id, model_name):
    try:
      Model = model.__dict__[model_name]
    except KeyError as e:
      raise deferred.PermanentTaskFailure(e)
    key_start = ndb.Key(Model, key_id)
    key_end   = ndb.Key(Model, "{0}/\xff".format(key_id))
    query = Model.query(ndb.AND(Model.key >= key_start,
                                Model.key <= key_end))
    cursor = None
    while True:
      results, cursor, more = yield query.fetch_page_async(page_size=100,
                                                           keys_only=True,
                                                           start_cursor=cursor)
      ndb.delete_multi_async(results)
      if not more:
        return

class ProjectSearchIndex(object):

  search_index = search.Index(name="timecard:project")

  @classmethod
  def update(cls, project, will_un_public):
    if project.is_public is False and will_un_public is False:
      return
    doc_id = tap.base62_encode(project.key.integer_id())
    if will_un_public:
      deferred.defer(cls.delete, doc_id)
    else:
      if project.language == "ja":
        queue = "yahoo-japan-jlp-ma"
      else:
        queue = "default"
      text = " ".join((project.name, project.description))
      deferred.defer(cls.put,
                     doc_id, text, project.language,
                     _queue=queue)

  @classmethod
  def put(cls, doc_id, text, language):
    if language == "ja":
      from util import jlp_api
      fields = [search.TextField(name="a", value=word, language=language) for word in jlp_api.ma(text)]
    else:
      fields = [search.TextField(name="a", value=text, language=language)]
    cls.search_index.put(search.Document(
      doc_id = doc_id,
      fields = fields,
    ))

  @classmethod
  def delete(cls, doc_id):
    cls.search_index.delete(doc_id)
