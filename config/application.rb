require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module EZeat888
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    # Configuration for the application, engines, and railties goes here.

    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.

    # 設定時區為臺北時間
    config.time_zone = "Taipei"
    # config.eager_load_paths << Rails.root.join("extras")

    # 設定載入路徑
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '*.{rb,yml}').to_s]

    # 設定預設語系
    config.i18n.default_locale = :"zh-TW"

    # default locale when translation missing
    # config.i18n.fallbacks = :"zh-TW"

  end
end
