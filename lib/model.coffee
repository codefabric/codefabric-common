# packages/codefabric-common/lib/model.coffee
namespace 'CodeFabric', (ns) ->

  modelKeywords = ['extended', 'included']

  class Model extends ns.Base
    constructor: ->
      super()

    extend: (obj) ->
      for key, value of obj when key not in modelKeywords
        @[key] = value

      obj.extended?.apply(@)
      return this

    include: (obj) ->
      for key, value of obj when key not in modelKeywords
        # Assign properties to the prototype
        @::[key] = value

      obj.included?.apply(@)
      return this

  return ['Model', Model]