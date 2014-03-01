library edit_user;

import "package:angular/angular.dart";

@NgComponent(
  selector: "edit_user-component",
  templateUrl: "packages/timecard_client/component/edit_user.html",
  cssUrl: "//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css",
  publishAs: "c"
)
class EditUserComponent {
  @NgTwoWay("a")
  var a;
}
