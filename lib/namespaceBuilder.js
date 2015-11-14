
if (!namespace) {

  namespace = function (name, code) {
    var root = this;
    getOrCreateNamespace(name);

    Meteor.startup(function() {

      //Have to go get the actual namespace from the root again, since the closure variable is a copy
      var ns = getOrCreateNamespace(name);

      var result = code.call(ns, ns);
      addResultToNamespace(name, ns, result);
    });

    function getOrCreateNamespace (theName) {
      var ns = root;
      var names = theName.split('.');
      for (var i = 0; i < names.length; i++) {
        var part = names[i];
        if (!ns[part]) {
          ns[part] = {};
        }

        ns = ns[part];
      }

      return ns;
    }

    function addResultToNamespace(name, ns, result) {
      if (result instanceof Array) {
        //Assuming list of name, value pairs as a single array
        for (var idx = 0; idx < (result.length - 1); idx += 2) {
          var objName = result[idx];
          var value = result[idx + 1];

          if (Meteor.settings.debug) {
            console.log('Adding ' + objName + ' to ' + name);
          }
          ns[objName] = value;
        }
        return;
      }
      if (typeof result === 'object') {
        if (result._name) {
          if (Meteor.settings.debug) {
            console.log('Adding ' + result._name + ' to ' + name);
          }
          ns[result._name] = result;
        }
      }
      if (typeof result === 'function') {
        if (result.name) {
          if (Meteor.settings.debug) {
            console.log('Adding ' + result.name + ' to ' + name);
          }
          ns[result.name] = result;
        }
      }
    };
  };

}