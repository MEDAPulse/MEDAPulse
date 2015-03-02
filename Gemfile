source 'https://rubygems.org'

ruby '2.1.3'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.1'
gem 'pg'

# User authentication
gem 'devise' 

# Background worker of choice
gem 'sidekiq', '3.2.5'
gem 'whenever', :require => false

# Debugging
gem 'pry'
gem 'pry-nav'

# if you require 'sinatra' you get the DSL extended to Object
gem 'sinatra', '>= 1.3.0', :require => nil


# Use SCSS for stylesheets
gem 'bootstrap-sass', '~> 3.3.0' # ...with Bootstrap!
gem 'autoprefixer-rails'         # ...goes with Bootstrap.
gem 'sass-rails', '>= 5.0.0.beta1'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby
gem 'sprockets-rails', :require => 'sprockets/railtie'
gem "non-stupid-digest-assets"
# Use jquery as the JavaScript library
gem 'jquery-rails'

group :development, :test do
  gem 'dotenv-rails'
  gem 'faker'
  gem 'guard-cucumber'
end

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'spring'
  gem 'rails-erd'
end

group :test do
  gem 'cucumber-rails', :require => false
  gem 'rspec-rails', '~> 3.0'
  gem 'database_cleaner'
  gem 'factory_girl'
  gem 'selenium-webdriver'
end

gem 'twilio-ruby'

gem 'newrelic_rpm'

gem 'font-awesome-rails'

gem 'pundit'

# For Angular asset package management
gem 'bower-rails'

