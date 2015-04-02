'use strict'

###*
 # @ngdoc function
 # @name boardGamesCriticsClientApp.controller:EditorsCtrl
 # @description
 # # EditorsCtrl
 # Controller of the boardGamesCriticsClientApp
###
angular.module('boardGamesCriticsClientApp').controller('EditorsCtrl', ($scope, $http, Editors) ->
  $scope.editors = Editors.index()

  $scope.createEditor = () ->
    console.log($scope)
    editor = new Editors({name: $scope.editor})

    # Need to do those things when an user is logged, otherwise I can't use protected features
    # How to know if a user is logged? Which scope must I use to know that?
    token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImRldiIsInVzZXJfaWQiOjEsImVtYWlsIjoibWF4aW1lLm1vcmlsbGVAZ21haWwuY29tIiwiZXhwIjoxNDI3OTg3NDcwfQ.ueFNS9cP-P604r91bVJ3lkdeOSrMkZcP68ybTctX5TE'
    $http.defaults.headers.common = {
      'Authorization': 'JWT ' + token
    }

    editor.$create().then(
      () ->
        $scope.editors.push(editor)
      () ->
        console.log('coucou, je plante')
    )
    $scope.editor = ''
)
