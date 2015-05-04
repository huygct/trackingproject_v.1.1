/**
 * Created by thuynghi on 4/27/2015.
 */
function homeController($scope, $http) {

    $scope.tabs = [{
        title: 'One',
        url: 'one.tpl.html'
    }, {
        title: 'Two',
        url: 'two.tpl.html'
    }, {
        title: 'Three',
        url: 'three.tpl.html'
    }];

    $scope.currentTab = 'one.tpl.html';

    $scope.onClickTab = function (tab) {
        $scope.currentTab = tab.url;
    }

    $scope.isActiveTab = function(tabUrl) {
        return tabUrl == $scope.currentTab;
    }

    //-----------------------------------------------------------
    $scope.editMode = false;
    $scope.position = '';

    $scope.viewAllUserProfile = function(){
        $http.get('userProfileList').success(function(response){
            $scope.addressBooks = response;
        })
    }

    $scope.resetAddressBookField = function(){
        $scope.ab.firstName='';
        $scope.ab.lastName='';
        $scope.ab.phone = '';
        $scope.ab.email = '';
        $scope.editMode = false;
    }

    $scope.addUserProfile = function(ab) {
        $http.post('addUserProfile', ab).success(function(response){
            $scope.viewAllUserProfile();
//            $scope.ab.firstName='';
//            $scope.ab.lastName='';
//            $scope.ab.phone = '';
//            $scope.ab.email = '';
        }).error(function(response){
            console.log(response);
        })
    }

    $scope.updateAddressBook = function(ab) {
        $http.put('address/update/'+$scope.position, ab).success(function(response){
            $scope.ab.firstName='';
            $scope.ab.lastName='';
            $scope.ab.phone = '';
            $scope.ab.email = '';
            $scope.viewAllAddressBook();
            $scope.editMode = false;
        }).error(function(response){
            console.log(response);
        })
    }

    $scope.deleteAddressBook = function(id) {
        $http.delete('address/delete/' + id).success(function(response){
            $scope.viewAllAddressBook();
        }).error(function(response){
            console.log(response);
        })
    }

    $scope.deleteAllAddressBook = function(){
        $http.delete('address/delete/all').success(function(response){
            $scope.viewAllAddressBook();
        })
    }

    $scope.editAddressBook = function(pos, addressBook){
        $scope.position = pos;
        $scope.ab = addressBook;
        $scope.editMode = true;
    }

    $scope.viewAllUserProfile();
}