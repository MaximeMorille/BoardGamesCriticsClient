'use strict'

###*
 # @ngdoc service
 # @name boardGamesCriticsClientApp.session
 # @description
 # # session
 # Service in the boardGamesCriticsClientApp.
###
angular.module('boardGamesCriticsClientApp')
  .service('Session', () ->
      this.create = (userId, token) ->
        this.userId = userId
        this.token = token

      this.updateToken = (newToken, oldToken) ->
        if oldToken?
          if this.token == oldToken
            this.token = newToken
        else
          this.token = newToken

      this.delete = () ->
        this. userId = undefined
        this.token = undefined

      return this
    )
