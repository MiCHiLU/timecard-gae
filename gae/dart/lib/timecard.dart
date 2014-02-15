library timecard;

import "dart:html";

import "package:angular/angular.dart";
import "package:google_oauth2_client/google_oauth2_browser.dart";
import "package:timecard_dev_api/timecard_dev_api_browser.dart";
import 'package:intl/intl.dart';

@NgController(
    selector: "[app]",
    publishAs: "c")
class Controller {

  final CLIENT_ID = "636938638718.apps.googleusercontent.com";
  final SCOPES = ["https://www.googleapis.com/auth/userinfo.email"];
  final ROOT_URL = "http://localhost:8080/";
  final REVOKE_URL = "https://accounts.google.com/o/oauth2/revoke?token=";
  GoogleOAuth2 auth;
  Timecard endpoint;
  var token;
  var user;

  Controller() {
    auth = new GoogleOAuth2(CLIENT_ID, SCOPES, tokenLoaded:get_user, autoLogin:true);
    endpoint = new Timecard(auth);
    endpoint.rootUrl = ROOT_URL;
    endpoint.makeAuthRequests = true;
  }

  bool logged_in() {
    if (token == null) {
      return false;
    } else {
      return true;
    }
  }

  void login() {
    auth.login().then(get_user);
  }

  void logout() {
    String revoke_url = REVOKE_URL + token.data;
    var request = new HttpRequest();
    request.open("GET", revoke_url);
    request.onLoad.listen((event) {
      auth.logout();
      token = null;
      user = null;
    });
    request.send();
  }

  void get_user(auth_token) {
    token = auth_token;
    endpoint.me.get().then((response) {
      user = response;
    });
  }
}

@NgController(
    selector: "footer",
    publishAs: "c")
class Footer {
  final year = new DateFormat("y").format(new DateTime.now());
}

startTimecardApp() {
  var module = new Module()
    ..type(Controller)
    ..type(Footer);
  ngBootstrap(module:module);
}
