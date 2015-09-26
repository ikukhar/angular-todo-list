@todo_list.factory 'Message', ['$resource', ($resource) ->
  $resource('/api/messages/:id.json', { id: '@id', task_id: '@task_id' }, {
    update: {
      method: 'PUT'
    }
  })
]
