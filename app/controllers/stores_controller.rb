class StoresController < ApplicationController
  def show
    @store = Store.find(params[:id])
    @dishes = @store.dishes
  end
end