class Backend::StoresController < ApplicationController
  before_action :set_store, only: [:show, :edit, :update, :destroy]
  layout "backend"

  def index
    @company = Company.find(params[:company_id])
    @stores = @company.stores.all
  end

  def new
    @store = Store.new
  end

  def create
    @company = Company.find(params[:company_id])
    @store = @company.stores.create(store_params)

    if @store.save
      redirect_to backend_company_stores_path(params[:company_id]), notice: '新增分店成功'
    else
      render :new
    end
  end

  def show 
  end

  def edit
  end

  def update 
    if @store.update(store_params)
      redirect_to backend_company_stores_path(@store.company), notice: '修改分店成功'
    else
      render :edit
    end
  end

  def destroy
    origin_company = @store.company
    @store.destroy
    redirect_to backend_company_stores_path(origin_company), notice: '刪除成功'
  end

  private
    def store_params
      params.require(:store).permit(:name, :food_type, :tel, :address, :intro, :image)
    end

    def set_store
      @store = Store.find(params[:id])
    end
end
