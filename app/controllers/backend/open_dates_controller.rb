class Backend::OpenDatesController < ApplicationController
  before_action :set_open_date, only: [:edit, :update, :destroy]
  layout "backend"

  def index
    @dish = Dish.find(params[:dish_id])
    @open_dates = @dish.open_dates.all
    
  end

  def new
    @open_date = OpenDate.new
  end

  def create
    @dish = Dish.find(params[:dish_id])
    @open_date = @dish.open_dates.create(open_date_params)

    if @open_date.save
      redirect_to backend_dish_open_dates_path(params[:dish_id])
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @open_date.update(open_date_params)
      redirect_to backend_dish_open_dates_path(@open_date.dish), notice: '修改日期成功'
    else
      render :edit
    end
  end

  def destroy
    origin_dish = @open_date.dish
    @open_date.destroy
    redirect_to backend_dish_open_dates_path(origin_dish), notice: '刪除成功'
  end

  private
    def open_date_params
      params.require(:open_date).permit(:ok_date, :is_open, offer_attributes: [:line_1])
    end

    def set_open_date
      @open_date = OpenDate.find(params[:id])
    end
end


