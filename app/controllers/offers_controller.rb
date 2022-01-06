class OffersController < ApplicationController
  def index
    @store = Store.find(params[:store_id])
    @dishes = @store.dishes
  end

  def show
  end
end