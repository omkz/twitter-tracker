var app = angular.module("MyApp", ['ngResource']);

app.controller('TweetsController', ['$scope', '$http','$resource', function($scope, $http, $resource) {

    $scope.url = '/search'; // The url of our search

    // The function that will be executed on button click (ng-click="search()")
    $scope.search = function() {

        $http.get($scope.url+'/'+$scope.keywords).
            success(function(data, status) {
                console.log("searched Successfully");
                $scope.status = status;
                $scope.data = data;
                $scope.results = data; // Show result from server
            })
            .
            error(function(data, status) {
                console.log("searched failed");
                $scope.data = data || "Request failed";
                $scope.status = status;
            });
    };
}]);


























