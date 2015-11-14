# CodeFabric Common Meteor Package

This package contains useful utilities for writing Meteor packages, including (but not limited to):

* Namespace builder
  * Dynamically creates and adds objects, functions, classes, etc. to a namespace
  * Runs the supplied function in a Meteor.startUp, to ensure that namespaces are registered first before objects are instantiated
  * Works with the CodeFabric Resolver

* Dependency Resolver ('CodeFabric Resolver')
  * A simple dependency injection container, which allows the registration and resolution of object graphs

* Base Class
  * A simple Base class for objects, adding simple basic error handling

* Model Class
  * A base Model class, which adds extends and include functionality to classes (to provide inclusion of parameter object properties in the constructor)

* Check Validators
  * A couple of standard validators for the check module

* Array Extensions
  * Extensions to the JavaScript Array object, to include more Meteor (Mongo)-friendly sort and filter functions (orderBy and filterBy, synonymous to Mongo sort and find (filter only))

* Template Helpers
  * A number of Meteor Template helpers to do useful things in templates like basic Math 9addition, subtraction, etc), equality checks, etc.

* View Class
  * A base class for Meteor views (abstraction on Template), to make things a bit more OOP-style