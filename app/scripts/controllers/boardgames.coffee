'use strict'

###*
 # @ngdoc function
 # @name boardGamesCriticsClientApp.controller:BoardgamesCtrl
 # @description
 # # BoardgamesCtrl
 # Controller of the boardGamesCriticsClientApp
###
angular.module('boardGamesCriticsClientApp')
  .controller('BoardgamesCtrl', ($scope, Editors, Boardgames) ->
    $scope.boardgames = Boardgames.index()
    $scope.editors = Editors.index()

    $scope.createBoardgame = () ->
      boardgame = new Boardgames($scope.boardgame)

      boardgame.$create().then(
        () ->
          $scope.boardgames.push(boardgame)
        () ->
          console.log('coucou, je plante')
      )
      $scope.boardgame = ''

    $scope.removeBoardgame = (boardgame) ->
      if confirm('Do you really want to destroy this boardgame?')
        boardgame.$delete({id: boardgame.id}).then(
          () ->
            index = $scope.boardgames.indexOf(boardgame)
            $scope.boardgames.splice(index, 1)

          (data) ->
            console.log(data)
        )
  )
