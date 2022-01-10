class DishesController < ApplicationController
  def show
    @store = Store.find(params[:store_id])
    @dish = Dish.find(params[:id])
    @open_dates = @dish.open_dates
  end
end