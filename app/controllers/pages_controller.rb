class PagesController < ApplicationController
  def index
    @stores = Store.all

    @foodtype0_stores = @stores.where(food_type: "中式")
    @foodtype1_stores = @stores.where(food_type: "日式")
    @foodtype2_stores = @stores.where(food_type: "韓式")
    @foodtype3_stores = @stores.where(food_type: "印度")
    @foodtype4_stores = @stores.where(food_type: "義式")
    @foodtype5_stores = @stores.where(food_type: "英式")
    @foodtype6_stores = @stores.where(food_type: "美式")
    @foodtype7_stores = @stores.where(food_type: "法式")
    @foodtype8_stores = @stores.where(food_type: "德式")
    @foodtype9_stores = @stores.where(food_type: "墨西哥")
    @foodtype10_stores = @stores.where(food_type: "其它")

    @q = Store.ransack(params[:q])
  end

  def search_result
    @q = Store.ransack(params[:q])
    @search_result = @q.result

    if params[:date].present?
      @search_result_two = @search_result.includes(dishes: :open_dates).where(dishes: { open_dates: { availible_date: params[:date] } })
    end
  end

  def privacy_policy
  end
end