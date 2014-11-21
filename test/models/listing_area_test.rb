require 'test_helper'

class ListingAreaTest < ActiveSupport::TestCase
  
  test 'has valid test data' do
    listing_area = build(:listing_area)
    assert_valid listing_area
    # ListingArea.find_each do |listing_area|
    #   listing_area.kml = fixture_file_upload 'SLV_Central.kml'
    #   listing_area.save!
    #   assert_valid listing_area
    # end
  end

  test 'must have a name and kml attachment' do
    invalid_listing_area = ListingArea.new  
    assert_invalid invalid_listing_area
    assert_includes invalid_listing_area.errors[:name], "can't be blank"
    assert_includes invalid_listing_area.errors[:kml], "can't be blank"
  end

  test 'must have a unique name' do
    listing_area = create(:listing_area)
    copy_cat = ListingArea.new(name: listing_area.name)
    assert_invalid copy_cat, name: 'has already been taken'
  end

  test 'parse_kml creates polygon json attribute' do
    # listing_area = listing_areas(:slv_central)
    # listing_area.kml = fixture_file_upload 'SLV_Central.kml'
    # listing_area.save!
    # puts listing_area.kml.url
    # ListingArea.parse_kml(listing_area.id)
    listing_area = create(:listing_area)
    listing_area.reload # ListingArea.find(listing_area.id)
    assert_equal "Polygon", listing_area.polygon["type"]
    assert_equal [-111.923637152839,40.6885149314539], listing_area.polygon["coordinates"][0][0] # First coordinate in array
    assert_equal [-111.923637152839,40.6885149314539], listing_area.polygon["coordinates"][0][-1] # Last coordinate in array
  end

end

