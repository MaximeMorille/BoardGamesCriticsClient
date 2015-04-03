'use strict'

describe('Service: apiKey', () ->

  # load the service's module
  beforeEach(module('boardGamesCriticsClientApp'))

  # instantiate service
  apiKey = {}
  beforeEach(inject((API_KEY) ->
    apiKey = API_KEY
  ))

  it('should have an url', () ->
    expect(!!apiKey).toBe(true)
    expect(!!apiKey.url).toBe(true)
  )
)
