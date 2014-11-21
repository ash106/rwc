require 'test_helper'

class WaterRightsManagementControllerTest < ActionController::TestCase
  
  test "get dashboard is successful" do
    user = create(:admin)
    sign_in user
    water_right = create(:water_right)
    get :dashboard
    assert_includes assigns(:water_rights), water_right
    assert_includes assigns(:place_of_use_areas), water_right.place_of_use_areas.first
    assert_includes assigns(:point_of_diversions), water_right.point_of_diversions.first
    assert_response :success
    user.destroy
  end

  test "get show_water_rights is successful for non-signed in user" do
    get :show_water_rights
    assert_equal 0, assigns(:user_id)
    assert_response :success
  end

  test "get show_water_rights is successful for signed in user" do
    user = create(:user)
    sign_in user
    get :show_water_rights
    assert_equal user.id, assigns(:user_id)
    assert_response :success
    user.destroy
  end

end
