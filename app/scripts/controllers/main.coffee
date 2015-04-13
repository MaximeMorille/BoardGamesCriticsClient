'use strict'

###*
 # @ngdoc function
 # @name boardGamesCriticsClientApp.controller:MainCtrl
 # @description
 # # MainCtrl
 # Controller of the boardGamesCriticsClientApp
###
angular.module('boardGamesCriticsClientApp')
  .controller('MainCtrl', ($scope, Session) ->
    $scope.currentUser = null
    $scope.isAuthorized = Session.isAuthorized

    $scope.setCurrentUser = (user) ->
      $scope.currentUser = user
  )
