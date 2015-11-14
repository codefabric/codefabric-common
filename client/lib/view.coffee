namespace 'CodeFabric', (ns) ->

  class View extends CodeFabric.Base
    constructor: (template) ->
      @template = template

      @onCreated = ->
      @onRendered = ->
      @onDestroyed = ->

      @template.onCreated = @__onCreated
      @template.onRendered = @__onRendered
      @template.onDestroyed = @__onDestroyed

    __onCreated: (e) ->
      if @onCreated?
        @onCreated(e)
    __onRendered: (e) ->
      if @onRendered?
        @onRendered(e)
    __onDestroyed: ->
      if @onDestroyed?
        @onDestroyed(e)

  return CodeFabric.Resolver.depends
    name: 'View'
    constructor: View
    dependencies:
      template: 'template'