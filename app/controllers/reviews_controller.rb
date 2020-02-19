class ReviewsController < ApplicationController
  before_action :set_restaurant, only: [ :new, :create]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    # this is how we assign the review to a restaurant
    @review.restaurant = @restaurant
    @review.save

    redirect_to restaurant_path(@restaurant)
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
end
