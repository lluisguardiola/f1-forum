class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

  def show
    @review = Review.all.find_by(id: params[:id])
  end

  def new
    # @errors = flash[:errors]
    # @heroine = Heroine.new
    # @users = User.all
  end

  def create

  end

  def edit
  end
end
