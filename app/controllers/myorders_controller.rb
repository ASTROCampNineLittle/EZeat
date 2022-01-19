class MyordersController < ApplicationController
  require 'barby'
  require 'barby/barcode/qr_code'
  require 'barby/outputter/png_outputter'

  def index
    @user_order = Order.where(user_id: current_user.id).order(order_date: :desc).where.not(ticket: nil)

    # @ticket_overdue = Order.where(order_date: overdue? )
    # if @user_order.order_date < Time.now
    #   @user_order.update(ticket: "已逾期")
    # end
    # @ticket_overdue = @user_order.where(ticket: "已逾期")
    @q = Order.ransack(params[:q])
    @orders_result = @q.result.includes(:store).where(user_id: current_user.id)
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

  def before_today
    self < Time.now
  end
end

# 當票卷超過今天的日期,票卷就會轉為逾期
# 顯示邏輯, 如果ticket 是 nil 就不顯示
# 票卷判斷, 定位的日期 < 今天的日期 逾期
