@todo_list.controller 'ProjectsController', ['$scope', '$location', 'Project', '$filter', (
                                              $scope, $location, Project, $filter) ->

  $scope.newName = ''
  $scope.editing = false
  $scope.projects = Project.query()

  $scope.add = ->
    return if $scope.newName.$error
    project = new Project
    project.name = $scope.newName
    project.$save({ test: true } ,(result) ->
      $scope.projects.unshift(result)
      $scope.newName = ""
    )
  $scope.updateName = (project, editName) ->
    return if editName.$error
    project.name = editName
    project.$update ->

  $scope.remove = (project) ->
    project.$delete ->
      projects = $scope.projects
      index = projects.indexOf project
      projects.splice index, 1
      $scope.projects = projects


  $scope.sortableOptions = {
    cursor : "move",
    start: (e, ui) ->
      $scope.beforeSortProjects = $scope.projects.slice()
    ,
    stop: (e, ui) ->
      newPos = $scope.projects.length
      for project in $scope.projects
        # console.log id
        res = $filter('filter')($scope.beforeSortProjects, {id: project.id}, false)
        if res[0].position != newPos
          project.position = newPos
          $scope.update(project)
        newPos -= 1
  }

  # $scope.showTasks = (task) ->
  #   return true
  #   # TODO
  #   console.log 'showTask'
  #   console.log task
  #   console.log $scope.show
  #   if $scope.show == "All"
  #       return true
  #   else if task.isDone && $scope.show == "Complete"
  #       return true
  #   else if !task.isDone && $scope.show == "Incomplete"
  #       return true
  #   else
  #       return false

]
