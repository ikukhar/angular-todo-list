
@todo_list = angular.module('TodoList', [
  'ngRoute',
  'ui.sortable',
  'ng-token-auth'
])

@todo_list.config(['$routeProvider', '$locationProvider', ($routeProvider, $locationProvider) ->

  $routeProvider
    .when('/projects', {
      templateUrl: '../templates/projects/index.html',
      controller: 'ProjectsController',
      resolve: {
        auth: ['$auth', ($auth) ->
          return $auth.validateUser();
        ]
      }
    })
    .when('/sign_in', {
      templateUrl: 'templates/user_sessions/new.html',
      controller: 'UserSessionsController'
    })
    .otherwise({
      templateUrl: '../templates/home.html',
      controller: 'HomeController'
    })

  $locationProvider.html5Mode(true)

])

@todo_list.run (['$rootScope', '$location', ($rootScope, $location) ->
  $rootScope.$on('auth:login-success', ->
    $location.path('/projects')
  )
])
