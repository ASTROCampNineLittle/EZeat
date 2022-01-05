class ErrorsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, :with => :not_found_500
  rescue_from ActionController::RoutingError, :with => :not_found_404

  def not_found_404
    render 'errors/not_found_404.html', :layout => 'error_pages', status: 404
  end

  def not_found_500
    render 'errors/not_found_404.html', :layout => 'error_pages', status: 500
  end

  def render_404
    render 'errors/not_found_404.html', :layout => 'error_pages', :status => 404
  end
end
