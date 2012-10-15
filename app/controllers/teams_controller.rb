class TeamsController < ApplicationController

  def index
    @teams = Team.scoped
  end

  def show
    @team = Team.find(params[:id])
  end

end
