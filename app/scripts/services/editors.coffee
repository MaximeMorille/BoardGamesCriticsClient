'use strict'

###*
 # @ngdoc service
 # @name boardGamesCriticsClientApp.editors
 # @description
 # # editors
 # Factory in the boardGamesCriticsClientApp.
###
editorsService = angular.module('boardGamesCriticsClientApp')
                  .service('editorsServices', ['ngResource'])

editorsService.factory('Editors', ['$resource', 'API_KEY',
  ($resource, API_KEY) ->
    return $resource(API_KEY.url + '/editors/:id/', {},
      {
        index: {
          method: 'GET',
          url: API_KEY.url + '/editors/'
          isArray: true,
          headers: {
            'Content-Type': 'application/json'
          }
        },
        create: {
          method: 'POST',
          url: API_KEY.url + '/editors/'
          headers: {
            'Content-Type': 'application/json'
          }
        }
      }
    )
  ])
