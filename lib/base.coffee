namespace 'CodeFabric', (ns) ->

  class Base

    constructor: ->

    handleError: (error) ->
      if error?
        console.log error
        return false

      return true

  return ['Base', Base]