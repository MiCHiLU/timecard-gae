library footer;

import "dart:html";

import "package:angular/angular.dart";
import 'package:intl/intl.dart';

@NgComponent(
  selector: "footer-component",
  templateUrl: "packages/timecard_client/component/footer.html",
  cssUrl: "//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css",
  publishAs: "c"
)
class FooterComponent {
  final year = new DateFormat("y").format(new DateTime.now());
}
