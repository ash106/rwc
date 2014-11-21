require 'test_helper'

class WantedTest < ActiveSupport::TestCase
  
  test 'has valid test data' do
    wanted = build(:wanted)
    assert_valid wanted
  end

  test 'must have a description' do
    invalid_wanted = Wanted.new  
    assert_invalid invalid_wanted
    assert_includes invalid_wanted.errors[:description], "can't be blank"
  end

end
