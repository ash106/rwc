require 'test_helper'

class WaterRightsManagementControllerTest < ActionController::TestCase
  
  test "get dashboard redirects for non-admin user" do
    user = create(:user)
    sign_in user
    get :dashboard
    assert_response :redirect
  end

  test "get dashboard is successful" do
    user = create(:admin)
    sign_in user
    water_right = create(:water_right)
    get :dashboard
    assert_includes assigns(:water_rights), water_right
    assert_includes assigns(:place_of_use_areas), water_right.place_of_use_areas.first
    assert_includes assigns(:point_of_diversions), water_right.point_of_diversions.first
    assert_response :success
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
  end

  test "get get_data is successful for admin" do
    user = create(:admin)
    sign_in user
    water_right = create(:water_right)
    another_water_right = create(:water_right, number: "13-777")
    get :get_data, id: user.id
    response = JSON.parse(@response.body)
    assert_equal "FeatureCollection", response["type"] # Make sure "type":"FeatureCollection" key exists
    assert_equal 4, response["features"].length # Make sure "features" key includes geometry for all water rights when user is admin
    assert_response :success
  end

  test "get get_data is successful for signed in user" do
    user = create(:user)
    sign_in user
    associated_water_right = create(:water_right)
    user.water_rights << associated_water_right
    nonassociated_water_right = create(:water_right, number: "13-7777")
    get :get_data, id: user.id
    response = JSON.parse(@response.body)
    assert_equal "FeatureCollection", response["type"] # Make sure "type":"FeatureCollection" key exists
    assert_equal 2, response["features"].length # Make sure "features" key includes geometry for associated_water_right only
    assert_equal 1, response["features"][0]["properties"]["water_rights"].length # water_rights should only contain associated_water_right
    assert_equal "13-1138", response["features"][0]["properties"]["water_rights"][0]["number"] # Make sure associated_water_right number is correct
    assert_response :success
  end

  test "get get_data is successful for non-signed in user" do
    # Create demo user with demo email to associate with water rights but don't sign in
    user = create(:user, email: 'tester@example.com')
    associated_water_right = create(:water_right)
    user.water_rights << associated_water_right
    nonassociated_water_right = create(:water_right, number: "13-777")
    get :get_data, id: 0 # 0 is the user_id used when no user is signed in
    response = JSON.parse(@response.body)
    assert_equal "FeatureCollection", response["type"] # Make sure "type":"FeatureCollection" key exists
    assert_equal 2, response["features"].length # Make sure "features" key includes geometry for demo water right only
    assert_equal 1, response["features"][0]["properties"]["water_rights"].length # Make sure water_rights only includes associated_water_right
    assert_equal "13-1138", response["features"][0]["properties"]["water_rights"][0]["number"] # Make sure associated_water_right number is correct
    assert_response :success
  end

end
