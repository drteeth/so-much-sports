class SportsController < ApplicationController
  def index
    @sports = Sport.scoped
  end

  def show
    @sport = Sport.find(params[:id])
  end
end
