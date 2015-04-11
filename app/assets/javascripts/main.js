var app = angular.module("MyApp", ['ngResource', 'googlechart']);

app.controller('TweetsController', ['$scope', '$http', '$resource', function ($scope, $http, $resource) {

    $scope.url = '/search'; // The url of our search

    // The function that will be executed on button click (ng-click="search()")
    $scope.search = function () {

        $http.get($scope.url + '/' + $scope.keywords).
            success(function (data, status) {
                console.log("searched Successfully");
//                console.log(data.counts)
                $scope.status = status;
                $scope.data = data;
                $scope.results = data.tweets; // Show result from server
                $scope.counts = data.counts;

                //create chart
                var chart1 = {};
                chart1.type = "PieChart";
                chart1.data = data.counts;
                chart1.data.unshift(["username", "count"]);
                chart1.options = {
                    displayExactValues: true,
                    is3D: true,
                    chartArea: {left: 10, top: 10, bottom: 0, height: "100%"}
                };

                $scope.chart = chart1;

            })
            .
            error(function (data, status) {
                console.log("searched failed");
                $scope.data = data || "Request failed";
                $scope.status = status;
            });
    };
}]);























