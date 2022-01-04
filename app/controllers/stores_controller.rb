class StoresController < ApplicationController
  def index
  end

  def show
    @store = Store.find_by(id: params[:id])
    @dishes = @store.dishes
    @availible_dates = @dishes.joins(:open_dates).pluck(:availible_date).map { |date| date.strftime("%m/%d") }
  end
end