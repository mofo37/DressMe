source 'https://rubygems.org'

ruby '2.5.3'
gem 'rails', '~> 5.2.1'

# Database
gem 'pg'

# App server
gem 'puma'

# CSS and JS
gem 'sassc-rails'
gem 'uglifier'
gem 'bootstrap'
gem 'autoprefixer-rails'
gem 'jquery-rails'

# Auth
gem 'bcrypt'

# Uploads using ActiveStorage
gem 'mini_magick', '~> 4.8'
gem 'aws-sdk-s3', require: false

# Views
gem 'rails_autolink'

# Fast boot
gem 'bootsnap', require: false

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'web-console'
  gem 'listen'
end

group :test do
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'chromedriver-helper'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
