# TODO persist in node?

globalThis.localStorage ?= do ->

  store = {}

  key: ( n ) -> ( Object.keys store )[ n ]

  getItem: ( key ) -> store[ key ]

  setItem: ( key, value ) -> store[ key ] = value

  removeItem: ( key ) -> delete store[ key ]

  clear: -> store = {}

Storage =

  get: ( key ) ->
    if ( item = localStorage.getItem key )?
      JSON.parse item
    else null

  has: ( key ) -> ( localStorage.get key  )?

  set: ( key, value ) ->
    if value?
      localStorage.setItem key, JSON.stringify value
    else
      localStorage.removeItem key

  remove: ( key ) ->
    localStorage.removeItem key

export default Storage