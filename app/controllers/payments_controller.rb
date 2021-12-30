class PaymentsController < ApplicationController
  skip_before_action :verify_authenticity_token, :only => [ :confirm]

  def index
    @orders = Order.all
  end
  
  def new
    @form_info = Newebpay::Mpgpost.new.form_info
  end

  def confirm
    @response = Newebpay::Mpgresponse.new(params[:TradeInfo])
    # @order = Order.find_by(MerchanOrderNo: response.result[:MerchantOrderNo])
    #               .update(card_4no: response.result[:Card4no], 
    #                       Paytime: response.result[:Paytime], 
    #                       TradeNo: response.result[:TradeNo],)
  end
end
