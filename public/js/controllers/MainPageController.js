app.controller('MainPageController', function ($scope, $http) {


	$scope.id_user = Cookies.get("user_id");

	$scope.games = {};
	$scope.number_of_games = 0;
	$scope.users = {};
	$scope.number_of_users = 0;
	$scope.feeds = {};
	$scope.myMsg = '';

	$http.get('/api/games.json').success(function(data){
		$scope.games = data['body'];
		$scope.number_of_games = $scope.games.length;
	});

	$http.get('/api/feed.json').success(function(data){
		$scope.feeds = data['body'];
	});

	$http.get('/api/users/'+$scope.id_user).success(function(data){
		$scope.user = data['body'];
	});

	$http.get('/api/users.json').success(function(data){
		$scope.users = data['body'];
		$scope.number_of_users = $scope.users.length;
	});

	$scope.logout = function(){
		Cookies.remove('user_id');
		Cookies.remove('consumer_key');
		Cookies.remove('secret_key');
		window.location.replace("/#/index");
	};
	var textarea = document.getElementById('comment');

	$scope.chat_text = '';

  $scope.sendMessage = function() {
		$scope.chat_text = $scope.chat_text + $scope.myMsg + '\n';
  	$scope.myMsg = '';
		textarea.scrollTop = textarea.scrollHeight;
	}
});
