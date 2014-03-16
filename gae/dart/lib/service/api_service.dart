library api_service;

import "dart:html";
import "dart:async";

import "package:angular/angular.dart";
import "package:google_oauth2_client/google_oauth2_browser.dart";
import "package:timecard_dev_api/timecard_dev_api_browser.dart";
import "package:timecard_dev_api/timecard_dev_api_client.dart";

class APIService {
  bool logged_in() {
  }

  Future login() {
  }

  Future _logout() {
  }

  void logout({String redirect_to: null}) {
    if (redirect_to == null) {
      redirect_to = "/";
    }
    _logout().then((_event) {
      window.location.hash = redirect_to;
      window.location.reload();
    });
  }
}

class EndpointServiceConfig {
  String client_id;
  String root_url;
}

class EndpointService implements APIService {
  final _REVOKE_URL = "https://accounts.google.com/o/oauth2/revoke?token=";
  final _SCOPES = ["https://www.googleapis.com/auth/userinfo.email"];

  Http _http;
  Timecard _endpoint;
  Timecard get endpoint => _endpoint;

  EndpointService(EndpointServiceConfig c, Http this._http) {
    GoogleOAuth2 auth = new GoogleOAuth2(c.client_id, _SCOPES, autoLogin:autoLogin());
    _endpoint = new Timecard(auth);
    _endpoint.rootUrl = c.root_url;
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

  Future _logout() {
    String revoke_url = _REVOKE_URL + _endpoint.auth.token.data;
    _http.get(revoke_url).then((_response) {
      _endpoint.auth.logout();
    });
  }
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
