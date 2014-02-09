from datetime import datetime
import operator

from google.appengine.ext import ndb
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

@api.api_class(resource_name="workload", path="workload")
class WorkLoad(tap.endpoints.CRUDService):

  @endpoints.method(message.WorkLoadRequestList, message.WorkLoadResponseCollection)
  @ndb.toplevel
  @rate_limit
  def list(self, request):
    project_key = ndb.Key(model.Project, request.project)
    workload_query_key = tap.base62_encode(project_key.integer_id())

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

    key_start = ndb.Key(model.WorkLoad, workload_query_key)
    key_end   = ndb.Key(model.WorkLoad, "{0}/\xff".format(workload_query_key))
    query = model.WorkLoad.query(ndb.AND(model.WorkLoad.key >= key_start,
                                         model.WorkLoad.key <= key_end))
    workload_keys, cursor, more = yield tap.fetch_page_async(
      query = query,
      cursor_string = request.pagination,
      page = 20,
      keys_only = True,
    )
    if request.pagination is None:
      query = model.ActiveWorkLoad.query(model.ActiveWorkLoad.project == project_key)
      activeworkload_keys = yield tap.fetch_keys_only(query)
    else:
      activeworkload_keys = list()

    items = list()
    for activeworkload_key in activeworkload_keys:
      (
        project_key,
        issue_key,
        start_at,
        user_key,
        user_name,
        project_name,
        issue_subject,
      ) = model.ActiveWorkLoad.parse_key(activeworkload_key)
      items.append(message.WorkLoadResponse(
        issue         = issue_key.string_id(),
        end_at        = None,
        user          = user_key.string_id(),
        project       = project_key.integer_id(),
        start_at      = start_at,
        project_name  = project_name,
        issue_subject = issue_subject,
        user_name     = user_name,
      ))
    for workload_key in workload_keys:
      (
        project_key,
        issue_key,
        start_at,
        end_at,
        user_key,
        user_name,
        project_name,
        issue_subject,
      ) = model.WorkLoad.parse_key(workload_key)
      items.append(message.WorkLoadResponse(
        issue         = issue_key.string_id(),
        end_at        = end_at,
        user          = user_key.string_id(),
        project       = project_key.integer_id(),
        start_at      = start_at,
        project_name  = project_name,
        issue_subject = issue_subject,
        user_name     = user_name,
      ))
    raise ndb.Return(message.WorkLoadResponseCollection(
      items = items,
      pagination = cursor.urlsafe() if more else None,
    ))

  @endpoints.method(message.WorkLoadRequestNew, message.WorkLoadResponse)
  @ndb.toplevel
  @rate_limit
  def create(self, request):
    user_key = model.User.gen_key(tap.endpoints.get_user_id())
    issue_key = ndb.Key(model.Issue, request.issue)
    project_key, _will_start_at, _user_id, _name = model.Issue.parse_key(issue_key)
    user, issue, project = yield ndb.get_multi_async((user_key, issue_key, project_key))

    if not user:
      raise endpoints.UnauthorizedException()
    if not issue:
      raise endpoints.BadRequestException()
    if not project:
      raise endpoints.BadRequestException()
    if user.key not in project.member:
      raise endpoints.ForbiddenException()

    key_start = ndb.Key(model.ActiveWorkLoad, user_id)
    key_end   = ndb.Key(model.ActiveWorkLoad, "{0}/\xff".format(user_id))
    query = model.ActiveWorkLoad.query(ndb.AND(model.ActiveWorkLoad.key >= key_start,
                                               model.ActiveWorkLoad.key <= key_end))
    activeworkload = yield query.get_async()

    if activeworkload:
      raise endpoints.ForbiddenException()

    activeworkload_key = model.ActiveWorkLoad.gen_key(
      project_key = project_key,
      issue_key   = issue_key,
      start_at    = datetime.utcnow(),
      user_key    = user.key,
      user_name   = user.name,
    )
    activeworkload = model.ActiveWorkLoad(
      key     = activeworkload_key ,
      project = project_key,
    )
    _activeworkload_key = yield activeworkload.put_async()

    raise ndb.Return(message.WorkLoadResponse(
      issue         = activeworkload.issue_key.string_id(),
      end_at        = None,
      user          = user.key.string_id(),
      project       = activeworkload.project_key.integer_id(),
      start_at      = activeworkload.start_at,
      project_name  = activeworkload.project_name,
      issue_subject = activeworkload.issue_subject,
      user_name     = activeworkload.user_name,
    ))

  @endpoints.method(message_types.VoidMessage, message.WorkLoadResponse)
  @ndb.toplevel
  @rate_limit
  def get(self, _request):
    user_key = model.User.gen_key(tap.endpoints.get_user_id())
    user = yield user_key.get_async()

    if not user:
      raise endpoints.UnauthorizedException()

    key_start = ndb.Key(model.ActiveWorkLoad, user_id)
    query = model.ActiveWorkLoad.query(ndb.AND(model.ActiveWorkLoad.key >= key_start))
    activeworkload_key = yield query.get_async(keys_only=True)

    if not activeworkload_key:
      raise endpoints.ForbiddenException()

    (
      project_key,
      issue_key,
      start_at,
      user_key,
      user_name,
      project_name,
      issue_subject,
    ) = model.ActiveWorkLoad.parse_key(activeworkload_key)

    raise ndb.Return(message.WorkLoadResponse(
      issue         = issue_key.string_id(),
      end_at        = None,
      user          = user_key.string_id(),
      project       = project_key.integer_id(),
      start_at      = start_at,
      project_name  = project_name,
      issue_subject = issue_subject,
      user_name     = user_name,
    ))

  @endpoints.method(message.WorkLoadRequestClose, message.WorkLoadResponse)
  @ndb.toplevel
  @rate_limit
  def finish(self, _request):
    user_key = model.User.gen_key(tap.endpoints.get_user_id())
    user = yield user_key.get_async()

    if not user:
      raise endpoints.UnauthorizedException()

    key_start = ndb.Key(model.ActiveWorkLoad, user_id)
    key_end   = ndb.Key(model.ActiveWorkLoad, "{0}/\xff".format(user_id))
    query = model.ActiveWorkLoad.query(ndb.AND(model.ActiveWorkLoad.key >= key_start,
                                               model.ActiveWorkLoad.key <= key_end))
    activeworkload_key_list = yield tap.fetch_keys_only(query)

    if not activeworkload_key_list:
      raise endpoints.ForbiddenException()

    activeworkload_list = list()
    for activeworkload_key in activeworkload_key_list:
      (
        project_key,
        issue_key,
        start_at,
        user_key,
        user_name,
        project_name,
        issue_subject,
      ) = model.ActiveWorkLoad.parse_key(activeworkload_key)
      activeworkload_list.append((activeworkload_key, start_at,
                                  project_key,
                                  issue_key,
                                  user_key,
                                  user_name,
                                  project_name,
                                  issue_subject,
                                 ))
    start_at = None
    end_at = datetime.utcnow()
    workload_list = list()
    for activeworkload in sorted(activeworkload_list, key=operator.itemgetter(1), reverse=True):
      (activeworkload_key, start_at,
       project_key,
       issue_key,
       user_key,
       user_name,
       project_name,
       issue_subject,
      ) = activeworkload
      workload_list.append(model.WorkLoad(
        key = model.WorkLoad.gen_key(project_key, issue_key, start_at, start_at or end_at),
        user = user_key,
      ))

    @ndb.transactional(xg=True)
    @ndb.synctasklet
    def transaction():
      _activeworkload_key = yield ndb.delete_multi_async(activeworkload_key_list)
      _workload_key = yield ndb.put_multi_async(workload_list)

    transaction()

    raise ndb.Return(message.WorkLoadResponse(
      issue         = issue_key.string_id(),
      end_at        = end_at,
      user          = user_key.string_id(),
      project       = project_key.integer_id(),
      start_at      = start_at,
      project_name  = project_name,
      issue_subject = issue_subject,
      user_name     = user_name,
    ))
