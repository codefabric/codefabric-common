# tests.coffee



Tinytest.add 'Can an object extend Model and also include a data class?', (test) ->
  Data =
    oneProp: 1
    twoProp: -> 2

  class FakeModel extends CodeFabric.Model
    constructor: (data) ->
      @extend data


  underTest = new FakeModel(Data)
  test.equal underTest.oneProp, 1
  test.equal underTest.twoProp(), 2