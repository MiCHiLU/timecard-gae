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
  Storage localStorage = window.localStorage;

  bool _save_this_browser;
  bool get save_this_browser => _save_this_browser;
  set save_this_browser(bool value) {
    _save_this_browser = value;
    localStorage["save_this_browser"] = JSON.encode(value);
  }

  RememberMeComponent() {
    var value = localStorage["save_this_browser"];
    if (value == null) {
      _save_this_browser = false;
    } else {
      _save_this_browser = JSON.decode(value);
    }
  }
}
