require 'test_helper'

class ForSalesControllerTest < ActionController::TestCase
  setup do
    @for_sale = for_sales(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:for_sales)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create for_sale" do
    assert_difference('ForSale.count') do
      post :create, for_sale: { contact_info: @for_sale.contact_info, description: @for_sale.description, listing_area_id: @for_sale.listing_area_id, price: @for_sale.price, source: @for_sale.source, volume: @for_sale.volume }
    end

    assert_redirected_to for_sale_path(assigns(:for_sale))
  end

  test "should show for_sale" do
    get :show, id: @for_sale
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @for_sale
    assert_response :success
  end

  test "should update for_sale" do
    patch :update, id: @for_sale, for_sale: { contact_info: @for_sale.contact_info, description: @for_sale.description, listing_area_id: @for_sale.listing_area_id, price: @for_sale.price, source: @for_sale.source, volume: @for_sale.volume }
    assert_redirected_to for_sale_path(assigns(:for_sale))
  end

  test "should destroy for_sale" do
    assert_difference('ForSale.count', -1) do
      delete :destroy, id: @for_sale
    end

    assert_redirected_to for_sales_path
  end
end
