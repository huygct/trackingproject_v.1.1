/**
 * Created by ntnngoc on 5/5/2015.
 */

controllers.controller('courseController',['$Scope', '$http', function($scope, $http){
    $scope.courses = [];
    load();
    function load(){
        $http.get('courseList').success(function(courseList){
           $scope.courses = courseList;
        });
    }
    $scope.addCourse = function(){
        var newCourse
    }
}]);