class OffersController < ApplicationController
  def index
    @store = Store.find(params[:store_id])
    @dishes = @store.dishes.all
    # # byebug
    # @date = params[:date]
    # @date = params[:date]
  end

  def show
  end
end
