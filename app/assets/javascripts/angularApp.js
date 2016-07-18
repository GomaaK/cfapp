// AngularJS for client-side

var angularApp = angular.module('onlineStore',['ngResource']);

$(document).on("turbolinks:load", function(){
  angular.bootstrap(document.body, ['onlineStore'])
});

angularApp.factory('models', ['$resource', function($resource){
  var orders_model = $resource("/orders/:id.json", {id: "@id"});
  var products_model = $resource("/products/:id.json", {id: "@id"});
  var users_model = $resource("/users/:id.json", {id: "@id"});
  
  var x = {
    orders: orders_model,
    products: products_model,
    users: users_model
  };
  return x;
}]);

angularApp.controller('ordersCtrl', ['$scope', 'models', function($scope, models){
  $scope.orders = models.orders.query();
  $scope.products = models.products.query();
  $scope.users = models.users.query();

  // add new order via form
  $scope.addOrder = function(){
    // if product or user field is empty, alert message
    if(!$scope.newOrder.product_id || !$scope.newOrder.user_id) { alert("Please be sure to choose a product and user!"); return; }

    order = models.orders.save($scope.newOrder, function(){
      recent_order = models.orders.get({id: order.id});
      $scope.orders.push(recent_order);
      $scope.newOrder = '';
    });
  };

  // change shipped status via checkbox
  $scope.changeShipped = function(order) {
    order.shipped = !order.shipped;
    models.orders.save(order); // returns POST...404 (Not Found)
    console.log(order.shipped);  //test to make sure change function works
  };

  // delete order via form glyphichon trashcan
  $scope.deleteOrder = function(order){
    models.orders.delete(order);
    $scope.orders.splice($scope.orders.indexOf(order), 1);
  };

}]);