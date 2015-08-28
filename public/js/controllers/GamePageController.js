app.controller('GamePageController', function ($scope, $http, $routeParams) {

  $http.get("api/games/" + $routeParams.id).success(function(data, status, headers, config) {
    $scope.game = data['body'];
  }).
  error(function(data, status, headers, config) {
  });

  $http.get("api/games/" + $routeParams.id + '/gamefeeds').success(function(data, status, headers, config) {
    $scope.available_feeds = data['body']['available'];
    $scope.unavailable_feeds = data['body']['unavailable'];
  }).
  error(function(data, status, headers, config) {
  });

});
