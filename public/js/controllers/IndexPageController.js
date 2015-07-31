app.controller('IndexPageController', function ($scope, $http) {

	$scope.user = {};
	$scope.new_user = {};

	$scope.login = function(){
		$http.put('login.json', {user: $scope.user}).
		  success(function(data, status, headers, config) {
				$scope.key = data;
				Cookies.set('user_id', data.body.user_id);
				Cookies.set('consumer_key', data.body.consumer_key);
				Cookies.set('secret_key', data.body.secret_key);
				window.location.replace("/main");
		    // this callback will be called asynchronously
		    // when the response is available
		  }).
		  error(function(data, status, headers, config) {
  			$scope.key = data;
				alert("Password or account is incorrect!");
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
