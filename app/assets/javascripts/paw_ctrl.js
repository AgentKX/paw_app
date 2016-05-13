/* global angular */
(function() {
  "use strict";
  angular.module("app").controller("pawCtrl", function($scope, $http) {
    $scope.setup = function() {

    };
    $scope.uploadFile = function(file) {

    }

    $scope.searchPaw = function(inputUrl) {
      console.log(inputUrl);
      $http.get('/api/v1/paws.json?image_url=' + inputUrl).then(function(response) {
        $scope.paws = response.data.images;
        console.log($scope.paws);
      });
    };
    window.$scope = $scope;
  });
})();
