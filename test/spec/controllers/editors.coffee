'use strict'

describe 'Controller: EditorsCtrl', ->

  # load the controller's module
  beforeEach module 'boardGamesCriticsClientApp'

  EditorsCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    EditorsCtrl = $controller 'EditorsCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(scope.awesomeThings.length).toBe 3
