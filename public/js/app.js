var app = angular.module('app', ['ngRoute', 'ngResource']);

app.config(['$routeProvider',
  function($routeProvider) {

    $routeProvider

    .when('/', {
      templateUrl: 'partials/login/login.html',
      controller: "IndexPageController",
    })

    .when('/index', {
      templateUrl: 'partials/login/login.html',
      controller: "IndexPageController",
    })

    .when('/main', {
      templateUrl: 'partials/login/main.html',
      controller: "MainPageController",
    });

  }]);
