class ErrorsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :not_found_500
  rescue_from Exception, with: :not_found_500
  rescue_from ActionController::RoutingError, with: :not_found_404

  # 401 token 過期錯誤用JSON 的接法 → 目前用不到
  # def unauthorized
  #   render status: :unauthorized
  # end

  def not_found_404
    render 'errors/not_found_404.html', layout: 'error_pages', status: 404
  end

  def not_found_500
    render 'errors/not_found_404.html', layout: 'error_pages', status: 500
  end
end
