class ItemView extends Backbone.View
  template: JST['backbone/templates/sports/item']
  className: 'sport'

  render: ->
    @$el.html @template @model.toJSON()
    this

class App.SportIndexView extends Backbone.View
  template: JST['backbone/templates/sports/index']
  className: 'sport-index'

  addSport: (sport) ->
    view = new ItemView(model: sport)
    @$el.append view.render().el

  render: ->
    @$el.empty()
    @collection.each @addSport, this
    this
