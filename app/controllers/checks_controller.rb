class ChecksController < ApplicationController
  before_action :signed_in_checker

  def index
  end

  def new
    @user = current_user
    @order = Order.new
    @open_date = OpenDate.find(params[:open_date_id])
    @store = @open_date.dish.store
    @ezeat_amount = (params[:order_price].to_i)*(params[:order_people].to_i)
    @ezeat_amount_commify = @ezeat_amount.to_s.gsub(/(\d)(?=(\d{3})+$)/,'\1,')
    @dish_price_commify = params[:order_price].gsub(/(\d)(?=(\d{3})+$)/,'\1,')
    # 參考來源 https://stackoverflow.com/questions/3696555/explain-ruby-commify-large-integer-method
    @ezeat_random_number = ezeat_random_number
  end

  def create
    @order = Order.create(order_params)
    if @order.save
      redirect_to new_payment_path
    else
      render new_check_path
    end
  end

  private
  def order_params
    params.require(:order).permit(:open_date_id, :name, :tel, :email, :order_dish, :order_number, :order_date, :order_time, :order_people, :ezeat_amount, :order_status, :user_id, :store_id)
  end

  def ezeat_random_number
    ezeat = "EZeat"
    timestamp = Time.now.strftime("%m%d%H%M")
    ezeat_time = ezeat.insert(-1,timestamp)
    number = rand(0...999).to_s.rjust(3, '0')
    return ezeat_time_random = ezeat_time.insert(-1,number)
  end
end
