source 'https://rubygems.org'

ruby '2.5.3'
gem 'rails', '~> 5.2.1'

# Database
gem 'pg'

# App server
gem 'puma', '~> 3.11'

# CSS and JS
gem 'sassc-rails'
gem 'uglifier', '>= 1.3.0'
gem 'bootstrap'
gem 'autoprefixer-rails'
gem 'jquery-rails', '~> 4.3'

# Auth
gem 'bcrypt', '~> 3.1.7'

# ActiveStorage
gem 'mini_magick', '~> 4.8'
gem 'aws-sdk-s3', require: false

# Views
gem 'rails_autolink'

# Fast boot
gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'chromedriver-helper'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
