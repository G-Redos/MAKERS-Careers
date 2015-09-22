# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
files = File.join(File.dirname(__FILE__), 'support', '**', '*.rb')
Dir[File.expand_path(files)].each { |f| require f}

# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'
require 'capybara/rails'
# Add additional requires below this line. Rails is not loaded until this point!
require 'capybara/rspec'
require 'webmock/rspec'
require 'capybara/poltergeist'

Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(app, js_errors: true)
end

Capybara.javascript_driver = :poltergeist

WebMock.disable_net_connect!(allow_localhost: true)

OmniAuth.config.test_mode = true

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.include Warden::Test::Helpers
  config.include OmniauthHelper
  config.include LoginHelpers
  config.include ActionView::Helpers::TranslationHelper

  config.before :suite do
    Warden.test_mode!
  end

  config.use_transactional_fixtures = false

  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do |example|
    DatabaseCleaner.strategy = example.metadata[:js] ? :truncation : :transaction
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

  config.infer_spec_type_from_file_location!
end
