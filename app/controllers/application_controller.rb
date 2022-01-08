class ApplicationController < ActionController::Base
  before_action :set_locale
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

  # 確認是否有公司
  def has_company
    if signed_in?
      check_company = current_user.company
      !check_company.nil?
    end
  end
end

class SignedInChecker
  def self.before(controller)
    unless controller.send(:signed_in?)
      controller.flash[:notice] = I18n.t 'authenticate.signed_in_checker.common'
      controller.redirect_to controller.user_session_path
    end
  end
end