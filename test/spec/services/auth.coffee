'use strict'

describe('Service: auth', ->
  token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImRldiIsInVzZXJfaWQiOjEsImVtYWlsIjoibWF4aW1lLm1vcmlsbGVAZ21haWwuY29tIiwiZXhwIjoxNDI3OTg3NDcwfQ.ueFNS9cP-P604r91bVJ3lkdeOSrMkZcP68ybTctX5TE'

  # load the service's module
  beforeEach(module('boardGamesCriticsClientApp'))

  # instantiate service
  auth = {}
  session = {}
  authRequestHandler = {}
  apiKey = {}
  httpBackend = {}

  beforeEach(inject((API_KEY, AuthService, Session, $httpBackend) ->
    auth = AuthService
    session = Session
    apiKey = API_KEY
    httpBackend = $httpBackend

    authRequestHandler =
      $httpBackend.when('POST', API_KEY.url + '/api-token-auth/').respond({
        token: token
      })

  ))

  it('should create a session on successfull login', () ->
    auth.login('test', 'good password')
    httpBackend.flush()

    expect(session.user.id).toBe(1)
    expect(session.token).toBe(token)
  )

  it('should not create a session on failed login', () ->
    authRequestHandler.respond(401)

    auth.login('test', 'wrong password')
    httpBackend.flush()

    expect(session.user).toBeUndefined()
    expect(session.token).toBeUndefined()
  )

  it('should remove the session on logout', () ->
    auth.login('test', 'good password')
    httpBackend.flush()

    expect(session.user.id).toBe(1)
    expect(session.token).toBe(token)

    auth.logout()

    expect(session.user).toBeUndefined()
    expect(session.token).toBeUndefined()
  )
)
