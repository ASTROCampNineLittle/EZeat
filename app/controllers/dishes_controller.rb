class DishesController < ApplicationController
  def index
  end

  def show
    @store = Store.find((params[:store_id]))
    @dish = Dish.find(params[:id])
    @open_dates = @dish.open_dates
  end
end