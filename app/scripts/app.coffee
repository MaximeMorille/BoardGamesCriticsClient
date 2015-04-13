'use strict'

###*
 # @ngdoc overview
 # @name boardGamesCriticsClientApp
 # @description
 # # boardGamesCriticsClientApp
 #
 # Main module of the application.
###
angular
  .module('boardGamesCriticsClientApp', [
    'ngResource',
    'ngRoute',
    'angular-jwt'
  ])
  .config(($routeProvider, $resourceProvider) ->
    # Don't strip trailing slashes from calculated URLs
    $resourceProvider.defaults.stripTrailingSlashes = false

    $routeProvider
      .when('/',
        templateUrl: 'views/main.html'
        controller: 'MainCtrl'
      )
      .when('/about',
        templateUrl: 'views/about.html'
        controller: 'AboutCtrl'
      )
      .when('/editors',
        templateUrl: 'views/editors.html'
        controller: 'EditorsCtrl'
      )
      .otherwise(
        redirectTo: '/'
      )
  )
