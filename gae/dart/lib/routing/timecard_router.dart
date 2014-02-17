library timecard_routing;

import 'package:angular/angular.dart';

timecardRouteInitializer(Router router, ViewFactory views) =>
    views.configure({
      "logout": ngRoute(
        path: "/logout",
        view: "view/logout.html"),
      "settings": ngRoute(
        path: "/settings",
        view: "view/settings.html"),
      "top": ngRoute(
        defaultRoute: true,
        path: "/",
        view: "view/top.html")
    });
