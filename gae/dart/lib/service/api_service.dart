library api_service;

import "dart:html";
import "dart:async";

class APIService {
  Model model;
  dynamic get comment;
  dynamic get issue;
  dynamic get me;
  dynamic get project;
  dynamic get user;
  dynamic get workload;
  dynamic new_user(data) => new Map();

  bool logged_in() {
  }

  Future login() {
  }

  void _redirect(redirect_to) {
    window.location.hash = redirect_to;
    window.location.reload();
  }

  void logout({String redirect_to: "/"}) {
    _redirect(redirect_to);
  }
}

class Model {
  Map<String, dynamic> _resource = new Map();
  dynamic get comment   => _resource["comment"] ;
  dynamic get issue     => _resource["issue"]   ;
  dynamic get me        => _resource["me"]      ;
  dynamic get project   => _resource["project"] ;
  dynamic get user      => _resource["user"]    ;
  dynamic get workload  => _resource["workload"];
  set comment   (dynamic data) => _resource["comment"]  = data;
  set issue     (dynamic data) => _resource["issue"]    = data;
  set me        (dynamic data) => _resource["me"]       = data;
  set project   (dynamic data) => _resource["project"]  = data;
  set user      (dynamic data) => _resource["user"]     = data;
  set workload  (dynamic data) => _resource["workload"] = data;
}
