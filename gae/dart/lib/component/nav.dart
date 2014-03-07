library nav;

import "package:angular/angular.dart";

@NgComponent(
  selector: "nav-component",
  templateUrl: "packages/timecard_client/component/nav.html",
  cssUrl: "//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css",
  applyAuthorStyles: true,
  publishAs: "c"
)
class NavComponent {
  @NgTwoWay("a")
  var a;
}
