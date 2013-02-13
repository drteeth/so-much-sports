class App.Game extends Backbone.Model
class App.GameCollection extends Backbone.Collection
  model: App.Game
  localStorage: new Backbone.LocalStorage("games")

  forPeriod: (id) ->
    new @constructor @where(period_id:id)
