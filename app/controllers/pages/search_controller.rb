class Pages::SearchController < ApplicationController
  def index
    @store = Store.ransack(params[:q])
    @result = @store.result(distinct: true)
  end
end
