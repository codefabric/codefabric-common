namespace 'CodeFabric', (ns) ->

  Array::orderBy = (sort) ->
    if sort?
      sorted = @
      for field, dir of sort
        sorted = sorted.sort (a, b) ->
          if dir == 1
            return a[field] >= b[field]
          else if dir == -1
            return a[field] < b[field]
          else
            return 0

      return sorted
    return @

  Array::filterBy = (filter) ->
    if filter?
      filtered = @
      for field, value of filter
        filtered = filtered.filter (e, i, a) ->
          if typeof value is 'object' and value.$in?
            return e[field] in value.$in
            
          return e[field] == value

      return filtered

    return @
