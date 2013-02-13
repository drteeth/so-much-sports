class App.Quote extends Backbone.Model
class App.QuoteCollection extends Backbone.Collection
  model: App.Quote
  localStorage: new Backbone.LocalStorage("periods")
