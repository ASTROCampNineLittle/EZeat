class StoresController < ApplicationController
  def index
  end

  def show
    @store = Store.find_by(id: params[:id])
    @dishes = @store.dishes.all
  end
end
