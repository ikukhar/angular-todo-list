@todo_list.controller 'UserRegistrationsController', ['$scope', '$auth', ($scope, $auth) ->

  $scope.$on('auth:registration-email-error', (e, reason) ->
    $scope.error = reason.errors[0]
  )

  $scope.handleRegBtnClick = ->
    $auth.submitRegistration($scope.registrationForm)
    .then( ->
      $auth.submitLogin({
        email: $scope.registrationForm.email,
        password: $scope.registrationForm.password
      })
    )

]
