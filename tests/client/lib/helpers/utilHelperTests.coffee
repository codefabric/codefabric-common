namespace 'CodeFabric', (ns) ->

  Tinytest.add 'Helpers::Utils And returns true if a and b equals true, false otherwise', (test) ->

    a = true
    b = true

    result = ns.Utils.and a, b
    test.equal result, true

    b = false
    result = ns.Utils.and a, b
    test.equal result, false

    a = 1
    b = 1
    result = ns.Utils.and a, b
    test.equal result, 1

    b = 0
    result = ns.Utils.and a, b
    test.equal result, 0

    a = 0
    result = ns.Utils.and a, b
    test.equal result, 0

  Tinytest.add 'Helpers::Utils Or returns true if a or b equals true, false otherwise', (test) ->

    a = true
    b = true

    result = ns.Utils.or a, b
    test.equal result, true

    b = false
    result = ns.Utils.or a, b
    test.equal result, true
    
    a = false
    result = ns.Utils.or a, b
    test.equal result, false

    a = 1
    b = 1
    result = ns.Utils.or a, b
    test.equal result, 1

    b = 0
    result = ns.Utils.or a, b
    test.equal result, 1

    a = 0
    result = ns.Utils.or a, b
    test.equal result, 0


  Tinytest.add 'Helpers::Utils Eq returns true if a = b, false otherwise', (test) ->

    a = 1
    b = 1

    result = ns.Utils.eq a, b
    test.equal result, true

    b = 0
    result = ns.Utils.eq a, b
    test.equal result, false

    b = 2
    result = ns.Utils.eq a, b
    test.equal result, false

    a = "Sandwich"
    b = 1
    result = ns.Utils.eq a, b
    test.equal result, false

    b = "Fish"
    result = ns.Utils.eq a, b
    test.equal result, false

    b = "Sandwich"
    result = ns.Utils.eq a, b
    test.equal result, true


  Tinytest.add 'Helpers::Utils Gt returns true if a > b, false otherwise', (test) ->

    a = 1
    b = 0

    result = ns.Utils.gt a, b
    test.equal result, true

    b = 1
    result = ns.Utils.gt a, b
    test.equal result, false

    b = 2
    result = ns.Utils.gt a, b
    test.equal result, false

    a = "Sandwich"
    b = 1
    result = ns.Utils.gt a, b
    test.equal result, false

    b = "Fish"
    result = ns.Utils.gt a, b
    test.equal result, true

    b = "Sandwich"
    result = ns.Utils.gt a, b
    test.equal result, false


  Tinytest.add 'Helpers::Utils Gte returns true if a >= b, false otherwise', (test) ->

    a = 1
    b = 0

    result = ns.Utils.gte a, b
    test.equal result, true

    b = 1
    result = ns.Utils.gte a, b
    test.equal result, true

    b = 2
    result = ns.Utils.gte a, b
    test.equal result, false

    a = "Sandwich"
    b = 1
    result = ns.Utils.gte a, b
    test.equal result, false

    b = "Fish"
    result = ns.Utils.gte a, b
    test.equal result, true

    b = "Sandwich"
    result = ns.Utils.gte a, b
    test.equal result, true


  Tinytest.add 'Helpers::Utils Lt returns true if a < b, false otherwise', (test) ->

    a = 1
    b = 0

    result = ns.Utils.lt a, b
    test.equal result, false

    b = 1
    result = ns.Utils.lt a, b
    test.equal result, false

    b = 2
    result = ns.Utils.lt a, b
    test.equal result, true

    a = "Sandwich"
    b = 1
    result = ns.Utils.lt a, b
    test.equal result, false

    b = "Fish"
    result = ns.Utils.lt a, b
    test.equal result, false

    b = "Sandwich"
    result = ns.Utils.lt a, b
    test.equal result, false

    b = "Victory"
    result = ns.Utils.lt a, b
    test.equal result, true


  Tinytest.add 'Helpers::Utils Lte returns true if a <= b, false otherwise', (test) ->

    a = 1
    b = 0

    result = ns.Utils.lte a, b
    test.equal result, false

    b = 1
    result = ns.Utils.lte a, b
    test.equal result, true

    b = 2
    result = ns.Utils.lte a, b
    test.equal result, true

    a = "Sandwich"
    b = 1
    result = ns.Utils.lte a, b
    test.equal result, false

    b = "Fish"
    result = ns.Utils.lte a, b
    test.equal result, false

    b = "Sandwich"
    result = ns.Utils.lte a, b
    test.equal result, true

    b = "Victory"
    result = ns.Utils.lte a, b
    test.equal result, true


  Tinytest.add 'Helpers::Utils GetValue returns value of field or null', (test) ->

    obj = {
      field: 'Fish'
    }

    field = 'field'

    result = ns.Utils.getValue obj, field
    test.equal result, 'Fish'

    field = 'Missing'
    result = ns.Utils.getValue obj, field
    test.isUndefined result

  Tinytest.add 'Helpers::Utils Contains returns true when item is in array, false otherwise', (test) ->

    array = [
      1,
      2,
      3,
      {
        field: 'Banana'
        deep: {
          nested: {
            path: {
              value: 4
            }
          }
        }
      }
    ]

    result = ns.Utils.contains array, 1
    test.equal result, true

    result = ns.Utils.contains array, 'Banana', 'field'
    test.equal result, true

    result = ns.Utils.contains array, 8
    test.equal result, false

    result = ns.Utils.contains array, 4, 'deep.nested.path.value'
    test.equal result, true

    result = ns.Utils.contains array, 'something', 'some.missing.path'
    test.equal result, false

    array = "Test string"
    result = ns.Utils.contains array, 't'
    test.equal result, true

    result = ns.Utils.contains array, 'p'
    test.equal result, false

  Tinytest.add 'Helpers::Utils First returns first matching array item', (test) ->
    array = [
      {
        name: 'a'
        field: 1
      },
      {
        name: 'b'
        field: 2
      },
      {
        name: 'c'
        field: 3
      },
      {
        name: 'd'
        field: 2
      }
    ]

    result = ns.Utils.first array, 1, 'field'
    test.equal result.name, 'a'

    result = ns.Utils.first array, 'p', 'field'
    test.isNull result

    result = ns.Utils.first array, 'd', 'name'
    test.equal result.field, 2


  return