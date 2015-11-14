namespace 'CodeFabric', (ns) ->

  class Utils
    constructor: ->

    @and: (a, b) -> return (a && b)
    @or: (a, b) -> return (a || b)

    @gt: (a, b) -> return (a > b)
    @gte: (a, b) -> return (a >= b)
    @lt: (a, b) -> return (a < b)
    @lte: (a, b) -> return (a <= b)

    @eq: (a, b) -> return (a == b)

    @getValue: (item, field) -> return item[field]

    @contains: (array, value, itemPath) ->
      if itemPath?
        return value in ( (@_getValue item, itemPath) for item in array )
      else
        return value in array


    @first: (array, value, itemPath) ->
      matchingItems = []
      if itemPath?
        matchingItems = (item for item in array when (@_getValue item, itemPath) == value)
      else
        matchingItems = (value for value in array when value == value)

      if matchingItems.length > 0
        return matchingItems[0]

      return null


    @_getValue: (item, valuePath) ->
      paths = valuePath.split '.'
      value = item
      for path in paths
        if value[path]
          value = item[path]
        else
          return null

      return value

  Template.registerHelper 'codefabricUtils', -> 
      return ns.Utils

  return ['Utils', Utils]