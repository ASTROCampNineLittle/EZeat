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

    # config.eager_load_paths << Rails.root.join("extras")

    # 若缺少該語系則以哪個語系取代
    config.i18n.fallbacks = {:ja => :'zh-TW', :en => :'zh-TW' }

    # 設定時區為臺北時間
    config.time_zone = "Taipei"

    # 假資料也能設定語系，但目前只有地址能成功改中文...
    Faker::Config.locale = :en

    config.serve_static_assets = true

  end
end
