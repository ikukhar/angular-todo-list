@todo_list.controller 'ProjectsController', ['$scope', '$location', '$http', ($scope, $location, $http) ->
  $scope.projects = []
  $http.get('./projects.json').success((data) ->
    $scope.projects = data
  )

  $scope.sortableOptions = {
    axis: 'y',
    update: (e, ui) ->
      console.log e
      console.log ui
  }
]
