library timecard_controller;

import "dart:html";

import "package:angular/angular.dart";
import "package:google_oauth2_client/google_oauth2_browser.dart";
import "package:timecard_dev_api/timecard_dev_api_browser.dart";
import "package:timecard_dev_api/timecard_dev_api_client.dart";
import 'package:intl/intl.dart';

import "package:timecard_client/service/api_service.dart";

@NgController(
    selector: "[app]",
    publishAs: "a")
class Controller {
  APIService _apiService;
  MeService me;

  Controller(APIService this._apiService, MeService this.me);

  bool loading() {
    return false;
  }

  bool logged_in() {
    return _apiService.logged_in();
  }

  void login() {
    _apiService.login().whenComplete(() {
      switch (window.location.hash) {
        case "#/logout":
        case "#/leave":
          window.location.hash = "";
          break;
      };
    });
  }

  void logout({String redirect_to: "/logout"}) {
    _apiService.logout(redirect_to: redirect_to);
  }

  void me_create(String name) {
    me.create(name).then((_) {
      window.location.hash = "";
    });
  }

  void me_update() {
    me.update();
  }

  void me_delete() {
    me.delete().then((_) {
      logout(redirect_to: "/leave");
    });
  }
}
