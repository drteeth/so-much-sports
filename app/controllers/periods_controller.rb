class PeriodsController < ApplicationController
  respond_to :json

  def index
    @periods = Sport.named(params[:sport_id]).periods
  end

  def show
    @period = Period.sport_and_period(params[:sport_id], params[:id])
  end

end
