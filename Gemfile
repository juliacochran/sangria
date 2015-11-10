source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.4'

# Use postgres as the database for Active Record
gem 'pg'
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
# Use jquery ui 
gem 'jquery-ui-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

#something for heroku
gem 'rails_12factor', group: :production

# LinkedIn wrapper gem. Read more: https://github.com/hexgnu/linkedin
gem "linkedin-oauth2", "~> 1.0"

# Google gem for sign on
gem "omniauth-google-oauth2"
gem "omniauth", '~> 1.2.2'
gem "devise"
gem 'certified'

#to help with env vars
gem "figaro"

# Facebook gem for sign on
gem 'omniauth-facebook'

#Materialize CSS framework
gem 'materialize-sass'

# For Reminder scheduling
gem 'whenever', :require => false

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use capistrano for production deployment
gem 'capistrano', '~> 3.1.0'
gem 'capistrano-bundler', '~> 1.1.2'
gem 'capistrano-rails', '~> 1.1.1'
gem 'capistrano-figaro-yml', '~> 1.0.2'

# Add this if you're using rbenv
gem 'capistrano-rbenv', github: "capistrano/rbenv"

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  gem "heroku_hatchet"
  gem "rspec-core"
  gem "rspec-expectations"
  gem "excon"
  gem "rake"
  gem "parallel_tests"
  gem 'rspec-retry'
  gem "netrc"
  gem "git"
  gem "better_errors"
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end


ruby '2.2.2'
