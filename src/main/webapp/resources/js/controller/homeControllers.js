/**
 * Created by thuynghi on 4/27/2015.
 */
function userController($scope, $http) {
    //
    $scope.users = [];
    $scope.fetchUserList = function() {
        $http.get('userList').success(function(userList){
            $scope.users = userList;
//                            console.log(userList);
        });
    };

    $scope.addNewCar = function(newCar) {
        $http.post('cars/addCar/' + newCar).success(function() {
            $scope.fetchUserList();
        });
        $scope.carName = '';
    };

    $scope.removeUser = function() {
        console.log("aaaaaaaaaaaaaaa")
        $http.delete('removeUser').success(function() {
            $scope.fetchUserList();
        });

    };

    $scope.fetchUserList();

    $scope.tabs = [
        { title:'Dynamic Title 1', content:'Dynamic content 1' },
        { title:'Dynamic Title 2', content:'Dynamic content 2', disabled: true }
    ];

    $scope.alertMe = function() {
        setTimeout(function() {
            alert('You\'ve selected the alert tab!');
        });
    };
}