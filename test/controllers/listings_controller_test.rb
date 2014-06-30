require 'test_helper'

class ListingsControllerTest < ActionController::TestCase
  test "should get dashboard" do
    get :dashboard
    assert_response :success
  end

  test "should get buy_sell" do
    get :buy_sell
    assert_response :success
  end

end
