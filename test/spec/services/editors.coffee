'use strict'

describe 'Service: editors', ->

  # load the service's module
  beforeEach module('boardGamesCriticsClientApp')

  # instantiate service
  editors = {}
  apiKey = {}
  httpBackend = {}
  beforeEach(inject((Editors, API_KEY, $httpBackend) ->
    editors = Editors
    apiKey = API_KEY
    httpBackend = $httpBackend
  ))

  it('should create an array of editors when calling index()', () ->
    httpBackend
      .expectGET(apiKey.url + '/editors/')
      .respond(200, [
        {
          id: 1
          name: 'Black Rock'
          owner: 'test'
        },
        {
          id: 2
          name: 'Asmodée'
          owner: 'test'
        }
      ])

    result = editors.index()
    httpBackend.flush()

    expect(result.length).toBe(2)

    firstEditor = result[0]

    expect(firstEditor.id).toBe(1)
    expect(firstEditor.name).toBe('Black Rock')
    expect(firstEditor.owner).toBe('test')
  )

  it('should post a new editor when calling create()', () ->
    httpBackend
      .expectPOST(apiKey.url + '/editors/')
      .respond(201, {
        id: 3
        name: 'Iello'
      })

    editor = new editors({name: 'Iello'})
    expect(editor.id).toBeUndefined()

    editor.$create()
    httpBackend.flush()

    expect(editor.id).toBe(3)
  )
