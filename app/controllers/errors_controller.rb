class ErrorsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, :with => :not_found_500
  rescue_from ActionController::RoutingError, :with => :not_found_404

  layout "error_pages"

  def not_found_404
    render 'errors/not_found_404.html', status: 404
  end

  def not_found_500
    render 'errors/not_found_500.html', status: 500
  end
end
