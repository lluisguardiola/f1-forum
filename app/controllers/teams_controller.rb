class TeamsController < ApplicationController
  def index
    @teams = Team.all
  end

  def show
    @team = Team.all.find_by(id: params[:id])
  end
end
