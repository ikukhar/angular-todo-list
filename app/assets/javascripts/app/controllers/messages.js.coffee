@todo_list.controller 'MessagesController', ['$scope', '$location', 'Message', '$filter', 'Upload', (
                                              $scope,   $location,   Message,   $filter,   Upload) ->

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

  $scope.upload = (message, file) ->
    Upload.upload({
      url: 'api/messages/'+message.id
      method: 'PUT'
      fields: { 'id': message.id, 'task_id': $scope.task.id }
      file: file
    }).success( (data, status, headers, config) ->
      message.file_file_name = data.file_file_name
    )

  $scope.showMessage = (message) ->
    if message.file_file_name
      message.text + ' (' +message.file_file_name + ')'
    else
      message.text
]
