
@todo_list = angular.module('TodoList', [
  'ngRoute',
  'ui.sortable',
  'ng-token-auth'
])

@todo_list.config(['$routeProvider', '$locationProvider', '$authProvider', (
                    $routeProvider, $locationProvider, $authProvider) ->

  $routeProvider
    .when('/', {
      templateUrl: '../templates/index.html',
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
    .when('/sign_up', {
      templateUrl: 'templates/user_registrations/new.html',
      controller: 'UserRegistrationsController'
    })
    .otherwise({
       redirectTo: '/'
    })

  $locationProvider.html5Mode(true)

  $authProvider.configure({
    # apiUrl: 'http://34758f04.ngrok.com',
    authProviderPaths: {
      github: '/auth/github'
    }
  })

])

@todo_list.run (['$rootScope', '$location', '$auth', ($rootScope, $location, $auth) ->

  $rootScope.$on( "$locationChangeSuccess", (e, next, current) ->
    unless $rootScope.user.signedIn
      unless $location.path().match(/\/sign_\w+/)
        $location.path('/sign_in')
  )

  $rootScope.$on('auth:login-success', ->
    $location.path('/')
  )

  $rootScope.$on('auth:logout-success', ->
    $location.path('/sign_in')
  )
])
