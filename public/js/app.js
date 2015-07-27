var app = angular.module('app', ['ngRoute', 'ngResource']);

app.config(['$routeProvider',
  function($routeProvider) {
    $routeProvider
    // .when('/students', {
    //   templateUrl: "partials/students/list.html",
    //   controller: "StudentListController"
    // })

    .when('/', {
      controller: "IndexPageController"
    })

    .when('/main', {
      controller: "MainPageController"
    });

  }]);
