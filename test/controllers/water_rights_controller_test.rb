require 'test_helper'

class WaterRightsControllerTest < ActionController::TestCase
  setup do
    @user = create(:admin)
    sign_in @user
  end

  teardown do
    @user.destroy
  end

  test "get index is successful" do
    water_right = create(:water_right)
    get :index
    assert_includes assigns(:water_rights), water_right
    assert_response :success
  end

  test 'get show is successful' do
    water_right = create(:water_right)
    get :show, id: water_right.id
    assert_equal water_right, assigns(:water_right)
    # Test @unassociated_place_of_use_areas and @unassociated_point_of_diversions
    assert assigns(:unassociated_place_of_use_areas).exclude? water_right.place_of_use_areas.first
    assert assigns(:unassociated_point_of_diversions).exclude? water_right.point_of_diversions.first
    assert_response :success
  end

  test "get new is successful" do
    get :new
    assert_kind_of WaterRight, assigns(:water_right)
    assert_response :success
  end

  test 'get edit is successful' do
    water_right = create(:water_right)
    get :edit, id: water_right.id
    assert_equal water_right, assigns(:water_right)
    assert_response :success
  end

  test 'post create is successful with valid attributes' do
    water_right_params = { number: '13-1138', flow_cfs: 10, flow_ac_ft: 1920, sole_supply_acres: 640, place_of_use: 'Most Farm', change_application_number: 'a28259', proof_due_date: "2015-05-31", priority_date: "1972-07-17", user_id: @user.id }
    assert_difference 'WaterRight.count' do
      post :create, water_right: water_right_params
    end
    assert_redirected_to water_right_path(WaterRight.last)
  end

  test 'post create is unsuccessful with invalid attributes' do
    invalid_params = { number: '' }
    assert_no_difference 'WaterRight.count' do
      post :create, water_right: invalid_params
    end
    assert_template 'new'
    assert_response :success
  end

  test 'put update is successful with valid attributes' do
    water_right = create(:water_right)
    valid_attributes = { number: '7777' }
    put :update, id: water_right.id, water_right: valid_attributes
    assert_equal valid_attributes[:number], water_right.reload.number
    assert_redirected_to water_right_path(water_right)
  end

  test 'put update is unsuccessful with invalid attributes' do
    water_right = create(:water_right)
    invalid_attributes = { number: '' }
    put :update, id: water_right.id, water_right: invalid_attributes
    refute_equal invalid_attributes[:number], water_right.reload.number
    assert_template 'edit'
    assert_response :success
  end

  test 'delete destroy is successful' do
    water_right = create(:water_right)
    assert_difference 'WaterRight.count', -1 do
      delete :destroy, id: water_right.id
    end
    assert_redirected_to water_rights_path
  end
end
