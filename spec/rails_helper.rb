# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'
require 'shoulda-matchers'
require 'database_cleaner'
require 'capybara/rspec'

require "bundler/setup"
Bundler.require(:default, :test)

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    # Choose a test framework:
    with.test_framework :rspec
    #with.test_framework :minitest
    #with.test_framework :minitest_4
    #with.test_framework :test_unit

    # Choose one or more libraries:
    # with.library :active_record
    # with.library :active_model
    #with.library :action_controller
    # Or, choose the following (which implies all of the above):
    with.library :rails
  end
end

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
	config.include FactoryGirl::Syntax::Methods
	# config.include Devise::TestHelpers, type: :controller
	config.order = "random"

	config.include Capybara::DSL
	config.include Rails.application.routes.url_helpers

	config.before(:suite) do
		DatabaseCleaner.strategy = :transaction
		DatabaseCleaner.clean_with(:truncation)
	end 

	config.before(:each) do
		DatabaseCleaner.start
	end

	config.after(:each) do
		DatabaseCleaner.clean
	end
end