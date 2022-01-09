class Users::SessionsController < Devise::SessionsController
  # after_action :store_location

  before_action :keep_attached_unit_path! # UPDATED

  protected
  def keep_attached_unit_path! # UPDATED
    p 11111
    @keep_attached_unit_path = true
  end

  def after_sign_in_path_for(resource_or_scope)
    if resource_or_scope.is_a?(User) && session[:attached_unit_path].present?
      p 2222222
      session[:attached_unit_path]
    else
      p 333333333
      super
    end
  end

  # def store_location
  #   session[:previous_urls] ||= []
  #   # store unique urls only
  #   session[:previous_urls].prepend request.fullpath if session[:previous_urls].first != request.fullpath && request.fullpath != "/user" && request.fullpath != "/user/login" && request.fullpath != "/" && request.fullpath != "/user/logout" && request.fullpath != "/user/join" && request.fullpath != "/user/auth/facebook/callback"
  # end

  # def after_sign_in_path_for(resource)
  #   p "hello"
  #   stored_location_for(resource) || user_root_path
  # end

  # def after_sign_in_path_for(resource_or_scope)
  #   p "hello"
  #   stored_location_for(resource_or_scope) || super
  # end

  # def stored_location_for(resource)
  #   if (resource = session["return_to"])
  #     p "no"
  #     # session["#{scope}_return_to"] = nil
  #     session["#{scope}.return_to"] = nil
  #     r
  #   else
  #     p "ahhh"
  #     super
  #   end
  # end

  # def after_sign_in_path_for(resource)
  #   (session[:"user.return_to"].nil?) ? "/" : session[:"user.return_to"].to_s
  # end

  # def store_location
  #   # store last url - this is needed for post-login redirect to whatever the user last visited.
  #   return unless request.get?
  #   if (request.path != "/users/sign_in" &&
  #       request.path != "/users/sign_up" &&
  #       request.path != "/users/password/new" &&
  #       request.path != "/users/password/edit" &&
  #       request.path != "/users/confirmation" &&
  #       request.path != "/users/sign_out" &&
  #       !request.xhr?) # don't store ajax calls
  #     session[:previous_url] = request.fullpath
  #   end
  # end

  # def after_sign_in_path_for(resource)
  #   stored_location_for(resource) ||
  #     if resource.is_a?(User) && resource.can_register?
  #       user_root_path
  #     else
  #       super
  #     end
  # end

  # def after_sign_in_path_for(resource)
  #   redirect_to stored_location_for(:user)
  # end

  # def storable_location?
  #   request.get? && is_navigational_format? && !devise_controller? && !request.xhr?
  # end

  # def store_user_location!
  #   # :user is the scope we are authenticating
  #   store_location_for(:user, request.fullpath)
  # end
end
