'use strict'

describe('Service: boardgames', ->

  # load the service's module
  beforeEach module('boardGamesCriticsClientApp')

  # instantiate service
  boardgames = {}
  apiKey = {}
  httpBackend = {}
  beforeEach(inject((Boardgames, API_KEY, $httpBackend) ->
    boardgames = Boardgames
    apiKey = API_KEY
    httpBackend = $httpBackend
  ))

  it('should create an array of boardgames when calling index()', () ->
    httpBackend
      .expectGET(apiKey.url + '/board-games/')
      .respond(200, [
        {
          id: 1
          name: 'Armadora'
          editor: 2
          owner: 'test'
        },
        {
          id: 2
          editor: 'The Boss'
          owner: 'test'
        }
      ])

    result = boardgames.index()
    httpBackend.flush()

    expect(result.length).toBe(2)

    firstBoardgame = result[0]

    expect(firstBoardgame.id).toBe(1)
    expect(firstBoardgame.name).toBe('Armadora')
    expect(firstBoardgame.owner).toBe('test')
  )

  it('should post a new boardgame when calling create()', () ->
    httpBackend
      .expectPOST(apiKey.url + '/board-games/')
      .respond(201, {
        id: 3
        name: 'Dice Town'
      })

    boardgame = new boardgames({name: 'Dice Town'})
    expect(boardgame.id).toBeUndefined()

    boardgame.$create()
    httpBackend.flush()

    expect(boardgame.id).toBe(3)
  )
)
