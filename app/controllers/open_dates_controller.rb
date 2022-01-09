class OpenDatesController < ApplicationController
  def show
    @open_date = OpenDate.find(params[:id])
    @dish = @open_date.dish
    @offers = @open_date.offers
  end
end