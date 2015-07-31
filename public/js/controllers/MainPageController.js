app.controller('MainPageController', function ($scope, $http) {


	$scope.id_user = Cookies.get("user_id");

	$scope.games = '';
	$scope.number_of_games = 0;
	$scope.users = '';
	$scope.number_of_users = 0;
	$scope.feeds = 'asd';

	$scope.logout = function(){
		Cookies.remove('user_id');
		Cookies.remove('consumer_key');
		Cookies.remove('secret_key');

		$http.delete('logout.json', {id: '11'}).
			success(function(data, status, headers, config) {
				$scope.t = data;
				// window.location.replace("/index");

			}).
			error(function(data, status, headers, config) {
				$scope.t = data;
			});


	}

	$scope.get_games = function(){
		$http.get('games.json').success(function(data){
			$scope.games = data['body'];
			$scope.number_of_games = $scope.games.length;
		});
		// console.log($scope.games);
	}

	$scope.get_games()

	$scope.get_users = function(){
		$http.get('users.json').success(function(data){
			$scope.users = data['body'];
			$scope.number_of_users = $scope.users.length;
		});
	}


	$scope.get_user_info = function(){
		$http.get('users/'+$scope.id_user+'.json').success(function(data){
			$scope.user = data['body'];
		});
	}

	$scope.get_feeds = function(){
		$http.get('feed.json').success(function(data){
			$scope.feeds = data['body'];
		});
	}

	$scope.get_feeds()
	$scope.get_users()
	$scope.get_user_info()

		// $scope.get_games()


		// phonecatControllers.controller('PhoneListCtrl', ['$scope', '$http',
		//   function ($scope, $http) {
		//     $http.get('phones/phones.json').success(function(data) {
		//       $scope.phones = data;
		//     });
		//
		//     $scope.orderProp = 'age';
		//   }]);

	// $scope.create = function(){
	// 	$http.put('create.json', {user: $scope.new_user}).
	// 		success(function(data, status, headers, config) {
	// 			$scope.rezultat = data;
	// 			// this callback will be called asynchronously
	// 			// when the response is available
	// 		}).
	// 		error(function(data, status, headers, config) {
	// 			$scope.rezultat = data;
	// 			// called asynchronously if an error occurs
	// 			// or server returns response with an error status.
	// 		});
	// }

});
