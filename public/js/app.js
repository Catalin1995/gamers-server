var app = angular.module('app', ['ngRoute', 'ngResource']);

// app.config(['$locationProvider', function($locationProvider) {
//   $locationProvider.html5Mode(true);
// }]);

app.config(['$routeProvider',
function($routeProvider) {

  $routeProvider

  .when('/', {
    templateUrl: 'partials/login/login.html',
    controller: "IndexPageController",
  })

  .when('/friend', {
    templateUrl: 'partials/login/friend.html',
    controller: "FriendPageController",
  })

  .when('/edit', {
    templateUrl: 'partials/login/edit.html',
    controller: "EditPageController",
  })

  .when('/main', {
    templateUrl: 'partials/login/main.html',
    controller: "MainPageController",
  })

  .when('/games/:id', {
    templateUrl: 'partials/login/game.html',
    controller: "GamePageController",
  })

  .when('/index', {
    templateUrl: 'partials/login/login.html',
    controller: "IndexPageController",
  });

  // .otherwise({
  //   redirectTo: function(current, path, search) {
  //     if(search.goto) {
  //       return "/" + search.goto
  //     } else {
  //       return "/main"
  //     }
  //   }
  // });

}]);
