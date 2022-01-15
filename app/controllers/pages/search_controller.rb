class Pages::SearchController < ApplicationController
  before_action :set_q, only: [:index, :search]

  def search
    @results = @q.result
  end

  private

  def set_q
    @q = Store.ransack(params[:q])
  end
end