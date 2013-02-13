class App.Sync extends Backbone.Model

  url: ->
    '/sync'

  initialize: ->
    @on 'change', @update, this

  update: (sync) ->
    map =
      sports: App.SportCollection
      periods: App.PeriodCollection
      games: App.GameCollection
      teams: App.TeamCollection
      quotes: App.QuoteCollection
    _.each sync.changedAttributes(), (items, key) ->
      # create the collection
      collection = new map[key]()

      # clear the items in localStorage
      collection.update([]) # doesn't seem to work.

      # add the new items
      _.each items, (item) ->
        collection.create(item)
    @trigger('loading:complete')

App.sync = ->
  sync = new App.Sync()
  sync.fetch()
  sync

