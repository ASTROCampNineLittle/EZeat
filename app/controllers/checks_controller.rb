class ChecksController < ApplicationController
  def index
  end

  def show
    @user = User.first
  end
end
