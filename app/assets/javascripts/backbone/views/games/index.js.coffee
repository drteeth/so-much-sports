class ItemView extends Backbone.View
  template: JST['backbone/templates/games/item']
  className: 'game'

  render: ->
    @$el.html @template @model.toJSON()
    this

class App.GameIndexView extends Backbone.View
  template: JST['backbone/templates/games/index']
  className: 'game-index'

  addGame: (game) ->
    view = new ItemView(model: game)
    view.listenTo this, 'clear', view.remove
    @$el.append view.render().el

  render: ->
    @clear()
    @collection.each @addGame, this
    this

  remove: ->
    @clear()

  clear: ->
    @trigger('clear')
