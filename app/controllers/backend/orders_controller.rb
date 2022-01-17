class Backend::OrdersController < ApplicationController
  layout "backend"

  def index
    @store = Store.find(params[:store_id])
    @order_summary = @store.orders.where('order_date > ?', DateTime.now)
  end

end

