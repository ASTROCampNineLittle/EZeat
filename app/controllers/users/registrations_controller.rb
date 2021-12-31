class Users::RegistrationsController < Devise::RegistrationsController 
  before_action :authenticate_user!
  before_action :permitted_params_for_sign_up, only: [:create], if: :devise_controller?
  before_action :permitted_params_for_update, only: [:update], if: :devise_controller?

  def edit
    if resource.save
    else
      render :edit
    end
  end


  private

  def permitted_params_for_sign_up
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :password_confirmation, :tel, :gender, :role, :name])
  end

  def permitted_params_for_update
    devise_parameter_sanitizer.permit(:account_update, keys: [:email, :password, :password_confirmation, :tel, :gender, :role, :name])
  end
end


