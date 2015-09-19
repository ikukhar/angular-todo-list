@todo_list.controller 'ProjectsController', ['$scope', '$location', '$http', ($scope, $location, $http) ->
  $scope.projects = []
  # $http.get('./projects.json').success((data) ->
  #   $scope.projects = data
  # )

  $scope.projects = [
    {name: "Project 1", id: "1", tasks: [
      {name: "Task 1", id: "1", isDone: 'true'}
      {name: "Task 2", id: "2", isDone: 'false'}
      {name: "Task 3", id: "3", isDone: 'false'}
    ]},
    {name: "Project 2", id: "2", tasks: [
      {name: "Task 1", id: "4", isDone: 'false'}
    ]}
  ]

  $scope.projectSortableOptions = {
    cursor : "move",
    tolerance : "pointer",
    update: (e, ui) ->
      console.log e
      console.log ui
  }

  $scope.taskSortableOptions = {
    cursor : "move",
    tolerance : "pointer",
    update: (e, ui) ->
      console.log e
      console.log ui
  }

  $scope.addProject = ->
    $scope.projects.unshift({name : $scope.newProject })
    $scope.newProject = ""

  $scope.filtersTasks = { };
  $scope.show = 'Complete'

  $scope.showTasks = (task) ->
    console.log 'showTask'
    console.log task
    console.log $scope.show
    if $scope.show == "All"
        return true
    else if task.isDone && $scope.show == "Complete"
        return true
    else if !task.isDone && $scope.show == "Incomplete"
        return true
    else
        return false

]
