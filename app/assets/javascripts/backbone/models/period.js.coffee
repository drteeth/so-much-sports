class App.Period extends Backbone.Model

class App.PeriodCollection extends Backbone.Collection
  model: App.Period
  localStorage: new Backbone.LocalStorage("periods")

  forSport: (sport) ->
    new @constructor @where
      sport_id: sport.get('id')
