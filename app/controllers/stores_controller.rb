class StoresController < ApplicationController

  def index
   @stores = Store.find
  end

  def show
    @store = Store.find(params[:id])
    @dishes = @store.dishes
  end
end