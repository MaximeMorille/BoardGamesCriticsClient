'use strict'

###*
 # @ngdoc service
 # @name boardGamesCriticsClientApp.auth
 # @description
 # # Auth
 # Service in the boardGamesCriticsClientApp.
###
angular.module('boardGamesCriticsClientApp')
  .constant('AUTH_EVENT', {
    loginSuccess: 'auth-login-success'
    loginFailed: 'auth-login-failed'
    logoutSuccess: 'auth-logout-success'
    logoutFailed: 'auth-logout-failed'
    notAuthorized: 'user-not-authorized'
    notAuthenticated: 'user-not-authenticated'
  })
  .factory('AuthService', ['$http', 'API_KEY', 'Session'
    ($http, API_KEY, Session) ->
      authService = {}

      authService.login = (credentials) ->
        $http
          .post(API_KEY.url + '/api-token-auth/', credentials)
          .success((data, status, headers, config) ->
            Session.create(data.token)
          )
          .error((data, status, headers, config) ->
            Session.destroy()
          )

      authService.logout = () ->
        Session.destroy()

      return authService
  ])
