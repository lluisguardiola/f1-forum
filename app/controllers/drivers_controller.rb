class DriversController < ApplicationController
  def index
    @drivers = Driver.all
  end

  def show
    @driver = Driver.all.find_by(id: params[:id])
  end
end
