'use strict'

###*
 # @ngdoc service
 # @name boardGamesCriticsClientApp.editors
 # @description
 # # editors
 # Factory in the boardGamesCriticsClientApp.
###
editorsServices = angular.module('editorsServices', ['ngResource'])

editorsServices.factory('Editors', ['$resource',
  ($resource) ->
    return $resource('http://localhost:8000/editors/:editorId', {},
      {
        index: {
          method: 'GET',
          params: {
            editorId: ''
          },
          isArray: true,
          headers: {
            'Content-Type': 'application/json'
          }
        },
        create: {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json'
          }
        }
      }
    )
  ])
