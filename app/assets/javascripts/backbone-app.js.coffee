#= require jquery
#= require jquery_ujs
#= require handlebars
#= require underscore
#= require backbone
#= require backbone.localStorage
#= require_self
#= require_tree ./backbone

@App =
  init: ->
    App.sync().on 'loading:complete', ->
      $('#loading').hide()
      @router = new App.Router()
      Backbone.history.start()

  navigate: (path, options={trigger:true}) ->
    @router.navigate(path, options)

$ ->
  App.init()
