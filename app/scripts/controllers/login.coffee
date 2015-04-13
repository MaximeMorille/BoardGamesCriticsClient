'use strict'

###*
 # @ngdoc function
 # @name boardGamesCriticsClientApp.controller:LoginCtrl
 # @description
 # # LoginCtrl
 # Controller of the boardGamesCriticsClientApp
###
angular.module('boardGamesCriticsClientApp')
  .controller('LoginCtrl', ($scope, AuthService, Session) ->
    $scope.credentials = {
      username: ''
      password: ''
    }

    $scope.closed = true

    $scope.toggleAuthForm = () ->
      $scope.closed = !$scope.closed

    $scope.login = (credentials) ->
      AuthService.login(credentials)
        .then(
          (response) ->
            $scope.setCurrentUser(Session.user)
            $scope.closed = true
          (response) ->
            # response.[config|data|headers|status|statusText]
            console.log(response)
        )
  )
