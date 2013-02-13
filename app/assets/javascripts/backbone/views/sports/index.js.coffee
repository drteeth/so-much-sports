class ItemView extends Backbone.View
  template: JST['backbone/templates/sports/item']
  className: 'sport'

  initialize: ->
    @listenTo @model, 'change:selected', @highlight

  highlight: (sport, selected) ->
    @$el.toggleClass('selected', selected)

  render: ->
    @$el.html @template @model.toJSON()
    this

class App.SportIndexView extends Backbone.View
  template: JST['backbone/templates/sports/index']
  className: 'sport-index'

  addSport: (sport) ->
    view = new ItemView(model: sport)
    view.listenTo this, 'clear', view.remove
    @$el.append view.render().el

  render: ->
    @clear()
    @collection.each @addSport, this
    this

  remove: ->
    @clear()

  clear: ->
    @trigger('clear')
