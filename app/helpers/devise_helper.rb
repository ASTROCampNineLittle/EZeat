module DeviseHelper
  def devise_error_messages!
    ActiveSupport::Deprecation.warn 

    return "" if resource.errors.empty?

    render "devise/shared/error_messages", resource: resource
  end
end