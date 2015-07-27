app.controller('IndexPageController', function ($scope, $http) {

	$scope.user = {};
	$scope.new_user = {};

	$scope.login = function(){
		$http.put('login.json', {user: $scope.user}).
		  success(function(data, status, headers, config) {
				$scope.key = data;
		    // this callback will be called asynchronously
		    // when the response is available
		  }).
		  error(function(data, status, headers, config) {
  			$scope.key = data;
				// called asynchronously if an error occurs
		    // or server returns response with an error status.
		  });
	}

	$scope.create = function(){
		$http.put('create.json', {user: $scope.new_user}).
			success(function(data, status, headers, config) {
				$scope.rezultat = data;
				// this callback will be called asynchronously
				// when the response is available
			}).
			error(function(data, status, headers, config) {
				$scope.rezultat = data;
				// called asynchronously if an error occurs
				// or server returns response with an error status.
			});
	}

});
