'use strict'

###*
 # @ngdoc service
 # @name boardGamesCriticsClientApp.session
 # @description
 # # session
 # Service in the boardGamesCriticsClientApp.
###
angular.module('boardGamesCriticsClientApp')
  .service('Session', ($http, jwtHelper) ->
      @create = (token) ->
        payload = jwtHelper.decodeToken(token)

        @user = {
          id: payload.user_id
          name: payload.username
          email: payload.email
        }
        @token = token

        _setAuthHeader(token)

      @updateToken = (newToken, oldToken) ->
        if oldToken?
          if @token == oldToken
            @token = newToken
        else
          @token = newToken

        _setAuthHeader(@token)

      @destroy = () ->
        @user = undefined
        @token = undefined

        _setAuthHeader(null)

      @isAuthorized = () ->
        return @userId?

      _setAuthHeader = (token) ->
        if token?
          if $http.defaults.headers.common?
            $http.defaults.headers.common.Authorization = 'JWT ' + token
          else
            $http.defaults.headers.common = {
              Authorization: 'JWT ' + token
            }
        else
          if $http.defaults.headers.common?
            delete $http.defaults.headers.common.Authorization

      return this
    )
