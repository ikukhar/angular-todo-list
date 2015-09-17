describe 'Todo List controllers', ->
  describe 'ProjectsController', ->
    $scope = null
    $controller = null

    beforeEach module('TodoList')

    beforeEach inject ($injector) ->
      $scope = $injector.get('$rootScope').$new()
      $controller = $injector.get('$controller')

    it 'create controller', ->
      $controller('ProjectsController', { $scope: $scope })
      expect($scope.projects.length).toBe(0)
