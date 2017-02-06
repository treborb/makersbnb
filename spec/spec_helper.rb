require 'coveralls'
require 'simplecov'

# START coveralls
# SimpleCov.formatters = [
#   SimpleCov::Formatter::HTMLFormatter,
#   Coveralls::SimpleCov::Formatter
# ]
# Coveralls.wear!
# END coveralls

# START simplecov
require 'simplecov'
SimpleCov.start
# END simplecov

ENV['RACK_ENV'] = 'test'

require File.join(File.dirname(__FILE__), '..', 'app/app.rb')

require 'capybara'
require 'capybara/rspec'
require 'capybara/poltergeist'
require 'rspec'
# require './app/data_mapper_setup'
require 'database_cleaner'

# require_relative 'support/database_cleaner'
# require_relative ‘helpers/add_helper_files_here'

include DatabaseCleaner

Capybara.app = Makersbnb
Capybara.default_driver = :poltergeist

RSpec.configure do |config|
  config.include Capybara::DSL
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  # config.before(:suite) do
  #   DatabaseCleaner.strategy = :truncation
  #   DatabaseCleaner.clean_with(:truncation)
  # end
  
  # config.before(:each) do
  #   DatabaseCleaner.start
  # end
  
  # config.append_after(:each) do
  #   DatabaseCleaner.clean
  # end
end