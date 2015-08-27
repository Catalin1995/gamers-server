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
				window.location.replace("/#/main");
		  }).
		  error(function(data, status, headers, config) {
  			$scope.key = data;
				alert("Password or account is incorrect!");
		  });
	}

	$scope.create = function(){
		$http.put('create.json', {user: $scope.new_user}).
			success(function(data, status, headers, config) {
				$scope.rezultat = data;
			}).
			error(function(data, status, headers, config) {
				$scope.rezultat = data;
			});
	}

});
