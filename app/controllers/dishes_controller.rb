class DishesController < ApplicationController
  def show
    @store = Store.find(params[:store_id])
    @dish = Dish.find(params[:id])
    @open_dates = @dish.open_dates
    @availible_times = @open_dates.joins(:offers).pluck(:availible_time).map { |date| date.strftime("%Y%m%d%H%M") }
  end
end