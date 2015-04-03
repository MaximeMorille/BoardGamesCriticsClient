'use strict'

describe('Service: session', ->

  # load the service's module
  beforeEach(module('boardGamesCriticsClientApp'))

  # instantiate service
  session = {}
  beforeEach(inject((Session) ->
    session = Session
  ))

  # Test variables
  userId = 1
  token = 'customToken'
  newToken = 'newCustomToken'

  it('should create a session', () ->
    expect(!!session).toBe(true)
    expect(!!session.create).toBe(true)

    session.create(userId, token)

    # A session must have an userId and a token
    expect(session.userId).toBe(userId)
    expect(session.token).toBe(token)
  )

  it('should delete a session', () ->
    expect(!!session).toBe(true)
    expect(!!session.delete).toBe(true)

    session.create(userId, token)

    expect(session.userId).toBe(userId)
    expect(session.token).toBe(token)

    session.delete()
    # Once delete, a session's properties should be undefined
    expect(session.userId).toBeUndefined()
    expect(session.token).toBeUndefined()
  )

  it('should update a token', () ->
    expect(!!session).toBe(true)
    expect(!!session.updateToken).toBe(true)

    session.create(userId, token)
    # Check the session's creation
    expect(session.userId).toBe(userId)
    expect(session.token).toBe(token)

    session.updateToken(newToken)
    # If no oldToken, the token is updated
    expect(session.token).toBe(newToken)

    session.updateToken(token, token)
    # If oldToken is not the session's token, the token is not updated
    expect(session.token).not.toBe(token)

    session.updateToken(token, newToken)
    # If oldToken is the session's token, the token is updated
    expect(session.token).toBe(token)
  )
)
