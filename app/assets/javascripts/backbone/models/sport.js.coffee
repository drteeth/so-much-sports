class App.Sport extends Backbone.Model
class App.SportCollection extends Backbone.Collection
  model: App.Sport
  localStorage: new Backbone.LocalStorage("sports")

  highlight: (sport) ->
    selectedSports = @where(selected:true)
    _.each selectedSports, (s) ->
      s.set(selected:false) unless s is sport
    sport.set(selected:true)
