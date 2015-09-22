@todo_list.controller 'UserSessionsController', ['$scope', '$location', ($scope, $location) ->

  $scope.$on('auth:login-error', (e, reason) ->
    $scope.error = reason.errors[0]
  )

]
