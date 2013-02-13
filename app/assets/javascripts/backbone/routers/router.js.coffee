class App.State extends Backbone.Model

class App.Router extends Backbone.Router

  routes:
    '' : 'listSports'
    'sports' : 'listSports'
    'sports/:id' : 'showSport'
    'games/:period' : 'listGames'

  initialize: ->
    @state = new App.State()
    @listenTo @state, 'change:sport', @sportChanged
    @listenTo @state, 'change:period', @periodChanged

  sportChanged: ->
    @listSports()
    sportId = @state.get('sport')
    sport = @sports().get(sportId)
    @sports().highlight(sport)
    @periodList = new App.SportView
      model: sport
      periods: @periods().forSport(sport)
      el: $('#period-list')
    @periodList.render()
    @_view?.remove()

  periodChanged: ->
    periodId = @state.get('period')
    period = @periods().get(periodId)
    @state.set('sport',period.get('sport_id'))

  sports: ->
    unless @_sports?
      @_sports = new App.SportCollection()
      @_sports.fetch()
    @_sports

  periods: ->
    unless @_periods?
      @_periods = new App.PeriodCollection()
      @_periods.fetch()
    @_periods

  games: ->
    unless @_games?
      @_games = new App.GameCollection()
      @_games.fetch()
    @_games

  teams: ->
    unless @_teams?
      @_teams = new App.TeamCollection()
      @_teams.fetch()
    @_teams

  quotes: ->
    unless @_quotes?
      @_quotes = new App.QuoteCollection()
      @_quotes.fetch()
    @_quotes

  swap: (view) ->
    if @_view?
      oldView = @_view
      oldView.remove()
    @_view = view
    $('#views').append view.render().el

  listSports: ->
    @sportList ||= new App.SportIndexView
      collection: @sports()
      el: $('#sport-list')
    @sportList.render()

  showSport: (id) ->
    @state.set('sport', id)

  listGames: (periodId) ->
    pid = parseInt(periodId,10)
    @state.set('period', pid)
    teams = @teams()
    games = @games().forPeriod(pid)
    games.each (game) ->
      game.set
        home_team: teams.get(game.get('home_team_id'))
        visitor_team: teams.get(game.get('visitor_team_id'))
    view = new App.GameIndexView(collection: games)
    @swap(view)
