class App.SportView extends Backbone.View
  template: JST['backbone/templates/sports/show']

  initialize: ->
    @periods = @options.periods

  render: ->
    context = _.extend @model.toJSON(), periods: @periods.toJSON()
    @$el.html @template context
    this
