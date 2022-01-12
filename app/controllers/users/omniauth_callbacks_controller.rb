class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  skip_before_action :verify_authenticity_token, only: :google_oauth2

  def google_oauth2
    call_for(:google)
  end

  def facebook
    call_for(:facebook)
  end

  def call_for(provider)
    @user = User.check_omniauth(request.env["omniauth.auth"])
    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication
      # flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "#{provider}"
      set_flash_message(:notice, :success, kind: "#{provider}") if is_navigational_format?
    else
      session["devise.#{provider}_data"] = request.env["omniauth.auth"].except("extra")
      redirect_to new_user_registration_path
    end
  end

  def failure
    redirect_to root_path
  end
end