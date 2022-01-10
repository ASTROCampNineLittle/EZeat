class Backend::DishesController < ApplicationController
  before_action  :set_dish, only: [:edit, :update, :destroy]
  layout "backend"

  def index
    @store = Store.find(params[:store_id])
    @dishes = @store.dishes.all
  end

  def new
    @dish = Dish.new
    @dish.images.build
  end

  def create
    @store = Store.find(params[:store_id])
    @dish = @store.dishes.create(dish_params)

    if @dish.save
      redirect_to backend_store_dishes_path(params[:store_id]), notice: '新增方案成功'
    else
      render :new
    end
  end

  def edit
    @store = @dish.store
    @dish.open_dates.build
  end

  def update
    @store = @dish.store
    if @dish.update(dish_params)
      redirect_to backend_store_dishes_path(@dish.store)
    else
      render :index
    end
  end

  def destroy
    origin_store = @dish.store
    @dish.destroy
    redirect_to backend_store_dishes_path(origin_store), notice: '刪除成功'
  end

  private
    def dish_params
      params.require(:dish).permit(:name,
                                   :price, 
                                   :start_date, 
                                   :end_date, 
                                   :status, 
                                   :intro, 
                                   images_attributes: [ :image ], 
                                   open_dates_attributes: [ :id, :availible_date, :_destroy ])
    end

    def set_dish
      @dish = Dish.find(params[:id])
    end
end

