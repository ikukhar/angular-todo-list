@todo_list.controller 'ProjectsController', ['$scope', '$location', '$http', ($scope, $location, $http) ->
  $scope.projects = []
  $http.get('./projects.json').success((data) ->
    $scope.projects = data
  )
]
