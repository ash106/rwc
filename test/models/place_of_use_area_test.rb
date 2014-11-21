require 'test_helper'

class PlaceOfUseAreaTest < ActiveSupport::TestCase
  
  test 'has valid test data' do
    place_of_use_area = build(:place_of_use_area)
    assert_valid place_of_use_area
  end

  test 'must have a name and kml attachment' do
    invalid_place_of_use_area = PlaceOfUseArea.new  
    assert_invalid invalid_place_of_use_area
    assert_includes invalid_place_of_use_area.errors[:name], "can't be blank"
    assert_includes invalid_place_of_use_area.errors[:kml], "can't be blank"
  end

  test 'must have a unique name' do
    place_of_use_area = create(:place_of_use_area)
    copy_cat = PlaceOfUseArea.new(name: place_of_use_area.name)
    assert_invalid copy_cat, name: 'has already been taken'
  end

  test 'parse_kml creates polygon json attribute' do
    place_of_use_area = create(:place_of_use_area)
    place_of_use_area.reload
    assert_equal "Polygon", place_of_use_area.polygon["type"]
    assert_equal [-111.7355055947721,40.17300160313579], place_of_use_area.polygon["coordinates"][0][0] # First coordinate in array
    assert_equal [-111.7355055947721,40.17300160313579], place_of_use_area.polygon["coordinates"][0][-1] # Last coordinate in array
  end

end
