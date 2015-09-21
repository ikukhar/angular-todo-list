@todo_list.controller 'ProjectsController', ['$scope', '$location', '$http', ($scope, $location, $http) ->
  $scope.projects = []
  $http.get('./projects.json').success((data) ->
    $scope.projects = data
  )

  # $scope.projects = [
  #   {name: "Project 1", id: "1", tasks: [
  #     {name: "Task 1", id: "1", isDone: 'true'}
  #     {name: "Task 2", id: "2", isDone: 'false'}
  #     {name: "Task 3", id: "3", isDone: 'false'}
  #   ]},
  #   {name: "Project 2", id: "2", tasks: [
  #     {name: "Task 1", id: "4", isDone: 'false'}
  #   ]}
  # ]

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
    # TODO Client-side data validation
    if $scope.newProject == ''
      alert('Name is blank.')
      return false

    data =
      project:
        name: $scope.newProject

    $http.post('./projects.json', data).success((data) ->

      $scope.projects.unshift(data)
      $scope.newProject = ""
      console.log('Successfully created post.')

    ).error( ->
      console.error('Failed to create new post.')
    )

    return true

  $scope.saveProject = (project) =>
    project.editEnabled = false

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
