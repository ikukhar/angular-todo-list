@todo_list.controller 'TasksController', ['$scope', '$location', 'Task', '$filter', (
                                           $scope, $location, Task, $filter) ->

  $scope.project = $scope.$parent.project
  $scope.newName = ''
  $scope.tasks = Task.query(project_id: $scope.project.id)

  $scope.add = ->
    return if $scope.newName.$error
    console.log $scope.newName
    task = new Task
    task.project_id = $scope.project.id
    task.name = $scope.newName
    task.$save (result) ->
      $scope.tasks.unshift(result)
      $scope.newName = ""

  $scope.updateName = (task, editName) ->
    task.name = editName
    task.$update ->

  $scope.remove = (task) ->
    task.$delete ->
      tasks = $scope.tasks
      index = tasks.indexOf project
      tasks.splice index, 1
      $scope.tasks = tasks

  $scope.sortableOptions = {
    cursor : "move",
    start: (e, ui) ->
      $scope.beforeSortTasks = $scope.tasks.slice()
    ,
    stop: (e, ui) ->
      newPos = $scope.tasks.length
      for task in $scope.tasks
        res = $filter('filter')($scope.beforeSortTasks, {id: task.id}, false)
        if res[0].position != newPos
          task.position = newPos
          $scope.update(task)
        newPos -= 1
  }
]
