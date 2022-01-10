class Users::SessionsController < Devise::SessionsController
  before_action :set_q, only: [:index, :search]

  def after_sign_in_path_for(resource_or_scope)
    stored_location_for(resource_or_scope) || super
  end

  def search
    @results = @q.result
  end

  private

  def set_q
    @q = User.ransack(params[:q])
  end
end