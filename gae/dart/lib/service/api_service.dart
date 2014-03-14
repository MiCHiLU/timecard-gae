library api_service;

import "dart:html";
import "dart:async";

import "package:angular/angular.dart";
import "package:google_oauth2_client/google_oauth2_browser.dart";
import "package:timecard_dev_api/timecard_dev_api_browser.dart";
import "package:timecard_dev_api/timecard_dev_api_client.dart";

class _EndpointService {
  final _CLIENT_ID = "_.apps.googleusercontent.com";
  final _ROOT_URL = "http://localhost:8080/";
  final _REVOKE_URL = "https://accounts.google.com/o/oauth2/revoke?token=";
  final _SCOPES = ["https://www.googleapis.com/auth/userinfo.email"];

  Timecard _endpoint;
  Timecard get endpoint => _endpoint;

  _EndpointService() {
    GoogleOAuth2 auth = new GoogleOAuth2(_CLIENT_ID, _SCOPES, autoLogin:autoLogin());
    _endpoint = new Timecard(auth);
    _endpoint.rootUrl = _ROOT_URL;
    _endpoint.makeAuthRequests = true;
  }

  bool autoLogin() {
    switch (window.location.hash) {
      case "#/logout":
      case "#/leave":
        return false;
        break;
      default:
        return true;
        break;
    };
  }

  bool logged_in() {
    return _endpoint.auth.token != null;
  }

  Future login() {
    return _endpoint.auth.login();
  }

  void logout({String redirect_to: null}) {
    if (redirect_to == null) {
      redirect_to = "/";
    }
    String revoke_url = _REVOKE_URL + _endpoint.auth.token.data;
    var request = new HttpRequest();
    request.open("GET", revoke_url);
    request.onLoad.listen((_event) {
      _endpoint.auth.logout();
      window.location.hash = redirect_to;
      window.location.reload();
    });
    request.send();
  }
}

class EndpointService extends _EndpointService {
  final _CLIENT_ID = "636938638718.apps.googleusercontent.com";
  final _ROOT_URL = "http://localhost:8080/";
}

class MeService {
  EndpointService _endpointService;
  Future _loaded;
  Http _http;
  User user;

  MeService(Http this._http, EndpointService this._endpointService) {
    var loadMe = _loadMe();
    if (loadMe != null) {
      _loaded = Future.wait([_loadMe()]);
    }
  }

  Future _loadMe() {
    if (!_endpointService.autoLogin()) {
      return null;
    }
    return _endpointService.endpoint.me.get().then((response) {
      user = response;
    })
    .catchError((error) {
      window.location.hash = "/signup";
    }, test: (e) => e is APIRequestError);
  }

  Future get() {
    if (_loaded == null) {
      _loaded = Future.wait([_loadMe()]);
    }
    if (user == null && _loaded != null) {
      return _loaded.then((_) {
        return user;
      });
    }
    return new Future.value(user);
  }

  Future create(String name) {
    var new_user = new MainApiV1MessageUserRequest.fromJson({});
    new_user.name = name;
    return _endpointService.endpoint.me.create(new_user).then((response) {
      user = response;
      return user;
    });
  }

  Future update() {
    return _endpointService.endpoint.me.update(user).then((response) {
      user = response;
      return user;
    });
  }

  Future delete() {
    return _endpointService.endpoint.me.delete(user);
  }
}
