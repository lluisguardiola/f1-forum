class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

  def show
    load_review
  end

  def new
    @errors = flash[:errors]
    @review = Review.new
    @users = User.all
    @races = Race.all
  end

  def create
    review = Review.new(review_params)

    if review.valid?
      review.save
      redirect_to review_path(review)
    else
      flash[:errors] = review.errors.full_messages
      redirect_to new_review_path(review)
    end
  end

  def edit
    load_review
    @races = Race.all
  end

  def update
    load_review

    if @review.valid?
      @review.update(review_params)
      redirect_to review_path(@review)
    else
      flash[:errors] = @review.errors.full_messages
      redirect_to edit_review_path(@review)
    end
  end

  def destroy
    load_review
    @review.destroy
    redirect_to reviews_path
  end

  private

  def load_review
    @review = Review.all.find_by(id: params[:id])
  end

  def review_params
    params.require(:review).permit(:user_id, :race_id, :content, :rating)
  end
end
