namespace 'CodeFabric', (ns) ->

  class View extends CodeFabric.Base
    constructor: (template) ->
      @template = template

      @template.onCreated @__onCreated
      @template.onRendered @__onRendered
      @template.onDestroyed @__onDestroyed

      # Automatically expose instance vars and functions as helpers - good idea?
      @template.helpers @


    __onCreated: (e) =>
      if @onCreated?
        @onCreated(e)

      return

    __onRendered: (e) =>
      if @onRendered?
        @onRendered(e)

      return

    __onDestroyed: (e) =>
      if @onDestroyed?
        @onDestroyed(e)

      return

  return ns.Resolver.depends
    name: 'View'
    constructor: View
    dependencies:
      template: 'template'