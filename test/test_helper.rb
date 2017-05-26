ENV['RAILS_ENV'] ||= 'test'
require 'simplecov'
# SimpleCov.start 'rails'
if ENV['COVERAGE'] == 'true'
  SimpleCov.start 'rails'
  puts "TEST COVERAGE REPORT GENERATING . . ."
end
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end
