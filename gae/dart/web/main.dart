library timecard;

import "package:angular/angular.dart";
import "package:angular/routing/module.dart";
import "package:di/di.dart";
import "package:logging/logging.dart";

import "package:timecard_client/timecard.dart";
import "package:timecard_client/routing/timecard_router.dart";
import "package:timecard_client/component/nav.dart";
import "package:timecard_client/component/footer.dart";
import "package:timecard_client/component/edit_user.dart";

// Temporary, please follow https://github.com/angular/angular.dart/issues/476
@MirrorsUsed(
  targets: const ["timecard", "timecard_routing"],
  override: "*")
import "dart:mirrors";

class MyAppModule extends Module {
  MyAppModule() {
    type(Controller);
    type(NavComponent);
    type(FooterComponent);
    type(EditUserComponent);
    value(RouteInitializerFn, timecardRouteInitializer);
    factory(NgRoutingUsePushState,
        (_) => new NgRoutingUsePushState.value(false));
  }
}

void main() {
  Logger.root.level = Level.FINEST;
  Logger.root.onRecord.listen((LogRecord r) { print(r.message); });
  ngBootstrap(module: new MyAppModule());
}
