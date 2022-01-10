class ChecksController < ApplicationController
  def new
    @user = User.last
    @ezeat_amount = (params[:order_price].to_i)*(params[:order_people].to_i)
    @ezeat_random_number = ezeat_random_number
    @order = Order.new
  end

  def create
    @order = Order.create(order_params)
    if @order.save
      redirect_to new_payment_path
    else
      render
    end
  end

  private
  def order_params
    params.require(:order).permit(:open_date_id, :name, :tel, :email, :user_email, :order_dish, :order_number, :order_date, :order_time, :order_people, :ezeat_amount, :order_status)
  end

  def ezeat_random_number
    ezeat = "EZeat"
    timestamp = Time.now.strftime("%m%d%H%M")
    ezeat_time = ezeat.insert(-1,timestamp)
    number = rand(0...999).to_s.rjust(3, '0')
    return ezeat_time_random = ezeat_time.insert(-1,number)
  end
end
