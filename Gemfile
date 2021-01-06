source 'https://rubygems.org'

gem "rack", ">= 2.1.4"

gem "activesupport", "6.0.3.3"

gem "json", ">= 2.3.0"

gem 'react_on_rails', '~> 12.0', '>= 12.0.4'
gem 'webpacker', '~> 5.2', '>= 5.2.1'
gem "actionview", "6.0.3.3"
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', "6.0.3.3"
# Use sqlite3 as the database for Active Record
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 5.0.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
gem 'railties', '6.0.3.3'
# Use jquery as the JavaScript library
gem 'jquery-rails'
gem 'io-console', '~> 0.5'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 2.0.3', group: :doc

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'sqlite3', '~> 1.4'
  gem 'byebug'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'


  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :production do
  # for Heroku production deployment
  # NOTE RAILS PRIOR TO 5.15 do not support the pg 1.0.0 module!
  # NOTE: You may need to research proper gem version compatibility for your environment.
  gem 'pg', '~> 0.21'
  gem 'rails_12factor'
end