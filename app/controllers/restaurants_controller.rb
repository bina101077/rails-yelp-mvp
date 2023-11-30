class RestaurantsController < ApplicationController

  def index
    @restaurant = Restaurant.all
    # redirect_to restaurants_path(@restaurant)
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.create(restaurant_params)
    @restaurant.save
    redirect_to restaurant_path(@restaurant)
  end

  def top
    @restaurants = Restaurant.where(rating: 5)
  end

   private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end

end
