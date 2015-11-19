namespace 'CodeFabric', (ns) ->
  class MathHelpers
    constructor: ->

    @add: (a, b) -> return a + b
    @subtract: (a, b) -> return a - b
    @multiply: (a, b) -> return a * b
    @divide: (a, b) -> return a / b
    @power: (a, b) -> return Math.pow a, b
    @ceiling: (a) -> return Math.ceil a
    @floor: (a) -> return Math.floor a
    @round: (a, decimals) -> 
      if decimals > 0
        return @__round10 a, decimals
      else
        return @__round10 a, 0


     # Decimal adjustment of a number.
     # 
     #  @param {String}  type  The type of adjustment.
     #  @param {Number}  value The number.
     #  @param {Integer} exp   The exponent (the 10 logarithm of the adjustment base).
     #  @returns {Number} The adjusted value.
    @__decimalAdjust: (type, value, exp) ->
      # If the exp is undefined or zero...
      if typeof exp == 'undefined' or +exp == 0
        return Math[type] value
      
      value = +value;
      exp = +exp;
      # If the value is not a number or the exp is not an integer...
      if isNaN(value) or !(typeof exp == 'number' and exp % 1 == 0)
        return NaN;
      
      # Shift
      value = value.toString().split 'e' 
      valueStr = value[0] + 'e'
      if value[1]
        valueStr += (+value[1] + exp)
      else
        valueStr += exp

      value = Math[type] +valueStr
      # Shift back
      value = value.toString().split 'e'
      valueStr2 = value[0] + 'e'
      if value[1]
        valueStr2 += (+value[1] - exp)
      else
        valueStr2 += -exp
      return +valueStr2;
    

    # Decimal round
    @__round10: (value, exp) -> 
        return @__decimalAdjust('round', value, exp)
      
    # Decimal floor
    @__floor10: (value, exp) ->
        return @__decimalAdjust('floor', value, exp)
    
    # Decimal ceil
    @__ceil10: (value, exp) ->
      return @__decimalAdjust('ceil', value, exp)
  
    
  Template.registerHelper 'codefabricMath', ->
    return MathHelpers

  return ['Math', MathHelpers]