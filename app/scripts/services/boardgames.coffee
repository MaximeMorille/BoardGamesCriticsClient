'use strict'

###*
 # @ngdoc service
 # @name boardGamesCriticsClientApp.boardgames
 # @description
 # # boardgames
 # Factory in the boardGamesCriticsClientApp.
###
boardgamesService = angular.module('boardGamesCriticsClientApp')
                  .service('boardgamesServices', ['ngResource'])

boardgamesService.factory('Boardgames', ['$resource', 'API_KEY',
  ($resource, API_KEY) ->
    return $resource(API_KEY.url + '/board-games/:id/', {},
      {
        index: {
          method: 'GET',
          url: API_KEY.url + '/board-games/'
          isArray: true,
          headers: {
            'Content-Type': 'application/json'
          }
        },
        create: {
          method: 'POST',
          url: API_KEY.url + '/board-games/'
          headers: {
            'Content-Type': 'application/json'
          }
        }
      }
    )
  ])
