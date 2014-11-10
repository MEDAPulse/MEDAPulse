(function(){
  app = angular.module('welcome', []);
/*
    app.controller("MyCtrl", function($scope) {
    $scope.friends = [
      { name: "Peter",   age: 20 },
      { name: "Pablo",   age: 55 },
      { name: "Linda",   age: 20 },
      { name: "Marta",   age: 37 },
      { name: "Othello", age: 20 },
      { name: "Markus",  age: 32 }
    ];
  });
*/


  app.controller("customersController", ['$scope', '$http',
    function($scope,$http) {
    
    $http.get("/clients.json")
    .success(function(response) {$scope.names = response;}
      );  

  }]);

})();