require 'test_helper'

class PointOfDiversionTest < ActiveSupport::TestCase
  
  test 'has valid test data' do
    point_of_diversion = build(:point_of_diversion)
    assert_valid point_of_diversion
  end

  test 'must have a name and kml attachment' do
    invalid_point_of_diversion = PointOfDiversion.new  
    assert_invalid invalid_point_of_diversion
    assert_includes invalid_point_of_diversion.errors[:name], "can't be blank"
    assert_includes invalid_point_of_diversion.errors[:kml], "can't be blank"
  end

  test 'must have a unique name' do
    point_of_diversion = create(:point_of_diversion)
    copy_cat = PointOfDiversion.new(name: point_of_diversion.name)
    assert_invalid copy_cat, name: 'has already been taken'
  end

  test 'parse_kml creates polygon json attribute' do
    point_of_diversion = create(:point_of_diversion)
    point_of_diversion.reload
    assert_equal "Point", point_of_diversion.point["type"]
    assert_equal [-111.7182951841196,40.16560061443249], point_of_diversion.point["coordinates"] # Points only have one set of coordinates
  end

end
