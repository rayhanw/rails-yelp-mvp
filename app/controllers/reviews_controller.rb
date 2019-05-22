class ReviewsController < ApplicationController
  def new
    @rating_choice = [0, 1, 2, 3, 4, 5]
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)

    @review.restaurant = Restaurant.find(params[:restaurant_id])
    @review.save

    redirect_to restaurant_path(@review.restaurant_id)
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
