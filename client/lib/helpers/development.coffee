namespace 'CodeFabric', () ->

  Template.registerHelper 'codefabricDebug', (shouldBreak) ->
    console.log "Data for " + Template.instance().view.name + ":"
    console.log @

    if shouldBreak
      debugger;
