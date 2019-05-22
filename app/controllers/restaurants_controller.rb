class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def show
    set_restaurant
    new_rating
  end

  def new
    @cuisine = %w[chinese italian japanese french belgian]
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)

    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  def new_rating
    @rating_choice = [0, 1, 2, 3, 4, 5]
    @review = Review.new
  end

  def create_rating
    @review = Review.new(review_params)
    @review.restaurant = set_restaurant
    @review.save
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
