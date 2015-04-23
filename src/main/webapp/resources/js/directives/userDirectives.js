/**
 * Created by thuynghi on 4/22/2015.
 */
userDirective.directive("userAdd", function () {
    return {
        restrict: 'E',
        templateUrl: "user-add.html"
    };
});

userDirective.directive("userList", function () {
    return {
        restrict: "A",
        templateUrl: "user-list.html"
    };
});

userDirective.directive("userTabs", function () {
    return {
        restrict: "E",
        templateUrl: "user-tabs.html",
        controller: function () {
            this.tab = 1;

            this.isSet = function (checkTab) {
                return this.tab === checkTab;
            };

            this.setTab = function (activeTab) {
                this.tab = activeTab;
            };
        },
        controllerAs: "tab"
    };
});

