class PeriodsController < ApplicationController
  def index
    @periods = Period.scoped
  end

  def show
    @period = Period.find_by_sport_id_and_period_id(params[:sport_id], params[:id])
  end
end
