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


  app.controller("customersController", function($scope,$http) {
    
    var site = "localhost:3000";
    var page = "/app/WebServiceQueries/clients_SQL.rb";
    $http.get(site + page)
    .success(function(response) {$scope.names = response;});  


  });
/*

    function customersController($scope,$http) {
    var site = "localhost:3000";
    var page = "/app/WebServiceQueries/clients_SQL.rb";
    $http.get(site + page)
    .success(function(response) {$scope.names = response;});
}
*/
})();