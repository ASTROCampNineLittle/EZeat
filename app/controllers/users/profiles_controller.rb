class Users::ProfilesController < Devise::RegistrationsController
  def profile
    @user = current_user.gender
  end
end


