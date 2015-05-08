/**
 * Created by thuynghi on 5/6/2015.
 */
function reportController($scope, $http) {

    $scope.viewInformation = function () {
        $http.get('viewInformation').success(function (response) {
            $scope.information = response;

            pieChart($scope.information.male, $scope.information.female);

            var data = [$scope.information.yearExperiences_0, $scope.information.yearExperiences_1, $scope.information.yearExperiences_2, $scope.information.yearExperiences_3, $scope.information.yearExperiences_4, $scope.information.yearExperiences_5];
            barChart(data);
        })
    }

    $scope.viewInformation();

    $scope.options = {
        years: ["2014", "2015", "2016"],
        months: ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"]
    };

    $scope.viewInformationByMonth = function () {
        // Remember write controller for it
        $http.get('getInformationByMonth', {params: {month: $scope.date.choiceMonth, year: $scope.date.choiceYear}})
            .success(function (response) {
                $scope.informationByMonth = response;
        }).error(function (response) {
            console.log(response);
        })
    }

    //chart -------------------------------------------------------------------
    function pieChart(male, female) {
        // pie chart data
        var pieData = [
            {
                value: male,
                label: "Male",
                color: "#878BB6"
            },
            {
                value: female,
                label: "Female",
                color: "#4ACAB4"
            }
        ];
        // pie chart options
        var pieOptions = {
            segmentShowStroke: false,
            animateScale: true
        }
        // get pie chart canvas
        var gender = document.getElementById("gender").getContext("2d");
        // draw pie chart
        new Chart(gender).Pie(pieData, pieOptions);
    }

    function barChart(data) {
        // pie chart data
        var pieData = [
            {
                value: data[0],
                label: "<0.5",
                color: "#878BB6"
            },
            {
                value: data[1],
                label: "0.5-1 year",
                color: "#4ACAB4"
            },
            {
                value: data[2],
                label: "1-2 years",
                color: "#FF8153"
            },
            {
                value: data[3],
                label: "2-3 years",
                color: "#FFEA88"
            },
            {
                value: data[4],
                label: "3-5 years",
                color: "#00008B"
            },
            {
                value: data[5],
                label: "5+ years",
                color: "#8B008B"
            }
        ];
        // pie chart options
        var pieOptions = {
            segmentShowStroke: false,
            animateScale: true
        }
        // get pie chart canvas
        var experience = document.getElementById("experience").getContext("2d");
        // draw pie chart
        new Chart(experience).Pie(pieData, pieOptions);
    }
}