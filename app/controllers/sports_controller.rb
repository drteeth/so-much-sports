class SportsController < ApplicationController
  respond_to :json

  def index
    @sports = Sport.includes(Sport.dependents)
  end

  def show
    @sport = Sport.named(params[:id])
  end
end
