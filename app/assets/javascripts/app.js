(function(){
  app = angular.module('welcome', ["ui.bootstrap"]);

  app.controller("clientsController", ['$scope', '$http',
    function($scope,$http) {
    
    getClients();

    function getClients() {
      $http.get("/clients.json")
      .success(function(response) {$scope.clients = response;}
        );  
    }

  }]);



})();