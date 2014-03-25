library remember_me;

import "dart:convert";
import "dart:html";
import "package:angular/angular.dart";

@NgComponent(
  selector: "remember_me-component",
  templateUrl: "packages/timecard_client/component/remember_me.html",
  applyAuthorStyles: true,
  publishAs: "c"
)
class RememberMeComponent {
  @NgTwoWay("a")
  var a;

  Storage _localStorage = window.localStorage;
  final String _key = "save_this_browser";
  final bool _default = false;

  bool get save_this_browser {
    var value = _localStorage[_key];
    if (value == null) {
      return _default;
    } else {
      return JSON.decode(value);
    }
  }
  set save_this_browser(bool value) {
    _localStorage[_key] = JSON.encode(value);
  }
}
