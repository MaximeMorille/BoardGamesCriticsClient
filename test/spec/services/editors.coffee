'use strict'

describe 'Service: editors', ->

  # load the service's module
  beforeEach module 'boardGamesCriticsClientApp'

  # instantiate service
  editors = {}
  beforeEach inject (_editors_) ->
    editors = _editors_

  it 'should do something', ->
    expect(!!editors).toBe true
