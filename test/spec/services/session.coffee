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
  token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImRldiIsIm9yaWdfaWF0IjoxNDI4OTI5OTA4LCJ1c2VyX2lkIjoxLCJlbWFpbCI6Im1heGltZS5tb3JpbGxlQGdtYWlsLmNvbSIsImV4cCI6MTQyODkzMDIwOH0.0sOnguP31sXIklgmZOginVciR0b6m-aJCMs5uWDDYu8'
  newToken = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiYWRtaW4iOnRydWV9.TJVA95OrM7E2cBab30RMHrHDcEfxjoYZgeFONFh7HgQ'

  it('should create a session', () ->
    expect(!!session).toBe(true)
    expect(!!session.create).toBe(true)

    session.create(token)

    # A session must have an userId and a token
    expect(session.user.id).toBe(userId)
    expect(session.token).toBe(token)
  )

  it('should destroy a session', () ->
    expect(!!session).toBe(true)
    expect(!!session.destroy).toBe(true)

    session.create(token)

    expect(session.user.id).toBe(userId)
    expect(session.token).toBe(token)

    session.destroy()
    # Once destroyed, a session's properties should be undefined
    expect(session.user).toBeUndefined()
    expect(session.token).toBeUndefined()
  )

  it('should update a token', () ->
    expect(!!session).toBe(true)
    expect(!!session.updateToken).toBe(true)

    session.create(token)
    # Check the session's creation
    expect(session.user.id).toBe(userId)
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
