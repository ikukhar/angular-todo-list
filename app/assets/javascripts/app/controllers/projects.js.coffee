@todo_list.controller 'ProjectsController', ['$scope', '$location', 'Project', ($scope, $location, Project) ->

  $scope.editingProject = false
  $scope.projects = Project.query()

  $scope.projectSortableOptions = {
    cursor : "move",
    update: (e, ui) ->
      console.log ui.item.parent().sortable( "toArray")
		  # $scope.$apply(function(){
		  #  $scope.currSort= $list.sortable( "toArray")
      #
		  # })
  }

  $scope.taskSortableOptions = {
    cursor : "move",
    update: (e, ui) ->
  }

  $scope.addProject = ->
    # TODO True validation
    if $scope.newNameProject == ''
      alert('Name is blank.')
      return false

    project = new Project
    project.name = $scope.newNameProject
    project.$save (result) ->
      $scope.projects.unshift(result)
      $scope.newNameProject = ""

  $scope.updateProject = (project) ->
    $scope.disableEditor()
    # project.$update ->

  $scope.enableEditor = ->
    $scope.editingProject = true
  $scope.disableEditor = ->
    $scope.editingProject = false

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
