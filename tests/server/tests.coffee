
# tests.coffee
namespace 'CodeFabric', (ns) ->

  class FakeModel extends ns.Model
    constructor: (data) ->
      @extend data

      super()

  Tinytest.add 'Can an object extend Model and also include a data class?', (test) ->
    Data =
      oneProp: 1
      twoProp: -> 2

    underTest = new FakeModel(Data)
    test.equal underTest.oneProp, 1
    test.equal underTest.twoProp(), 2

  return