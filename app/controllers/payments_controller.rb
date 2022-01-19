class PaymentsController < ApplicationController
  skip_before_action :verify_authenticity_token, :only => [:confirm]

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
    # UserMailer.after_payment(@order.user).deliver_now

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