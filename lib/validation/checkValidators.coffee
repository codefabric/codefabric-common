namespace 'CodeFabric.Validation', (ns) ->
  
  class Check
    @IsNonEmpty: (str) ->
      check str, String
      return (str.length > 0)

    @IsIn: (strOrArr, arr) ->
      check arr, [String]

      if typeof strOrArr is 'string'
        ns.Check.IsNonEmpty strOrArr
        return strOrArr in arr

      check strOrArr, [Match.Any]
      isValid = ns.Check.IsIn item, arr for item in strOrArr
      return isValid

  return ['Check', Check]