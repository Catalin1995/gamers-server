app.controller('MainPageController', function ($scope, $http) {


	$scope.id_user = Cookies.get("user_id");

	$scope.games = {};
	$scope.number_of_games = 0;
	$scope.users = {};
	$scope.number_of_users = 0;
	$scope.feeds = {};
	$scope.myMsg = '';
	$scope.chat_text = '';

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

	$scope.refresh = function(){
		$http.get('/api/users/'+$scope.id_user+'/globalchat').success(function(data){
			$scope.globalchat = data['body'];
			$scope.chat_text = '';
			createString($scope.globalchat)
		});
		textarea.scrollTop = textarea.scrollHeight;
	}

	createString = function(data){
		for(i=0;i<data.length;i++){
			$scope.chat_text = $scope.chat_text + data[i]['user_name'] + ': ' + data[i]['content'] + '\n';
		}
	}

	var textarea = document.getElementById('comment');
	$scope.refresh()

	$scope.sendMessage = function() {
		$http.post('/api/users/' + $scope.id_user + '/globalchat', {consumer_key: Cookies.get('consumer_key'), secret_key: Cookies.get('secret_key'), content: $scope.myMsg})
		.success(function(data){

		});
		$scope.refresh()
	}
});
