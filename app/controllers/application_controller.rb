class ApplicationController < ActionController::Base
  before_action :set_locale
  around_action :switch_locale

  helper_method :has_company

  after_action :clear_attached_unit # UPDATED

  private

  def clear_attached_unit
    p 88888888888
    session[:attached_unit_path] = nil unless keep_attached_unit_path?
  end

  def keep_attached_unit_path? # UPDATED
    p 90000000009090
    @keep_attached_unit_path
  end

  # 設定語系
  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  # 語系切換
  def switch_locale(&action)
    locale = params[:locale] || I18n.default_locale
    I18n.with_locale(locale, &action)
  end

  def signed_in_checker
    unless current_user.present?
      flash[:notice] = I18n.t 'authenticate.signed_in_checker.common'
      # redirect_to new_user_session_path
    end
  end

  # 確認是否有公司
  def has_company
    if signed_in?
      check_company = current_user.company
      !check_company.nil?
    end
  end
end