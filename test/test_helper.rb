ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'capybara/rails'
require 'mocha/mini_test'
require 'pry'

class ActiveSupport::TestCase

end

class ActionDispatch::IntegrationTest
  include Capybara::DSL
end
