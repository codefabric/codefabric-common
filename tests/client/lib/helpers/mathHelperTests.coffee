namespace 'CodeFabric', (ns) ->

  Tinytest.add 'Helpers::Math Add adds two numbers', (test) ->

    a = 1
    b = 2

    result = ns.Math.add a, b

    test.equal result, 3


  Tinytest.add 'Helpers::Math Subtract subtracts two numbers', (test) ->

    a = 1
    b = 2

    result = ns.Math.subtract b, a

    test.equal result, 1


  Tinytest.add 'Helpers::Math Multiply multiplies two numbers', (test) ->

    a = 3
    b = 5

    result = ns.Math.multiply a, b

    test.equal result, 15


  Tinytest.add 'Helpers::Math Divide divides two numbers', (test) ->

    a = 3
    b = 6

    result = ns.Math.divide b, a

    test.equal result, 2


  Tinytest.add 'Helpers::Math Power increases one number by a power', (test) ->

    a = 3
    b = 2

    result = ns.Math.power a, b
 
    test.equal result, 9


  Tinytest.add 'Helpers::Math Ceiling rounds a decimal up', (test) ->

    a = 3.2

    result = ns.Math.ceiling a

    test.equal result, 4


  Tinytest.add 'Helpers::Math Floor rounds a decimal down', (test) ->

    a = 3.7

    result = ns.Math.floor a

    test.equal result, 3


  Tinytest.add 'Helpers::Math Round rounds a number to the specified number of decimals', (test) ->

    a = 3.142967294
    b = 1.005

    result = ns.Math.round a, 3
    test.equal result, 3.143

    result = ns.Math.round a, 5
    test.equal result, 3.14297
    
    result = ns.Math.round a, 0
    test.equal result, 3
    
    result = ns.Math.round a, 1
    test.equal result, 3.1

    result = ns.Math.round b, 2
    test.equal result, 1.01

  return