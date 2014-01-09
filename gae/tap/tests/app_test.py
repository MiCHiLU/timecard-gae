from random import random
import zipfile
import tap

from google.appengine.api import namespace_manager
from google.appengine.ext import ndb
from google.appengine.runtime import apiproxy_errors
import webapp2

class Model(ndb.Model):
  pass

class FetchPage(tap.RequestHandler):
  def get(self):
    self.fetch_page_async(Model.query())

class Translation(tap.RequestHandler):
  i18n = True
  i18n_domain = "sample"
  i18n_redirect = True

  def get(self):
    i18n_ = _("Python")
    i18n_gettext = gettext("Anaconda")
    self.render_response("sample.html", locals())

class ForMobile(tap.RequestHandler):
  @tap.cache(60)
  def get(self):
    ndb.get_context().memcache_get("sample")
    self.render_response("sample.html", locals(), featurephone=True)

class OverQuotaError(tap.RequestHandler):
  def get(self):
    raise apiproxy_errors.OverQuotaError

class InternalServerError(tap.RequestHandler):
  def get(self):
    assert False

class Head(tap.RequestHandler):
  @tap.head()
  def get(self):
    self.response._app_iter = []

class CORS(tap.RequestHandler):
  @tap.cors()
  def options(self):
    pass

  @tap.cors(origin=lambda:"test")
  def get(self):
    pass

rate_limit = tap.rate_limit(rate=1, size=2, key=lambda self: self.request.remote_addr, tag="RateLimit")
class RateLimit(tap.RequestHandler):
  @rate_limit
  def get(self):
    pass

  @rate_limit
  def post(self):
    pass

  @tap.rate_limit(rate=1, size=1)
  def put(self):
    pass

class CacheTemporary(tap.RequestHandler):
  @tap.cache(temporary=True)
  def get(self):
    self.response.write(random())

class Proxy(tap.RequestHandler):
  def get(self):
    self.proxy()

class Sessions(tap.RequestHandler):
  def get(self):
    assert self.session is None

  @tap.session_read_only
  def post(self):
    self.session["TEST"] = "POST"

  @tap.session
  def put(self):
    self.session["TEST"] = "PUT"

  @tap.session
  def delete(self):
    self.session["TEST"] = "DELETE"

class Users(tap.RequestHandler):
  @tap.session_read_only
  def get(self):
    assert self.users.create_login_url() == "/oauth/google"
    assert self.users.create_logout_url() == "/oauth/signout"
    user = self.users.get_current_user()
    assert user is not None
    assert user.user_id() == u"ID"
    assert getattr(user, "locale", None) is None

  @tap.session
  def post(self):
    assert tap.User.load_from_session(self.session) is None
    user = tap.User(data={"id": u"ID", u"locale": u"ja"})
    assert user is not None
    user.set_to_session(self.session)

class LoginRequired(tap.RequestHandler):
  @tap.login_required
  def get(self):
    pass

class Namespace(tap.RequestHandler):
  def get(self):
    self.response.write(namespace_manager.get_namespace())

class ZipFile(tap.RequestHandler):
  use_zipfile = True

  def get(self):
    assert self.response.tell() == 0
    writer = zipfile.ZipFile(self.response, "w")
    writer.writestr("zinfo_or_arcname", b"test")
    writer.close()
    assert self.response.tell() == 134

routes = [
  webapp2.Route("/fetch_page", FetchPage),
  webapp2.Route("/translation", Translation),
  webapp2.Route("/index.html", ForMobile),
  webapp2.Route("/test.html", OverQuotaError),
  webapp2.Route("/error.html", InternalServerError),
  webapp2.Route("/head", Head),
  webapp2.Route("/cors", CORS),
  webapp2.Route("/rate_limit", RateLimit),
  webapp2.Route("/cache_temporary", CacheTemporary),
  webapp2.Route("/proxy", Proxy),
  webapp2.Route("/sessions", Sessions),
  webapp2.Route("/users", Users),
  webapp2.Route("/login_required", LoginRequired),
  webapp2.Route("/namespace", Namespace),
  webapp2.Route("/zipfile", ZipFile),
]
