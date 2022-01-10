class Backend::OffersController < ApplicationController
  before_action :set_offer, only: [:edit, :update, :destroy]
  layout "backend"

  def index
    @open_date = OpenDate.find(params[:open_date_id])
    @offers = @open_date.offers.all
  end

  def new
    @offer= Offer.new
  end

  def create
    @open_date = OpenDate.find(params[:open_date_id])
    @offer = @open_date.offers.create(offer_params)
    # @offer.ok_time.strftime("%k%M")

    if @offer.save
      redirect_to backend_open_date_offers_path(params[:open_date_id])
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @offer.update(offer_params)
      redirect_to backend_open_date_offers_path(@offer.open_date), notice: '修改訂位人數成功'
    else
      render :edit
    end
  end

  def destroy
    origin_open_date = @offer.open_date
    @offer.destroy
    redirect_to backend_open_date_offers_path(origin_open_date), notice: '刪除成功'
  end

  private
  def offer_params
    params.require(:offer).permit(:availible_time, :capacity)
  end

  def set_offer
    @offer = Offer.find(params[:id])
  end
end
