class ChecksController < ApplicationController
  def index
  end

  def create
    @user = User.first
    @amount = (params[:order_price].to_i)*(params[:order_people].to_i)
  end
end
