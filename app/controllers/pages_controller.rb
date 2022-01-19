class PagesController < ApplicationController
  def index
    @stores = Store.all

    # 各式餐廳類型的實體變數,先全部寫出來,未來用不到會再刪掉
    @foodtype0_stores = @stores.where(food_type: "中式")
    @foodtype1_stores = @stores.where(food_type: "日式")
    @foodtype2_stores = @stores.where(food_type: "韓式")
    @foodtype3_stores = @stores.where(food_type: "印度")
    @foodtype4_stores = @stores.where(food_type: "義式")
    @foodtype5_stores = @stores.where(food_type: "英式")
    @foodtype6_stores = @stores.where(food_type: "美式")
    @foodtype7_stores = @stores.where(food_type: "法式")
    @foodtype8_stores = @stores.where(food_type: "德式")

    # @q = Dish.includes(:store, :open_dates).ransack(params[:q])
    # @q = Store.includes(:dishes).includes(:open_dates).ransack(params[:q])
    # @q = Dish.includes(:store).ransack(params[:q])
    # @q = Store.ransack(params[:q])

    #return all clients that match the search criteria

  end

  def search_result
    @store_search = Store.search(params[:name]).all
    @dish_search = Dish.search(params[:name]).all
    # @q = Store.ransack(params[:q])
    # @q = Store.includes(:dishes).joins(:open_dates).ransack(params[:q])
    # @q = Dish.includes(:store, :open_dates).ransack(params[:q])
    # @q.sorts = 'open_dates_availible_date desc' if @q.sorts.empty?
    # search_result = @q.result(distinct: true).includes(:dishes).joins(:open_dates)
    # search_result = @q.result(distinct: true)
    # @search_result = search_result
  end
end