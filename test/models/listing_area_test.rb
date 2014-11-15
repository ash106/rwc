require 'test_helper'

class ListingAreaTest < ActiveSupport::TestCase

  test 'has valid test data' do
    puts PlaceOfUseArea.count
    listing_area = create(:listing_area)
    assert_valid listing_area
  end

  test 'must have a name and kml attachment' do
    invalid_listing_area = ListingArea.new  
    assert_invalid invalid_listing_area
    assert_includes invalid_listing_area.errors[:name], "can't be blank"
    assert_includes invalid_listing_area.errors[:kml], "can't be blank"
  end

  test 'must have a unique name' do
    copy_cat = ListingArea.new(name: create(:listing_area).name)
    assert_invalid copy_cat, name: 'has already been taken'
  end

end
