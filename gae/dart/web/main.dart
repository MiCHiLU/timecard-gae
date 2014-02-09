import 'package:intl/intl.dart';
import "package:angular/angular.dart";
import "package:timecard_dev_api/timecard_dev_api_browser.dart";
import "package:google_oauth2_client/google_oauth2_browser.dart";

@NgController(
    selector: "[app]",
    publishAs: "c")
class Controller {

  final CLIENT_ID = "636938638718.apps.googleusercontent.com";
  final SCOPES = ["https://www.googleapis.com/auth/userinfo.email"];
  final ROOT_URL = "http://localhost:8080/";
  GoogleOAuth2 auth;
  Timecard endpoint;
  bool logged_in = false;
  var user;

  Controller() {
    auth = new GoogleOAuth2(CLIENT_ID, SCOPES, tokenLoaded:get_user, autoLogin:true);
    endpoint = new Timecard(auth);
    endpoint.rootUrl = ROOT_URL;
    endpoint.makeAuthRequests = true;
  }

  void login() {
    auth.login().then(get_user);
  }

  void logout() {
    auth.logout();
    user = null;
    logged_in = false;
  }

  void get_user(_token) {
    endpoint.me.get().then((response) {
      user = response;
      logged_in = true;
    });
  }
}

@NgController(
    selector: "footer",
    publishAs: "c")
class Footer {
  final year = new DateFormat("y").format(new DateTime.now());
}

main() {
  var module = new Module()
    ..type(Controller)
    ..type(Footer);
  ngBootstrap(module:module);
}
