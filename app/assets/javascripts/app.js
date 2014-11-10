(function(){
  app = angular.module('welcome', []);

  app.controller("customersController", ['$scope', '$http',
    function($scope,$http) {
    
    $http.get("/clients.json")
    .success(function(response) {$scope.names = response;}
      );  
  }]);

})();