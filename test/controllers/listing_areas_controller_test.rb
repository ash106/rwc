require 'test_helper'

class ListingAreasControllerTest < ActionController::TestCase
  setup do
    @listing_area = listing_areas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:listing_areas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create listing_area" do
    assert_difference('ListingArea.count') do
      post :create, listing_area: { name: @listing_area.name, policy: @listing_area.policy }
    end

    assert_redirected_to listing_area_path(assigns(:listing_area))
  end

  test "should show listing_area" do
    get :show, id: @listing_area
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @listing_area
    assert_response :success
  end

  test "should update listing_area" do
    patch :update, id: @listing_area, listing_area: { name: @listing_area.name, policy: @listing_area.policy }
    assert_redirected_to listing_area_path(assigns(:listing_area))
  end

  test "should destroy listing_area" do
    assert_difference('ListingArea.count', -1) do
      delete :destroy, id: @listing_area
    end

    assert_redirected_to listing_areas_path
  end
end
