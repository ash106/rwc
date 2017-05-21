require 'test_helper'

class PlaceOfUseAreaWaterRightsControllerTest < ActionController::TestCase
  setup do
    @user = create(:admin)
    sign_in @user
  end

  teardown do
    @user.destroy
  end

  test 'post create is successful with valid attributes' do
    place_of_use_area = create(:place_of_use_area)
    water_right = create(:water_right)
    place_of_use_area_water_right_params = { place_of_use_area_id: place_of_use_area.id, water_right_id: water_right.id }
    assert_difference 'PlaceOfUseAreaWaterRight.count' do
      post :create, place_of_use_area_water_right: place_of_use_area_water_right_params
    end
    assert_redirected_to water_right_path(water_right)
  end

  test 'post create is unsuccessful with invalid attributes' do
    water_right = create(:water_right)
    invalid_params = { place_of_use_area_id: nil, water_right_id: water_right.id }
    assert_no_difference 'PlaceOfUseAreaWaterRight.count' do
      post :create, place_of_use_area_water_right: invalid_params
    end
    assert_redirected_to water_right_path(water_right)
  end

  test 'delete destroy is successful' do
    place_of_use_area_water_right = create(:place_of_use_area_water_right)
    assert_difference 'PlaceOfUseAreaWaterRight.count', -1 do
      delete :destroy, place_of_use_area_id: place_of_use_area_water_right.place_of_use_area.id, water_right_id: place_of_use_area_water_right.water_right.id
    end
    assert_redirected_to water_right_path(place_of_use_area_water_right.water_right)
  end
end
