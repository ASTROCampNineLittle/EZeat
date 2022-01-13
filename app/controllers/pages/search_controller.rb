class Pages::SearchController < ApplicationController

  def index
    @search = ransack_params
    @user_result  = ransack_result
  end

  private
    def ransack_params
      User.ransack(params[:q])
    end

    def ransack_result
      @search.result
    end

end