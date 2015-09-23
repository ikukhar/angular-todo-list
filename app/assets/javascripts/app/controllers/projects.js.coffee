@todo_list.controller 'ProjectsController', ['$scope', '$location', 'Project', '$filter', (
                                              $scope, $location, Project, $filter) ->

  $scope.editingProject = false
  $scope.projects = Project.query()

  $scope.projectSortableOptions = {
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
          $scope.updateProject(project)
        newPos -= 1
  }

  $scope.taskSortableOptions = {
    cursor : "move",
    update: (e, ui) ->
  }

  $scope.addProject = ->
    project = new Project
    project.name = $scope.newNameProject
    project.$save (result) ->
      $scope.projects.unshift(result)
      $scope.newNameProject = ""

  $scope.updateProject = (project) ->
    project.$update ->

  $scope.removeProject = (project) ->
    project.$delete ->
      projects = $scope.projects
      index = projects.indexOf project
      projects.splice index, 1
      $scope.projects = projects

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
