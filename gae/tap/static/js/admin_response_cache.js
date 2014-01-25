// Generated by CoffeeScript 1.6.3
"use strict";
angular.module("app", ["app.controllers"]);

angular.module("app.controllers", []).controller("Ctrl", [
  "$scope", "$log", function($scope, $log) {
    $scope.$watch("host", function(newValue, oldValue) {
      if (newValue === "") {
        if ($scope.DEBUG) {
          $scope.application_url = "";
        } else {
          $scope.application_url = "http://" + $scope.app_id + ".appspot.com";
        }
      } else {
        $scope.application_url = "//" + newValue;
      }
      if (!$scope.$$phase) {
        $scope.$apply();
      }
    });
  }
]);

angular.element(document).ready(function() {
  return angular.bootstrap(document, ["app"]);
});