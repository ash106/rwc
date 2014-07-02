require 'test_helper'

class WaterRightsControllerTest < ActionController::TestCase
  setup do
    @water_right = water_rights(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:water_rights)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create water_right" do
    assert_difference('WaterRight.count') do
      post :create, water_right: { change_application_number: @water_right.change_application_number, flow_ac_ft: @water_right.flow_ac_ft, flow_cfs: @water_right.flow_cfs, number: @water_right.number, place_of_use: @water_right.place_of_use, proof_due_date: @water_right.proof_due_date, sole_supply_acres: @water_right.sole_supply_acres }
    end

    assert_redirected_to water_right_path(assigns(:water_right))
  end

  test "should show water_right" do
    get :show, id: @water_right
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @water_right
    assert_response :success
  end

  test "should update water_right" do
    patch :update, id: @water_right, water_right: { change_application_number: @water_right.change_application_number, flow_ac_ft: @water_right.flow_ac_ft, flow_cfs: @water_right.flow_cfs, number: @water_right.number, place_of_use: @water_right.place_of_use, proof_due_date: @water_right.proof_due_date, sole_supply_acres: @water_right.sole_supply_acres }
    assert_redirected_to water_right_path(assigns(:water_right))
  end

  test "should destroy water_right" do
    assert_difference('WaterRight.count', -1) do
      delete :destroy, id: @water_right
    end

    assert_redirected_to water_rights_path
  end
end
