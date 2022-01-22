# 設定載入路徑
I18n.load_path += Dir[Rails.root.join('config', 'locales', '*.{rb,yml}').to_s]

# 設定預設語系
I18n.default_locale = 'zh-TW'
I18n.available_locales = [:'zh-TW', :zh, :en, :ja]

# 設定路徑錯誤時的錯誤畫面
# config.exceptions_app = self.routes