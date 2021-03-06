source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.0'
# Use sqlite3 as the database for Active Record
gem 'sqlite3'
# Rails Internationalization (I18n) API
gem 'i18n'
# Better Errors replaces the standard Rails error page with a much better and more useful error page.
gem 'better_errors', '~> 2.1', '>= 2.1.1'
# Foreman is a manager for Procfile-based applications.
gem 'foreman'
# The safe Markdown parser, reloaded.
gem 'redcarpet'
# Flexible authentication solution for Rails with Warden
gem 'devise', '~> 4.2'
# A simple, versatile notification library
gem 'rails-assets-notifyjs', source: 'https://rails-assets.org'
# Translations for the devise gem
gem 'devise-i18n', '~> 0.12.1'
# Use Puma as the app server
gem 'puma', '~> 3.11'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Easy upload management for ActiveRecord
gem 'paperclip'
# jQuery UI's JavaScript, CSS, and image files packaged for the Rails 3.1+ asset pipeline
gem 'jquery-ui-rails'
# Object oriented authorization for Rails applications
gem 'pundit', '~> 1.1'
# Help ActiveRecord::Enum feature to work fine with I18n and simple_form.
gem 'enum_help'
# This library provides integration of RubyMoney - Money gem with Rails
gem 'money-rails'
# Template
gem 'bootstrap_sb_admin_base_v2'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Bootstrap
gem 'rails-assets-bootstrap', source: 'https://rails-assets.org'
# This gem provides jQuery and the jQuery-ujs driver for your Rails 4+ application.
gem 'jquery-rails'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  # Markdown Lorem Ipsum generator
  gem 'doctor_ipsum'
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  # Generate Entity-Relationship Diagrams for Rails applications
  gem "rails-erd"
  # Catches mail and serves it through a dream.
  gem 'mailcatcher'
  # A library for generating fake data such as names, addresses, and phone numbers.
  gem 'faker'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15', '< 4.0'
  gem 'selenium-webdriver'
  # Easy installation and use of chromedriver to run system tests with Chrome
  gem 'chromedriver-helper'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
