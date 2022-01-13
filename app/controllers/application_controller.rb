class ApplicationController < ActionController::Base
  before_action :set_locale
  before_action :store_user_location!, if: :storable_location?
  around_action :switch_locale
  helper_method :has_company

  private

  # 設定語系
  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  # 語系切換
  def switch_locale(&action)
    locale = params[:locale] || I18n.default_locale
    I18n.with_locale(locale, &action)
  end

  def storable_location?
    request.get? && is_navigational_format? && !request.xhr? && !devise_controller?
  end

  def store_user_location!
    store_location_for(:user, request.fullpath)
  end

  def signed_in_checker
    unless current_user.present?
      flash[:notice] = I18n.t 'authenticate.signed_in_checker.common'
      redirect_to new_user_session_path
    end
  end

  # 確認是否有公司
  def has_company
    if signed_in?
      current_user.company.present?
    end
  end
end