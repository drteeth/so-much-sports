class App.Sync extends Backbone.Model

  url: ->
    '/sync'

  initialize: ->
    @on 'change', @update, this

  update: (sync) ->
    # sportCollection = new App.SportCollection(sports)
    console.log 'update', sync.changedAttributes()
    map =
      sports: App.SportCollection
      periods: App.PeriodCollection
      games: App.GameCollection
      teams: App.TeamCollection
      quotes: App.QuoteCollection
    _.each sync.changedAttributes(), (items, key) ->
      collection = new map[key]()
      _.each items, (item) ->
        collection.create(item)
    @trigger('loading:complete')

App.sync = ->
  sync = new App.Sync()
  sync.fetch()
  sync

