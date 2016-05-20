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

    $scope.external_paws = [];

    $scope.setup = function() {
      $scope.loadingSearch = false;
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
      $scope.loadingSearch = true;
      var file = $scope.fileToUpload;
      console.log('file is ' );
      console.dir(file);
      var uploadUrl = "/api/v1/pawsphoto";
      fileUpload.uploadFileToUrl(file, uploadUrl, function(response) {
        console.log('success', response);
        $scope.paws = response.data.images;
        console.log($scope.paws);
        $scope.loadingSearch = false;
      });
    };

    // $scope.addToExternalFavorite = function(inputPawName, inputPawDescription, inputPawImage) {
    //   $http.post('api/v1/external_paws',
    //     {'name': inputPaw.name, 'description':  inputPaw.description, 'image':inputPaw.image})
    //   .then(
    //       console.log(inputPaw)
    //     );
    // };

    // $scope.setup = function(){
    //   $http.get('/api/v1/pawsphoto').then(function(response){
    //     $scope.externalpaw = response.data;
    //   });
    // };

    $scope.addToExternalFavorite = function(inputPaw) {
      console.log(inputPaw);
      var params = {
        name: inputPaw.petName,
        breed: inputPaw.breed,
        description :inputPaw.description,
        image: inputPaw.imageUrl,
        url: inputPaw.pageUrl
      };
      console.log(params);

      $http.post('/api/v1/external_paws', params).then(function(response) {
        console.log(response);
        // $scope.external_paws.push(newFavorite);
      });
    };
      
    

    window.$scope = $scope;
  });
})();
