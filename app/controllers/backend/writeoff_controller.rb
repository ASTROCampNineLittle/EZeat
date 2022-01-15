class Backend::WriteoffController < ApplicationController
  def new
    @order_list = Order.find_by(id: params[:order_id])

    if params[:writeoff_number] === @order_list.order_number
      @order_list.update(ticket: "已核銷",)
      redirect_to backend_store_path(params[:store_id])
    end
  end
end