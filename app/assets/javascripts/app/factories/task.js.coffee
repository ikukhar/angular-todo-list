@todo_list.factory 'Task', ['$resource', ($resource) ->
  $resource('/api/tasks/:id.json', { id: '@id', project_id: '@project_id' }, {
    update: {
      method: 'PUT'
    }
  })
]
