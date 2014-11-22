require 'test_helper'

class ListingsControllerTest < ActionController::TestCase

  test "get dashboard is successful" do
    user = create(:admin)
    sign_in user
    listing_area = create(:listing_area)
    wanted = create(:wanted)
    for_sale = create(:for_sale)
    get :dashboard
    assert_includes assigns(:listing_areas), listing_area
    assert_includes assigns(:wanteds), wanted
    assert_includes assigns(:for_sales), for_sale
    assert_response :success
    user.destroy
  end

  test "get buy_sell is successful" do
    get :buy_sell
    assert_response :success
  end

  test "get get_data is successful" do
    listing_area = create(:listing_area)
    wanted = create(:wanted)
    for_sale = create(:for_sale)
    get :get_data
    response = JSON.parse(@response.body)
    assert_equal "FeatureCollection", response["type"] # Make sure "type":"FeatureCollection" key exists
    assert_equal 1, response["features"].length # Make sure "features" key includes only the created listing_area
    assert_response :success
  end
end
