'use strict'

###*
 # @ngdoc function
 # @name boardGamesCriticsClientApp.controller:AboutCtrl
 # @description
 # # AboutCtrl
 # Controller of the boardGamesCriticsClientApp
###
angular.module 'boardGamesCriticsClientApp'
  .controller 'AboutCtrl', ($scope) ->
    $scope.awesomeThings = [
      'HTML5 Boilerplate'
      'AngularJS'
      'Karma'
    ]
