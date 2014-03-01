library timecard_controller;

import "dart:html";

import "package:angular/angular.dart";
import "package:google_oauth2_client/google_oauth2_browser.dart";
import "package:timecard_dev_api/timecard_dev_api_browser.dart";
import 'package:intl/intl.dart';

@NgController(
    selector: "[app]",
    publishAs: "a")
class Controller {

  final CLIENT_ID = "636938638718.apps.googleusercontent.com";
  final REVOKE_URL = "https://accounts.google.com/o/oauth2/revoke?token=";
  final ROOT_URL = "http://localhost:8080/";
  final SCOPES = ["https://www.googleapis.com/auth/userinfo.email"];

  GoogleOAuth2 auth;
  Timecard endpoint;
  var user;

  Controller() {
    bool autoLogin;
    switch (window.location.hash) {
      case "#/logout":
        autoLogin = false;
        break;
      default:
        autoLogin = true;
    };
    auth = new GoogleOAuth2(CLIENT_ID, SCOPES, tokenLoaded:post_login, autoLogin:autoLogin);
    endpoint = new Timecard(auth);
    endpoint.rootUrl = ROOT_URL;
    endpoint.makeAuthRequests = true;
  }

  bool logged_in() {
    return auth.token != null;
  }

  void login() {
    auth.login().then(post_login);
  }

  void post_login(_token) {
    switch (window.location.hash) {
      case "#/logout":
        window.location.hash = "";
        break;
    };
    get_user();
  }

  void logout() {
    String revoke_url = REVOKE_URL + auth.token.data;
    var request = new HttpRequest();
    request.open("GET", revoke_url);
    request.onLoad.listen((_event) {
      auth.logout();
      window.location.hash = "/logout";
      window.location.reload();
    });
    request.send();
  }

  void get_user() {
    endpoint.me.get().then((response) {
      user = response;
    });
  }

  void me_update() {
    endpoint.me.update(user).then((response) {
      user = response;
    });
  }
}
