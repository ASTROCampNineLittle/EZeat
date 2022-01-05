class OffersController < ApplicationController
  def index
    @store = Store.find(params[:store_id])
    @dishes = @store.dishes.all
  end

  def show
  end
end
