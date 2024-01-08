# frozen_string_literal: true

source 'https://rubygems.org'

ruby '3.0.2'

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem 'rails', '~> 7.1.2'

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem 'sprockets-rails'

# Use postgresql as the database for Active Record
gem 'pg', '~> 1.1'

# Use the Puma web server [https://github.com/puma/puma]
gem 'puma', '>= 5.0'

# Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
gem 'importmap-rails'

# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem 'turbo-rails'

# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem 'stimulus-rails'

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem 'jbuilder'

# Use Redis adapter to run Action Cable in production
# gem "redis", ">= 4.0.1"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[windows jruby]

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', require: false

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

# Upload files in your Ruby applications, map them to a range of ORMs, store them on different backends.
# See in [https://github.com/carrierwaveuploader/carrierwave]
gem 'carrierwave'

# Manipulate images with minimal use of memory via ImageMagick / GraphicsMagick
# See in [https://github.com/minimagick/minimagick]
gem 'mini_magick'

# Factory_girl provides a framework and DSL for defining and using factories - less error-prone, more explicit, and all-around easier to work with than fixtures.
# See in [https://github.com/thoughtbot/factory_bot]
# gem 'factory_girl', '~> 3.0.0'

# Faker, a port of Data::Faker from Perl, is used to easily generate fake data: names, addresses, phone numbers, etc.
# See in [https://github.com/faker-ruby/faker]
gem 'faker', '<= 0.9.5'

# factory_bot_rails provides integration between factory_bot and rails 5.0 or newer
# See in [https://github.com/thoughtbot/factory_bot_rails]
gem 'factory_bot_rails', '~> 6.0'

# Easy upload management for ActiveRecord
# See in [https://github.com/thoughtbot/paperclip]
gem 'paperclip', '~> 2.7'

# Simple, efficient background processing for Ruby
# See in [https://sidekiq.org/]
gem 'sidekiq'

# A Ruby client that tries to match Redis' API one-to-one, while still providing an idiomatic interface.
# See in [https://github.com/redis/redis-rb]
gem 'redis'

# Clean ruby syntax for writing and deploying cron jobs.
# See in [https://github.com/javan/whenever]
gem 'whenever', require: false

# A pure ruby implementation of the RFC 7519 OAuth JSON Web Token (JWT) standard.
# See in [https://github.com/jwt/ruby-jwt]
gem 'jwt'

# A Ruby static code analyzer and formatter, based on the community Ruby style guide.
# @see {https://github.com/rubocop/rubocop}
gem 'rubocop', '~> 0.78.0'

# A Ruby static code analyzer and formatter, based on shopify style guide.
# @see {https://github.com/Shopify/ruby-style-guide}
gem 'rubocop-shopify', '~> 1.0.0', require: false

gem 'rswag-api'
gem 'rswag-ui'

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem 'debug', platforms: %i[mri windows]
  # Pry is a runtime developer console and IRB alternative with powerful introspection capabilities
  # See in [https://pry.github.io/]
  gem 'pry'
  # Rspec-rails is a testing framework for Rails
  # See in [https://github.com/rspec/rspec-rails]
  gem 'rspec-rails'
  # BDD for Ruby
  # See in [https://github.com/rspec]
  gem 'rspec'
  # When mail is sent from your application, Letter Opener will open a preview in the browser instead of sending.
  # See in [https://github.com/ryanb/letter_opener]
  gem 'letter_opener'
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem 'web-console'

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem 'capybara'
  gem 'rspec-rails'
  gem 'rswag-specs'
  gem 'selenium-webdriver'
end
