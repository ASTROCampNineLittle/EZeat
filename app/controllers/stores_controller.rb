class StoresController < ApplicationController
  def index
  end

  def show
    @store = Store.find_by(id: params[:id])
  end
end
