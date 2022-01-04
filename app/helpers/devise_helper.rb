module DeviseHelper
  def devise_error_messages!
    ActiveSupport::Deprecation.warn 

    return "" if resource.errors.empty?
  end
end