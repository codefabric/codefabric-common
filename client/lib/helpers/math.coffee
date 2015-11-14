namespace 'CodeFabric', (ns) ->
  class Math
    constructor: ->

    @add: (a, b) -> return a + b
    @subtract: (a, b) -> return a - b
    @multiply: (a, b) -> return a * b
    @divide: (a, b) -> return a / b
    @power: (a, b) -> return a ^ b
    @ceiling: (a) -> return Math.ceil a
    @floor: (a) -> return Math.floor a
    @round: (a, decimals) -> (Math.round (a * 10 * decimals)) / (10 * decimals)
    
  Template.registerHelper 'codefabricMath', ->
    return ns.Math

  return ['Math', Math]