source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.4'
# Use sqlite3 as the database for Active Record
gem 'sqlite3'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'

gem 'haml-rails', "~> 0.9"
gem 'bootstrap-sass', '~> 3.3.5'
gem 'devise'
gem 'devise_token_auth'
gem 'omniauth',  '>= 1.0.0'
gem 'omniauth-github'
gem 'omniauth-facebook'
gem 'cancancan', '~> 1.10'
gem 'paperclip', '~> 4.3'

# gem 'angular-rails-templates', '0.1.2'
# gem 'htmlcompressor'
gem 'bower-rails'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  gem "rspec-rails", "~> 3.0"
  gem 'spork', github: 'sporkrb/spork'
  gem 'spork-rails'
  gem 'teaspoon-jasmine'
  gem 'phantomjs'
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'database_cleaner'
  gem 'json_spec', '~> 1.1.4'
  gem 'shoulda-matchers', require: false
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

# heroku
group :production do
  gem 'pg'
  gem 'rails_12factor' ,'0.0.2'
end
