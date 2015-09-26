@todo_list.controller 'MessagesController', ['$scope', '$location', 'Message', '$filter', (
                                              $scope,   $location,   Message,   $filter) ->

  $scope.task = $scope.$parent.task
  $scope.messages = Message.query(task_id: $scope.task.id)

  $scope.add = (text) ->
    msg = new Message
    msg.task_id = $scope.task.id
    msg.text = text
    msg.$save (result) ->
      $scope.messages.push(result)
      $scope.task.msg_count += 1

  $scope.update = (msg) ->
    msg.$update ->

  $scope.remove = (msg) ->
    msg.$delete ->
      msgs = $scope.messages
      index = msgs.indexOf msg
      msgs.splice index, 1
      $scope.messages = msgs
      $scope.task.msg_count -= 1

   $scope.upload = (file) ->

]
