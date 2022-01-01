class LocalesController < ApplicationController
  # around_action :switch_locale

  # # 語系切換
  # def switch_locale(&action)
  #   locale = params[:locale] || I18n.default_locale
  #   I18n.with_locale(locale, &action)
  # end

  # # 使用者選擇語系後可持續在其他頁面使用該語系
  # def default_url_options(options = {})
  #   { :locale => I18n.locale }.merge options
  # end

  # # 從子網域取得locale code
  # def extract_locale_from_tld
  #   parsed_locale = request.subdomains.first
  #   I18n.available_locales.map(&:to_s).include?(parsed_locale) ?      
  #   parsed_locale : nil
  # end
end