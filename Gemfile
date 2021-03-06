source 'https://rubygems.org'

ruby '2.3.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '5.0.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
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

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  # Use sqlite3 only in development and test environments
  gem 'sqlite3'
  # Rspec-rails for Rspec testing
  gem 'rspec-rails', '~> 3.4'
  # FactoryGirl Rails for factories functionality
  gem "factory_girl_rails", "~> 4.0"
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  # Guard for automated testing
  gem 'guard'
  # Guard-spec for rspec automated testing
  gem 'guard-rspec', require: false
  # Spork to speed up automated testing
  #gem 'spork-rails' # not compatible with Rails 5.0.0
  # Guard-Spork plug-in so they work together
  gem 'guard-spork'
end

# Needed for Heroku production environment
group :production do
  gem 'rails_12factor'
  gem 'pg'
end

# Rubocop Ruby code analyzer
gem 'rubocop', require: false

# Turbolinks jQuery gem
gem 'jquery-turbolinks', '~> 2.1'

# Bootstrap for Rails gem
gem 'twitter-bootstrap-rails', '~> 3.2', '>= 3.2.2'

# Devise - for Rails authentication
gem 'devise'

# CanCanCan - for Rails authorization
gem 'cancancan'

# Clean up databases
gem 'activerecord-reset-pk-sequence'

# Will_paginate for comments pagination
gem 'will_paginate', '~> 3.1.0'

# Stripe payment system
gem 'stripe'

# Brakeman security tool
gem 'brakeman', require: false

# Puma web server
gem 'puma'

# elevateZoom jQuery plugin for Rails
gem 'elevatezoom-rails'

# For managing sensitve info
gem 'figaro'

# AngularJS for Rails
# gem 'angularjs-rails'

# For Memcachier plugin on Heroku
gem 'dalli'

# Redis caching
gem 'redis-rails'

# New Relic system performance monitoring tool
gem 'newrelic_rpm'
