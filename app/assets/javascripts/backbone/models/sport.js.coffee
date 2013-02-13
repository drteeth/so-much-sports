class App.Sport extends Backbone.Model
class App.SportCollection extends Backbone.Collection
  model: App.Sport
  localStorage: new Backbone.LocalStorage("sports")
