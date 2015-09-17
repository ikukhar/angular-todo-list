@todo_list = angular.module('TodoList', ['ngRoute'])

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
