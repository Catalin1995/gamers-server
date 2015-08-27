app.controller('MainPageController', function ($scope, $http) {


	$scope.id_user = Cookies.get("user_id");

	$scope.games = {};
	$scope.number_of_games = 0;
	$scope.users = {};
	$scope.number_of_users = 0;
	$scope.feeds = {};

	$http.get('/api/games.json').success(function(data){
		$scope.games = data['body'];
		$scope.number_of_games = $scope.games.length;
	});

	$http.get('/api/feed.json').success(function(data){
		$scope.feeds = data['body'];
	});

	$http.get('/api/users/'+$scope.id_user+'.json').success(function(data){
		$scope.user = data['body'];
	});

	$http.get('users.json').success(function(data){
		$scope.users = data['body'];
		$scope.number_of_users = $scope.users.length;
	});


	$scope.logout = function(){
		Cookies.remove('user_id');
		Cookies.remove('consumer_key');
		Cookies.remove('secret_key');

		$http({ url: 'logout.json',
		method: 'DELETE',
		data: {id: 1}
		// headers: {"Content-Type": "application/json;charset=utf-8"}
	}).then(function(res) {
		console.log(res.data);
	}, function(error) {
		console.log(error);
	});
};


	// $http.delete('logout.json', data: {user: $scope.user}).
	// success(function(data, status, headers, config) {
	// 	$scope.t = data;
	// }).
	// error(function(data, status, headers, config) {
	// 	$scope.t = data;
	// });
});
