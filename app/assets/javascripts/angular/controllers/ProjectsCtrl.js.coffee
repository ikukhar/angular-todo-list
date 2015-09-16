@todo_list.controller 'ProjectsCtrl', ['$scope', '$location', '$http', ($scope, $location, $http) ->
  $scope.projects = []
  $http.get('./projects.json').success((data) ->
    $scope.projects = data
  )
]
