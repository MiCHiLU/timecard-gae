part of timecard;

class TimecardRouteInitializer implements RouteInitializer {
  init(Router router, ViewFactory view) {
    router.root
      ..addRoute(
          name: "logout",
          path: "/logout",
          enter: view("views/logout.html")
      )
      ..addRoute(
          name: "index",
          path: "/",
          enter: view("views/index.html"),
          defaultRoute: true
      );
  }
}
