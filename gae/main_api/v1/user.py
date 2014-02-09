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

rate_limit = tap.endpoints.rate_limit(rate=50, size=50, key=tap.endpoints.get_user_id_or_ip, tag="timecard:api")

class user(object):
  @staticmethod
  @ndb.tasklet
  def store(user):
    key = model.User.gen_key(user.user_id())
    entity = yield key.get_async()
    if entity is None:
      entity = model.User(key=key)
    entity.name = user.name
    entity.language = user.language
    entity.put_async()
    UserSearchIndex.update(user)

@api.api_class(resource_name="me", path="me")
class Me(tap.endpoints.CRUDService):

  @endpoints.method(message_types.VoidMessage, message.UserResponse)
  @ndb.toplevel
  @rate_limit
  def get(self, _request):
    user_key = model.User.gen_key(tap.endpoints.get_user_id())
    entity = yield user_key.get_async()
    if entity is None:
      raise endpoints.NotFoundException()

    raise ndb.Return(message.UserResponse(
      key       = entity.key.string_id(),
      name      = entity.name,
      language  = entity.language,
    ))

  @endpoints.method(message.UserRequest, message.UserResponse)
  @ndb.toplevel
  @rate_limit
  def create(self, request):
    user_key = model.User.gen_key(tap.endpoints.get_user_id())
    entity = yield user_key.get_async()
    if entity is not None:
      raise endpoints.ForbiddenException()

    entity = model.User(
      key       = user_key,
      name      = request.name,
    )

    language = request.language
    if language is None:
      accept_language = self.request_state.headers.get("Accept-Language")
      if accept_language:
        for lang in [locale.split(";", 1)[0].replace("-", "_") for locale in accept_language.split(",")]:
          if lang in model.LANGUAGE_CHOICES_VALUES:
            language = lang
    if language is not None:
      entity.language = language

    try:
      future = entity.put_async()
      future.check_success()
    except Exception as e:
      raise endpoints.BadRequestException(e.message)
    UserSearchIndex.update(entity)
    raise ndb.Return(message.UserResponse(
      key       = entity.key.string_id(),
      name      = entity.name,
      language  = entity.language,
    ))

  @endpoints.method(message.UserRequest, message.UserResponse)
  @ndb.toplevel
  @rate_limit
  def update(self, request):
    user_key = model.User.gen_key(tap.endpoints.get_user_id())
    entity = yield user_key.get_async()
    if entity is None:
      raise endpoints.BadRequestException()

    modified = False
    for field in request.all_fields():
      name = field.name
      if name == "key":
        continue
      value = request.__getattribute__(name)
      if value is None:
        continue
      entity.__setattr__(name, value)
      modified = True
    else:
      if modified is False:
        raise endpoints.BadRequestException()
    try:
      future = entity.put_async()
      future.check_success()
    except Exception as e:
      raise endpoints.BadRequestException(e.message)
    UserSearchIndex.update(entity)
    raise ndb.Return(message.UserResponse(
      key       = entity.key.string_id(),
      name      = entity.name,
      language  = entity.language,
    ))

  @endpoints.method(message.UserRequestDelete, message_types.VoidMessage)
  @ndb.toplevel
  @rate_limit
  def delete(self, request):
    user_id = tap.endpoints.get_user_id()
    if request.key != user_id:
      raise endpoints.BadRequestException()
    user_key = model.User.gen_key(user_id)
    entity = yield user_key.get_async()
    if entity is None:
      raise endpoints.NotFoundException()
    if request.name != entity.name:
      raise endpoints.BadRequestException()

    query = model.Project.query(model.Project.admin == user_key)
    result = yield query.get_async(keys_only=True)
    if result:
      raise endpoints.ForbiddenException()

    future = entity.key.delete_async()
    if future.check_success():
      raise future.get_exception()
    deferred.defer(UserSearchIndex.delete, user_id)
    raise ndb.Return(message_types.VoidMessage())

@api.api_class(resource_name="user", path="user")
class User(tap.endpoints.CRUDService):

  @endpoints.method(message.UserRequestListCollection, message.UserResponseCollection)
  @ndb.toplevel
  @rate_limit
  def list(self, request):
    key_list = list()
    for user_receive_list in request.items:
      key_list.append(model.User.gen_key(user_receive_list.key))
    if key_list:
      entities = yield ndb.get_multi_async(key_list)
    else:
      raise endpoints.BadRequestException("Bad query")
    items = list()
    for user in entities:
      if user is None:
        continue
      items.append(message.UserResponse(key=user.user_id,
                                    name=user.name,
                                    language=user.language))
    raise ndb.Return(message.UserResponseCollection(
      items = items,
    ))

  @endpoints.method(message.UserRequestSearch, message.UserResponseCollection)
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
    documents = UserSearchIndex.search_index.search(query)
    for document in documents:
      key_list.append(ndb.Key(model.User, document.doc_id))
    items = list()
    if key_list:
      entities = yield ndb.get_multi_async(key_list)
      for user in entities:
        if user is None:
          continue
        items.append(message.UserResponse(key=user.user_id,
                                      name=user.name,
                                      language=user.language))
    if documents.cursor:
      cursor_string = documents.cursor.web_safe_string
    else:
      cursor_string = None
    raise ndb.Return(message.UserResponseCollection(
      items = items,
      pagination = cursor_string,
    ))

class UserSearchIndex(object):

  search_index = search.Index(name="timecard:user")

  @classmethod
  def update(cls, user):
    deferred.defer(cls.put, user.user_id, user.name)

  @classmethod
  def put(cls, doc_id, name):
    cls.search_index.put(search.Document(
      doc_id = doc_id,
      fields = [search.TextField(name="a", value=name)],
    ))

  @classmethod
  def delete(cls, doc_id):
    cls.search_index.delete(doc_id)
