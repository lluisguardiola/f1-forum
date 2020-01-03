class RacesController < ApplicationController
  def index
    @races = Race.all
  end

  def show
    @race = Race.all.find_by(id: params[:id])
  end
end
