source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.0'

# For generating fake data
gem 'faker', '~> 2.19'

# Bundle carrierwave & AWS related Gems
gem 'carrierwave', '~> 2.2', '>= 2.2.2'
gem 'mini_magick', '~> 4.11'
gem 'fog-aws', '~> 3.12'

# # framework for multiple-provider authentication.
# gem 'omniauth', '~> 2.0', '>= 2.0.4'

# Facebook OAuth2 Strategy for OmniAuth
gem 'omniauth-facebook', '~> 9.0'

# Google OAuth2 strategy for OmniAuth
gem 'omniauth-google-oauth2', '~> 1.0'

# Implementing a CSRF token verifier
gem 'omniauth-rails_csrf_protection', '~> 1.0'

# For rescue from ActionDispatch::Cookies::CookieOverflow
gem 'activerecord-session_store', '~> 2.0'

# # For bulk inserting data
# gem 'activerecord-import', '~> 1.3'

# The Process manager
gem 'foreman', '~> 0.87.2'

# Create pretty URLs and work with human-friendly strings as if they were numeric ids
gem 'friendly_id', '~> 5.4', '>= 5.4.2'

# A flexible authentication
gem 'devise', '~> 4.8', '>= 4.8.1'

# Object oriented authorization
gem 'pundit', '~> 2.1', '>= 2.1.1'

# Enum-like behavior
gem 'ruby-enum', '~> 0.9.0'

# A continuation of the acts-as-state-machine
gem 'aasm', '~> 5.2'

# The MetaSearch's functionality
gem 'ransack', '~> 2.5'

# As the paginator
gem 'kaminari', '~> 1.2', '>= 1.2.1'

# Translations for the devise gem
gem 'devise-i18n', '~> 1.10', '>= 1.10.1'

# The locale data and translations to internationalize rails
gem 'rails-i18n', '~> 7.0', '>= 7.0.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'rails', '~> 6.1.4', '>= 6.1.4.1'
# Use postgresql as the database for Active Record
gem 'pg', '~> 1.1'
# Use Puma as the app server
gem 'puma', '~> 5.0'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 5.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.4', require: false

group :development, :test do

  # Helper for killing N+1 queries and unused eager loading.
  gem 'bullet', '~> 7.0'

  # For generating fake data
  gem 'faker', '~> 2.19'

  # Configuration using ENV and a single YAML file
  gem 'figaro', '~> 1.2'

  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 4.1.0'
  # Display performance information such as SQL time and flame graphs for each request in your browser.
  # Can be configured to work on production as well see: https://github.com/MiniProfiler/rack-mini-profiler/blob/master/README.md
  # gem 'rack-mini-profiler', '~> 2.0'
  gem 'listen', '~> 3.3'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 3.26'
  gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

