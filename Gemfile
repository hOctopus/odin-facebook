source 'http://rubygems.org'
ruby '2.1.7'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.4'
# Use postgresql as the database for Active Record
gem 'pg'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Bootstrap front-end framework
gem 'bootstrap-sass'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# Set environment variables
gem 'figaro'
# Flexible authentication system for Rails across the entire stack
gem 'devise'
# Library that standardizes multi-provider authentication for web applications
gem 'omniauth-facebook'
# Open emails in browser
gem 'letter_opener'
# Allow pagination
gem 'will_paginate'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc


# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Send logs to stdout and deliver assets directly for twelve-factor apps
gem 'rails_12factor', group: :production

# Thread-safe ruby library which can be used to monitor directories for changes on Windows.
gem 'wdm', '>= 0.1.0' if Gem.win_platform?

# Access an IRB console on exception pages or by using <%= console %> in views
gem 'web-console', '~> 2.0', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  # Speed up development with the Spring app preloader for Rails
  gem 'spring'
end

group :test do
  # Make tests colorful with MiniTest Reporters!
  gem 'minitest-reporters', '1.0.5'
  # Take advantage of the Rails.backtrace_cleaner when using MiniTest
  gem 'mini_backtrace',     '0.1.3'
  # Automatic, intelligent tests using the MiniTest framework
  gem 'guard-minitest',     '2.3.1'
end


# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
