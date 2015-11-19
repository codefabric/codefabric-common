Tinytest.add 'Array::OrderBy: sorts an array ascending by name', (test) ->
  array = [
    { 
      name: 'b'
      value: 2
    },
    {
      name: 'a'
      value: 1
    },
    { 
      name: 'c'
      value: 3
    }
  ]

  sorted = array.orderBy { 'name': 1 }

  test.equal sorted[0].value, 1
  test.equal sorted[0].name, 'a'
  test.equal sorted[1].value, 2
  test.equal sorted[1].name, 'b'
  test.equal sorted[2].value, 3
  test.equal sorted[2].name, 'c'

Tinytest.add 'Array::OrderBy: sorts an array descending by name', (test) ->
  array = [
    { 
      name: 'b'
      value: 2
    },
    {
      name: 'a'
      value: 1
    },
    { 
      name: 'c'
      value: 3
    }
  ]

  sorted = array.orderBy { 'name': -1 }

  test.equal sorted[0].value, 3
  test.equal sorted[0].name, 'c'
  test.equal sorted[1].value, 2
  test.equal sorted[1].name, 'b'
  test.equal sorted[2].value, 1
  test.equal sorted[2].name, 'a'

Tinytest.add 'Array::OrderBy: leaves already sorted array', (test) ->
  array = [
    { 
      name: 'a'
      value: 1
    },
    {
      name: 'b'
      value: 2
    },
    { 
      name: 'c'
      value: 3
    }
  ]

  sorted = array.orderBy { 'name': 1 }

  test.equal sorted[0].value, 1
  test.equal sorted[0].name, 'a'
  test.equal sorted[1].value, 2
  test.equal sorted[1].name, 'b'
  test.equal sorted[2].value, 3
  test.equal sorted[2].name, 'c'

Tinytest.add 'Array::OrderBy: does not sort when no sort specified', (test) ->
  array = [
    { 
      name: 'b'
      value: 2
    },
    {
      name: 'a'
      value: 1
    },
    { 
      name: 'c'
      value: 3
    }
  ]

  sorted = array.orderBy null

  test.equal sorted[0].value, 2
  test.equal sorted[0].name, 'b'
  test.equal sorted[1].value, 1
  test.equal sorted[1].name, 'a'
  test.equal sorted[2].value, 3
  test.equal sorted[2].name, 'c'

Tinytest.add 'Array::OrderBy: does not sort when field doesn\'t exist', (test) ->
  array = [
    { 
      name: 'b'
      value: 2
    },
    {
      name: 'a'
      value: 1
    },
    { 
      name: 'c'
      value: 3
    }
  ]

  sorted = array.orderBy { fake: 1 }

  test.equal sorted[0].value, 2
  test.equal sorted[0].name, 'b'
  test.equal sorted[1].value, 1
  test.equal sorted[1].name, 'a'
  test.equal sorted[2].value, 3
  test.equal sorted[2].name, 'c'





