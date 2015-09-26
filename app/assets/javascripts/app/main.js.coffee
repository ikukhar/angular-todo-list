
@todo_list = angular.module('TodoList', [
  'ngRoute',
  'ui.sortable',
  'ng-token-auth',
  'ngResource',
  'ui.bootstrap',
  'ngFileUpload'
])

@todo_list.config(['$routeProvider', '$locationProvider', '$httpProvider', (
                    $routeProvider, $locationProvider, $httpProvider) ->

  $routeProvider
    .when('/', {
      templateUrl: '/templates/index',
      controller: 'ProjectsController',
      resolve: {
        auth: ['$auth', ($auth) ->
          return $auth.validateUser();
        ]
      }
    })
    .when('/sign_in', {
      templateUrl: '/templates/sign_in',
      controller: 'UserSessionsController'
    })
    .when('/sign_up', {
      templateUrl: '/templates/sign_up',
      controller: 'UserRegistrationsController'
    })
    .otherwise({
       redirectTo: '/'
    })

  $locationProvider.html5Mode(true)

])

@todo_list.run (['$rootScope', '$location', '$auth', ($rootScope, $location, $auth) ->

  # $rootScope.$on( "$locationChangeSuccess", (e, next, current) ->
  #   unless $rootScope.user.signedIn
  #     unless $location.path().match(/\/sign_\w+/)
  #       $location.path('/sign_in')
  # )

  $rootScope.$on('auth:login-success', ->
    $location.path('/')
  )

  $rootScope.$on('auth:logout-success', ->
    $location.path('/sign_in')
  )

])
