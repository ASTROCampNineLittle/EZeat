class MyordersController < ApplicationController
  require 'barby'
  require 'barby/barcode/qr_code'
  require 'barby/outputter/png_outputter'

  def index
    @q = Order.ransack(params[:q])
    @orders_result = @q.result.includes(:store).where(user_id: current_user.id).order(created_at: :desc).where.not(ticket: nil)
  end

  def show
    @user_order = Order.find(params[:id])

    barcode = Barby::QrCode.new(@user_order.order_number)
    @blob = Barby::PngOutputter.new(barcode).to_png(xdim: 11)

    respond_to do |format|
      format.html
      format.png do
        send_data @blob, type: "image/png"
      end
    end
  end

  def search
    @q = Order.ransack(params[:q])
  end

  # def before_today
  #   self < Time.now
  # end
end