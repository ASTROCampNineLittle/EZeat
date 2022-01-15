class PaymentsController < ApplicationController
  skip_before_action :verify_authenticity_token, :only => [:confirm ,:new]

  def new
    @form_info = Newebpay::Mpgpost.new.form_info
  end

  def confirm
    @response = Newebpay::Mpgresponse.new(params[:TradeInfo])
    @order = Order.find_by(order_number: @response.order_number)
    @ticket = Order.find_by(order_number: @response.order_number)
    trade_result_update = @order.update(newebpay_amount: @response.newebpay_amount.to_i,
                                        newebpay_time: @response.newebpay_time,
                                        newebpay_card6no: @response.newebpay_card6no)
    sign_in @order.user

    if @response.status === "SUCCESS" && @order.order_status === "pending"
      @order.succed!
    else
      @order.fail!
    end

    if @order.order_status === "succeded"
      ticket_open = @order.update(ticket: "未使用")
    end
  end
end