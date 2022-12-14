class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: %i[ show ]

  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def show
    @review = Review.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)

    if @restaurant.save
      redirect_to @restaurant, notice: "Restaurant #{@restaurant.name} was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  # Sanitized parameters
  def restaurant_params
    params.require(:restaurant).permit(:name, :category, :address, :phone_number)
  end
end
