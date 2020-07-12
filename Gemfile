# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

gem 'active_storage_validations', '0.8.2'
gem 'bootstrap-will_paginate', '1.0.0'
gem 'image_processing', '1.9.3'
gem 'mini_magick', '4.9.5'
gem 'rails', '~> 6.0.0'
gem 'ransack'
gem 'will_paginate', '3.1.8'

gem 'devise'
gem 'omniauth'
gem 'omniauth-facebook'

gem 'bcrypt', '~> 3.1', '>= 3.1.12'
gem 'bootstrap-sass', '3.4.1'

gem 'bootsnap', '>= 1.4.2', require: false
gem 'jbuilder', '~> 2.7'
gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5'
gem 'turbolinks', '~> 5'
gem 'webpacker', '~> 4.0'

gem 'rubocop', require: false
gem 'rubocop-airbnb'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'sqlite3', '1.4.2'
end

group :development do
  gem 'faker', '2.1.2'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'guard', '2.16.2'
  gem 'guard-minitest', '2.4.6'
  gem 'minitest', '5.11.3'
  gem 'minitest-reporters', '1.3.8'
  gem 'rails-controller-testing'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end

group :production do
  gem 'pg', '1.1.4'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
