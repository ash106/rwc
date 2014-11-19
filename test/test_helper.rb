ENV["RAILS_ENV"] ||= "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  ActiveRecord::Migration.check_pending!

  ActiveRecord::Migration.maintain_test_schema! if defined?(ActiveRecord::Migration)

  include ActionDispatch::TestProcess

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  def after_teardown
    FileUtils.rm_rf(Dir["#{Rails.root}/test/test_uploads"])
  end

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