library google_cloud_endpoints_api_service;

import "dart:async";
import "dart:html";

import "package:angular/angular.dart";
import "package:google_oauth2_client/google_oauth2_browser.dart";
import "package:timecard_dev_api/timecard_dev_api_browser.dart";
import "package:timecard_dev_api/timecard_dev_api_client.dart";

import "package:timecard_client/service/api_service.dart";

class GoogleCloudEndpointModel extends Model {
  Future _loaded;
  GoogleCloudEndpointService _api;

  GoogleCloudEndpointModel(GoogleCloudEndpointService this._api) {
    var load = _get_me();
    if (load != null) {
      _loaded = Future.wait([load]);
    }
  }

  Future _get_me() {
    if (!_api.autoLogin()) {
      return null;
    }
    return _api.me.get().then((response) {
      me = response;
    })
    .catchError((error) {
      window.location.hash = "/signup";
    }, test: (e) => e is APIRequestError);
  }
}

class GoogleCloudEndpointServiceConfig {
  String client_id;
  String root_url;
}

class GoogleCloudEndpointService extends APIService {
  final _REVOKE_URL = "https://accounts.google.com/o/oauth2/revoke?token=";
  final _SCOPES = ["https://www.googleapis.com/auth/userinfo.email"];

  Http _http;
  Timecard _endpoint;

  dynamic get comment   => _endpoint.comment ;
  dynamic get issue     => _endpoint.issue   ;
  dynamic get me        => _endpoint.me ;
  dynamic get project   => _endpoint.project ;
  dynamic get user      => _endpoint.user    ;
  dynamic get workload  => _endpoint.workload;

  GoogleCloudEndpointService(GoogleCloudEndpointServiceConfig c, Http this._http) {
    GoogleOAuth2 auth = new GoogleOAuth2(c.client_id, _SCOPES, autoLogin:autoLogin());
    _endpoint = new Timecard(auth);
    _endpoint.rootUrl = c.root_url;
    _endpoint.makeAuthRequests = true;
    model = new GoogleCloudEndpointModel(this);
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

  MainApiV1MessageUserRequest new_user(data) => new MainApiV1MessageUserRequest.fromJson(data);

  bool logged_in() {
    return _endpoint.auth.token != null;
  }

  Future login() {
    return _endpoint.auth.login();
  }

  void logout({String redirect_to: "/"}) {
    String revoke_url = _REVOKE_URL + _endpoint.auth.token.data;
    _http.get(revoke_url).then((_response) {
      _endpoint.auth.logout();
      _redirect(redirect_to);
    });
  }
}
