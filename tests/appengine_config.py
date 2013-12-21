config_APPS = {
  #{<domain>: ((<path prefix>, <module name>[, <namespace>]),)}
  "": (
    ("/sample", "app_sample"),
    ("/test", "app_test", "namespace"),
  ),
  r"<subdomain:(?!www\.)[^.]+>.example.com": (("", "app_test2", lambda:"example.com"),),
}
config_APPSTATS_INCLUDE_ERROR_STATUS = False
config_CORS_Access_Control_Max_Age = "1"
config_DROPBOX_PROXY_UID = 0
config_GA_ACCOUNT = "test"
config_JINJA2_TEMPLATE_PATH = ("templates",)
config_RESPONSE_CACHE_SIZE = 0
config_SECRET_KEY = "SECRET_KEY"
config_URI_AUTHORITY = "localhost"
