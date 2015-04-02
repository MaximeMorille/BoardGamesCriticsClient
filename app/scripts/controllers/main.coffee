'use strict'

###*
 # @ngdoc function
 # @name boardGamesCriticsClientApp.controller:MainCtrl
 # @description
 # # MainCtrl
 # Controller of the boardGamesCriticsClientApp
###
angular.module 'boardGamesCriticsClientApp'
  .controller 'MainCtrl', ($scope) ->
    $scope.awesomeThings = [
      'HTML5 Boilerplate'
      'AngularJS'
      'Karma'
    ]
