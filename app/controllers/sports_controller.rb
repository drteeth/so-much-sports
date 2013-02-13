class SportsController < ApplicationController
  respond_to :json

  def index
    @sports = Sport.includes(Sport.dependents)
    respond_with @sports
  end

  def show
    @sport = Sport.named(params[:id])
    respond_with @sport
  end

  def sync
    everything = {
      sports: Sport.all,
      periods: Period.all,
      games: Game.all,
      teams: Team.all,
    }
    respond_with everything
  end

  def sync_since
    since = Time.parse(params[:since])
    everything = {
      sports: Sport.where(['updated_at > ?', since]),
      periods: Period.where(['updated_at > ?', since]),
      games: Game.where(['updated_at > ?', since]),
      teams: Team.where(['updated_at > ?', since]),
    }
    respond_with everything
  end

end
