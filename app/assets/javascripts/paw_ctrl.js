/* global angular */
(function() {
  "use strict";


  angular.module("app").directive('fileModel', ['$parse', function($parse) {
    return {
      restrict: 'A',
      link: function(scope, element, attrs) {
        var model = $parse(attrs.fileModel);
        var modelSetter = model.assign;

        element.bind('change', function() {
          scope.$apply(function() {
            modelSetter(scope, element[0].files[0]);
          });
        });
      }
    };
  }]);

  angular.module("app").service('fileUpload', ['$http', function($http) {
    this.uploadFileToUrl = function(file, uploadUrl, successCallback) {
      var fd = new FormData();
      fd.append('photo', file);
      $http.post(uploadUrl, fd, {
        transformRequest: angular.identity,
        headers: {'Content-Type': undefined}
      })
      .success(successCallback)
      .error(function(response) {
        console.log('error', response);
      });
    };
  }]);

  angular.module("app").controller("pawCtrl", function($scope, fileUpload, $http) {
    $scope.setup = function() {

    };
    $scope.uploadFile = function(file) {

    };

    $scope.searchPaw = function(inputUrl) {
      console.log(inputUrl);
      $http.get('/api/v1/paws.json?image_url=' + inputUrl).then(function(response) {
        $scope.paws = response.data.images;
        console.log($scope.paws);
      });
    };

    $scope.searchPaw2 = function() {

      var file = $scope.fileToUpload;
      console.log('file is ' );
      console.dir(file);
      var uploadUrl = "/api/v1/pawsphoto";
      fileUpload.uploadFileToUrl(file, uploadUrl, function(response) {
        console.log('success', response);
        $scope.paws = response.data.images;
        console.log($scope.paws);
      });
    };

    $scope.addToExternalFavorite = function(inputPaw) {
      $http.post('api/v1/external_paws',{'name': inputPaw.name, 'description':  inputPaw.description})
      .then(
          console.log(inputPaw)
        );
    };
      // $http({
      //   method: 'POST',
      //   url: '/api/v1/pawsphoto',
      //   headers: {
      //     'Content-Type': 'multipart/form-data'
      //   },
      //   data: {
      //     data: model,
      //     file: file
      //   },
      //   transformRequest: customFormDataObject
      // });
    

    window.$scope = $scope;
  });
})();
