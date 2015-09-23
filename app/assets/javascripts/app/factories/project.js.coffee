@todo_list.factory 'Project', ['$resource', ($resource) ->
  $resource('/api/projects/:id.json', { id: '@id' }, {
    update: {
      method: 'PUT'
    }}
  )
]
