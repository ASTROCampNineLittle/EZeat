class Users::RegistationsController < Devise::RegistrationsController 
  before_action :configure_permitted_parameters, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit(:email, :password, :password_confirmation, :tele, :gender, :role, :username)
    end
  end

  def configure_account_update_params
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit(:email, :password, :password_confirmation, :tele, :gender, :role, :username)
    end
  end
end


