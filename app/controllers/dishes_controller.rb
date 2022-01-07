class DishesController < ApplicationController
  def index
  end

  def show
    @dish = Dish.find(params[:store_id])
    @open_dates = @dish.open_dates
  end
end