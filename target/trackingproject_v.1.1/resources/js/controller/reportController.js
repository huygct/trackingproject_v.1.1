/**
 * Created by thuynghi on 5/6/2015.
 */
function reportController($scope, $http) {
    $scope.viewInformation = function(){
        $http.get('viewInformation').success(function(response){
            $scope.information = response;
        })
    }

    $scope.viewInformation();
}