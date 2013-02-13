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
    @$el.append view.render().el

  render: ->
    @$el.empty()
    @collection.each @addGame, this
    this
