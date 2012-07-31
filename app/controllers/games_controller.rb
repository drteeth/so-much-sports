class GamesController < ApplicationController
  respond_to :json

  def index
    @sports = Sport.scoped
  end
end
