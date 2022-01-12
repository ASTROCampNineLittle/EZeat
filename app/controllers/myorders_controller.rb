class MyordersController < ApplicationController
  def index
    @user = Order.where(user_email: "dreamorange830@gmail.com")
    #@user = Order.user
    @orders = @user.all
    # @user_all_tickets = @orders.where(ids: @user.ids)
  end

  def show

  end
end