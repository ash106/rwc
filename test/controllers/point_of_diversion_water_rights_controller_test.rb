require 'test_helper'

class PointOfDiversionWaterRightsControllerTest < ActionController::TestCase
  setup do
    @user = create(:admin)
    sign_in @user
  end

  teardown do
    @user.destroy
  end

  test 'post create is successful with valid attributes' do
    point_of_diversion = create(:point_of_diversion)
    water_right = create(:water_right)
    point_of_diversion_water_right_params = { point_of_diversion_id: point_of_diversion.id, water_right_id: water_right.id }
    assert_difference 'PointOfDiversionWaterRight.count' do
      post :create, params: { point_of_diversion_water_right: point_of_diversion_water_right_params }
    end
    assert_redirected_to water_right_path(water_right)
  end

  test 'post create is unsuccessful with invalid attributes' do
    water_right = create(:water_right)
    invalid_params = { point_of_diversion_id: nil, water_right_id: water_right.id }
    assert_no_difference 'PointOfDiversionWaterRight.count' do
      post :create, params: { point_of_diversion_water_right: invalid_params }
    end
    assert_redirected_to water_right_path(water_right)
  end

  test 'delete destroy is successful' do
    point_of_diversion_water_right = create(:point_of_diversion_water_right)
    assert_difference 'PointOfDiversionWaterRight.count', -1 do
      delete :destroy, params: { point_of_diversion_id: point_of_diversion_water_right.point_of_diversion.id, water_right_id: point_of_diversion_water_right.water_right.id }
    end
    assert_redirected_to water_right_path(point_of_diversion_water_right.water_right)
  end
end
