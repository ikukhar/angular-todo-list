@todo_list.controller 'ProjectsController', ['$scope', '$location', '$http', ($scope, $location, $http) ->

  $scope.projects = []
  $http.get('/api/projects').success((data) ->
    $scope.projects = data
  ).error( ->
    $scope.error = data
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
    update: (e, ui) ->
      console.log e
      console.log ui
  }

  $scope.taskSortableOptions = {
    cursor : "move",
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

    $http.post('/api/projects.json', data).success((data) ->

      $scope.projects.unshift(data)
      $scope.newProject = ""
      console.log('Successfully created post.')

    ).error( ->
      $scope.error = data
    )

  $scope.saveProject = (project) =>
    # if $scope.newProject == ''
    #   alert('Name is blank.')
    #   return false
    #
    # data =
    #   project:
    #     name: $scope.name
    #
    # $http.post("/api/projects/#{project.id}", data).success((data) ->
    #
    #   $scope.projects.unshift(data)
    #   $scope.newProject = ""
    #   console.log('Successfully created post.')
    #
    # ).error( ->
    #   $scope.error = data
    # )

  $scope.filtersTasks = { };
  $scope.show = 'Complete'

  $scope.showTasks = (task) ->
    return true
    # TODO
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
