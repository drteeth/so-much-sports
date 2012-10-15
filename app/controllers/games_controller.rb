class GamesController < ApplicationController
  respond_to :json

  def index
    @games = Game.scoped
  end

  def show
    @game = Game.find(params[:id])
  end
end
