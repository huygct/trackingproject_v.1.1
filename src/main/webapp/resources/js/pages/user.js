/**
 * Created by thuynghi on 4/17/2015.
 */
function userController($scope, $http) {
    //
    $scope.users = [];
    $scope.fetchUserList = function() {
        $http.get('home/userList').success(function(userList){
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

}
