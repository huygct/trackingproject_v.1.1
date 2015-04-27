/**
 * Created by Nghi Tran on 4/22/2015.
 */
userController.controller('userController', ['$scope', '$http', function($scope, $http){
    // Models (i.e. data)
    $scope.users = [];
    $scope.newUser = {};

    // Use $http service to load the data
    $http.get('userList').success(function(userList){
        $scope.users = userList;
        _setIndexes();
    });

    $scope.addUser = function() {

        // Note: $scope.newUser is set through two-way data binding with
        // the new user form in the view
        var newUser = $scope.newUser;
        newUser.state = "normal";
        newUser.index = $scope.users.length;

        $http.post('addUser', newUser)
            .success(function(data, status, headers, config) {
                $scope.users.push(newUser);
        })
        $scope.newUser = {};
    };

    $scope.deleteUser = function(user) {
        if (user.state == "deleted") {
            $http.delete ('deleteUser/' + user.id)
                .success(function (response) {
                    $scope.users.splice(user.index, 1);
                    _setIndexes();
            })
        } else {
            user.state = "deleted";
        }
    };

    $scope.undoDelete = function(user) {
        user.state = "normal";
    };

    $scope.editUser = function(user) {
        user.name = user.name;
        user.email = user.email;
        user.state = "edit";
    };

    $scope.saveUser = function(user) {
        // Probably have some Ajax post or patch request
        user.state = "normal";
    };

    $scope.cancelEdit = function(user) {
        user.name = user.name;
        user.address = user.email;
        user.state = "normal";
    };

    // Internal Methods
    function _setIndexes() {
        $scope.users.forEach(function(user, index) {
            user.index = index;
//            console.log(index);
        });
    }

/*
    //
    $scope.users = [];
    $scope.fetchUserList = function () {
        $http.get('userList').success(function (userList) {
            $scope.users = userList;
//                            console.log(userList);
        });
    };

    $scope.addNewCar = function (newCar) {
        $http.post('cars/addCar/' + newCar).success(function () {
            $scope.fetchUserList();
        });
        $scope.carName = '';
    };

    $scope.removeUser = function () {
        console.log("aaaaaaaaaaaaaaa")
        $http.delete('removeUser').success(function () {
            $scope.fetchUserList();
        });

    };

    $scope.fetchUserList();
*/

}]);
