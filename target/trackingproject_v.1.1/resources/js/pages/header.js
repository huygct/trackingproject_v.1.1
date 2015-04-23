function LocationController($scope, $location) {
    if($location.$$absUrl.lastIndexOf('/user') > 0){
        $scope.activeURL = 'user';
    } else{
        $scope.activeURL = 'home';
    }
}