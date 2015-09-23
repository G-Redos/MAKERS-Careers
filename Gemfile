source 'https://rubygems.org'

ruby "2.2.2"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.4'

gem 'pg'

gem 'sass-rails', '~> 5.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

gem "haml-rails", "~> 0.9"

gem 'foundation-rails'

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'


gem 'devise', '~> 3.4.0'
gem 'omniauth-github'
gem 'rails_admin'
gem 'octokit'

# This cleans up the log files so there's no GET xxx.js all over the place
gem 'quiet_assets'

gem 'airbrake'

gem 'rails_12factor'

gem 'dotenv'

group :development, :test do
  gem 'pry'

  gem 'rack-livereload'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-commands-rspec'

  gem 'dotenv-rails'
  gem 'awesome_print'
  gem 'gist'
  gem 'ffaker'
  gem 'thin'
end

group :test do
  gem 'rspec-rails', '~> 3.0'
  gem 'capybara'
  gem 'webmock'
  gem 'poltergeist'
  gem 'shoulda-matchers'
  gem 'factory_girl_rails'
  gem 'launchy'
  gem 'database_cleaner'
end

group :production do
  gem 'puma'
end
