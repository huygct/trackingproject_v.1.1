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
            $scope.userProfiles = response;
        })
    }

    $scope.viewUserProfile = function () {
        $http.get('userProfile').success(function(response){
            $scope.userProfile = response;
        })
    }

    $scope.resetUserProfile = function(){
//        $scope.ab.id = 0;
//        $scope.ab.badgeId = 0;
//        $scope.ab.badgeIdMentor = 0;
//        $scope.ab.school = "";
//        $scope.ab.degree = "";
//        $scope.ab.graduateDate = "";
//        $scope.ab.finalStudyResult = 0;
//        $scope.ab.toeic = 0;
//        $scope.ab.joinDate = "";
//        $scope.ab.workRole = "";
//        $scope.ab.experienceYears = 0;
//        $scope.ab.experienceYearsInCurrentRole = 0;
//        $scope.ab.professionalCertification = false;
//        $scope.ab.overseaWorkingExperience = false;
//        $scope.ab.policeClearanceStatus = "";
//        $scope.ab.cvUrl = "";
//        $scope.ab.imageUser = "";
//        $scope.ab.place = "";
//        $scope.ab.gender = false;
//        $scope.ab.needTracking = true;
//        $scope.ab.skypeId = "";
//        $scope.ab.ipAddress = "";
//        $scope.ab.generalStatus = "";
        $scope.ab = "";
        $scope.editMode = false;
    }

    $scope.addUserProfile = function(ab) {
        $http.post('addUserProfile', ab).success(function(response){
            $scope.viewUserProfile();
            $scope.ab="";
        }).error(function(response){
            console.log(response);
        })
    }

    $scope.updateUserProfile = function(ab) {
        $http.put('updateUserProfile'+$scope.position, ab).success(function(response){
            $scope.ab = "";
            $scope.viewUserProfile();
            $scope.editMode = false;
        }).error(function(response){
            console.log(response);
        })
    }

    $scope.deleteUserProfile = function(id) {
        $http.delete('address/delete/' + id).success(function(response){
            $scope.viewUserProfile();
        }).error(function(response){
            console.log(response);
        })
    }

    $scope.deleteAllUserProfile = function(){
        $http.delete('address/delete/all').success(function(response){
//            $scope.viewAllAddressBook();
        })
    }

    $scope.editUserProfile = function(userProfile){
        $scope.ab = userProfile;
        $scope.editMode = true;
    }

    $scope.viewUserProfile();
}