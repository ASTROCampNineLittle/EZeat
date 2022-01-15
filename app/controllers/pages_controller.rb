class PagesController < ApplicationController
  def index
    @stores = Store.all
    # 各式餐廳類型的實體變數,先全部寫出來,未來用不到會再刪掉
    # @foodtype0_stores = Store.where(food_type: "中式")
    # @foodtype1_stores = Store.where(food_type: "日式")
    # @foodtype2_stores = Store.where(food_type: "韓式")
    # @foodtype3_stores = Store.where(food_type: "印度")
    # @foodtype4_stores = Store.where(food_type: "義式")
    # @foodtype5_stores = Store.where(food_type: "英式")
    # @foodtype6_stores = Store.where(food_type: "美式")
    # @foodtype7_stores = Store.where(food_type: "法式")
    # @foodtype8_stores = Store.where(food_type: "德式")

    # @q = Dish.ransack(params[:q])
    # @q = Dish.includes(:store, :open_dates, :offers).ransack(params[:q])
    # @search_result = @q.result
    @q = Dish.ransack(params[:q])
  end

  def search_result
    @q = Dish.includes(:store, :open_dates).ransack(params[:q])
    search_result = @q.result.page(params[:page]).per(1)
    @search_result = search_result

    # q = params[:q]
    # @storesq = Store.joins(:dishes).search(name_cont: q).result
    # @dishesq = Dish.search(name_cont: q).result
    # @open_datesq = OpenDate.search(id: q).result
    # @offersq = Offer.search(id: q).result
  end

  def myorder
    @user = Order.where(user_email: "dreamorange830@gmail.com")
    @orders = @user.all
    # @user_all_tickets = @orders.where(ids: @user.ids)
  end

  def mytickets
  end
end
