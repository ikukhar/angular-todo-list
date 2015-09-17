
@todo_list = angular.module('TodoList', ['ngRoute', 'ui.sortable'])

@todo_list.config(['$routeProvider', ($routeProvider) ->

  $routeProvider.
    when('/projects', {
      templateUrl: '../templates/projects/index.html',
      controller: 'ProjectsController'
    }).
    otherwise({
      templateUrl: '../templates/home.html',
      controller: 'HomeController'
    })
])
