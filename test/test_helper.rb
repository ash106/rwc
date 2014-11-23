require 'simplecov'
require 'codeclimate-test-reporter'
require 'coveralls'
 
formatters = [SimpleCov::Formatter::HTMLFormatter]
 
formatters << Coveralls::SimpleCov::Formatter if ENV['COVERALLS_REPO_TOKEN']
formatters << CodeClimate::TestReporter::Formatter if ENV['CODECLIMATE_REPO_TOKEN']
 
SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[*formatters]
 
SimpleCov.start 'rails'

# require "codeclimate-test-reporter"
# CodeClimate::TestReporter.start

# require 'coveralls'
# Coveralls.wear!('rails')

ENV["RAILS_ENV"] ||= "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  ActiveRecord::Migration.check_pending!

  ActiveRecord::Migration.maintain_test_schema! if defined?(ActiveRecord::Migration)

  include ActionDispatch::TestProcess

  include FactoryGirl::Syntax::Methods

  # self.use_transactional_fixtures = true

  Delayed::Worker.delay_jobs = false

  def setup
    DatabaseCleaner.start
  end

  def teardown
    DatabaseCleaner.clean
  end

  WebMock.disable_net_connect!(:allow => "codeclimate.com")

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  # fixtures :all

  # def after_teardown
  #   FileUtils.rm_rf(Dir["#{Rails.root}/test/test_uploads"])
  # end

  # Add more helper methods to be used by all tests here...
  def assert_valid(record, message = nil)
      message ||= "Expected #{record.inspect} to be valid"
      assert record.valid?, message
  end
  
  def assert_invalid(record, options = {})
    assert record.invalid?, "Expected #{record.inspect} to be invalid"
    options.each do |attribute, message|
      assert_includes record.errors[attribute], message
    end
  end
end

class ActionController::TestCase
  include Devise::TestHelpers
end

FactoryGirl::SyntaxRunner.class_eval do
  include ActionDispatch::TestProcess
end