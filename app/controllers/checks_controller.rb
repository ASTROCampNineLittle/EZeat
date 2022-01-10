class ChecksController < ApplicationController
  before_action :signed_in_checker

  def index
  end

  def create

    @user = User.first
    @amount = (params[:order_price].to_i)*(params[:order_people].to_i)
  end
end
