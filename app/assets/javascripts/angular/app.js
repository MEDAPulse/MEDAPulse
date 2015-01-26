(function(){
  meda = angular.module('MEDA', ['templates', 'ngRoute', 'controllers']);
  
meda.config(['$routeProvider', function ($routeProvider) {
$routeProvider
      .when('/welcome',
        { templateUrl: "index.html",
        controller: 'homeController' });
}]);

controllers = angular.module('controllers',[])

meda.controller("clientsController", ['$scope', '$http',
  function($scope,$http) {
  
  $http.get("/clients.json")
  .success(function(response) {$scope.clients = response;}
    );  

}]);

controllers.controller("homeController", [ '$scope',
  function($scope) {

  }]);

})();