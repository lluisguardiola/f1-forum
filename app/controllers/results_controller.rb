class ResultsController < ApplicationController
  def show
    @result = Result.all.find_by(id: params[:id])
  end
end
