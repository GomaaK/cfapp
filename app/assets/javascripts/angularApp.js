// AngularJS for client-side

var angularApp = angular.module('onlineStore',[]);

angularApp.controller('ordersCtrl', ['$scope', function($scope){
  $scope.customerName = "John Smith";
  $scope.orders =[
    {id: 1, total: 24, product_id: 1, user_id: 1},
    {id: 2, total: 7, product_id: 1},
    {id: 3, total: 42, product_id: 1, user_id: 1}
  ];

  $scope.addOrder = function(){
    if(!$scope.newOrder.product_id || $scope.newOrder.total === ''){ return; }   // if there is an empty field
    $scope.orders.push($scope.newOrder);
  }

  $scope.deleteOrder = function(order){
    $scope.orders.splice($scope.orders.indexOf(order), 1);
  }

}]);