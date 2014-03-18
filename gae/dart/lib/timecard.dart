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
  APIService _api;
  dynamic get model => _api.model;

  Controller(APIService this._api);

  bool loading() {
    return false;
  }

  bool logged_in() {
    return _api.logged_in();
  }

  void login() {
    _api.login().whenComplete(() {
      switch (window.location.hash) {
        case "#/logout":
        case "#/leave":
          window.location.hash = "";
          break;
      };
    });
  }

  void logout({String redirect_to: "/logout"}) {
    _api.logout(redirect_to: redirect_to);
  }

  void me_create(String name) {
    var new_user = _api.new_user({});
    new_user.name = name;
    _api.me.create(new_user).then((response) {
      model.me = response;
      window.location.hash = "";
    });
  }

  void me_update() {
    _api.me.update(model.me).then((response) {
      model.me = response;
    });
  }

  void me_delete() {
    _api.me.delete(model.me).then((_response) {
      logout(redirect_to: "/leave");
    });
  }
}
