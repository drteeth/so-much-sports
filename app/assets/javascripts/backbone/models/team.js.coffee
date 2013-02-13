class App.Team extends Backbone.Model
class App.TeamCollection extends Backbone.Collection
  model: App.Team
  localStorage: new Backbone.LocalStorage("teams")
