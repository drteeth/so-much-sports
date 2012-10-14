class GamesController < ApplicationController
  respond_to :json

  def index
    @sports = Sport.scoped
  end

  def show
    @sport = Sport.find_by_name(params[:id].upcase)
  end
end
