'use strict'

###*
 # @ngdoc function
 # @name boardGamesCriticsClientApp.controller:EditorsCtrl
 # @description
 # # EditorsCtrl
 # Controller of the boardGamesCriticsClientApp
###
angular.module('boardGamesCriticsClientApp')
  .controller('EditorsCtrl', ($scope, $http, Editors) ->
    $scope.editors = Editors.index()

    $scope.createEditor = () ->
      console.log($scope)
      editor = new Editors({name: $scope.editor})

      editor.$create().then(
        () ->
          $scope.editors.push(editor)
        () ->
          console.log('coucou, je plante')
      )
      $scope.editor = ''

    $scope.removeEditor = (editor) ->
      if confirm('Do you really want to destroy this editor?')
        editor.$delete({id: editor.id}).then(
          () ->
            index = $scope.editors.indexOf(editor)
            $scope.editors.splice(index, 1)

          (data) ->
            console.log(data)
        )
  )
