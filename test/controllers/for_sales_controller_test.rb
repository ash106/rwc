require 'test_helper'

class ForSalesControllerTest < ActionController::TestCase
  setup do
    @user = create(:admin)
    sign_in @user
  end

  teardown do
    @user.destroy
  end

  test "get index is successful" do
    for_sale = create(:for_sale)
    get :index
    assert_includes assigns(:for_sales), for_sale
    assert_response :success
  end

  test 'get show is successful' do
    for_sale = create(:for_sale)
    get :show, id: for_sale.id
    assert_equal for_sale, assigns(:for_sale)
    assert_response :success
  end

  test "get new is successful" do
    get :new
    assert_kind_of ForSale, assigns(:for_sale)
    assert_response :success
  end

  test 'get edit is successful' do
    for_sale = create(:for_sale)
    get :edit, id: for_sale.id
    assert_equal for_sale, assigns(:for_sale)
    assert_response :success
  end

  test 'post create is successful with valid attributes' do
    listing_area = create(:listing_area)
    for_sale_params = { volume: 100, source: 'Well', description: 'This can be moved throughout most of this area', price: 4000, contact_info: 'tester@example.com', listing_area_id: listing_area.id }
    assert_difference 'ForSale.count' do
      post :create, for_sale: for_sale_params
    end
    assert_redirected_to for_sale_path(ForSale.last)
  end

  test 'post create is unsuccessful with invalid attributes' do
    invalid_params = { description: '', price: nil }
    assert_no_difference 'ForSale.count' do
      post :create, for_sale: invalid_params
    end
    assert_template 'new'
    assert_response :success
  end

  test 'put update is successful with valid attributes' do
    for_sale = create(:for_sale)
    valid_attributes = { description: 'This is a test description OK?!', price: 399 }
    put :update, id: for_sale.id, for_sale: valid_attributes
    assert_equal valid_attributes[:description], for_sale.reload.description
    assert_equal valid_attributes[:price], for_sale.reload.price
    assert_redirected_to for_sale_path(for_sale)
  end

  test 'put update is unsuccessful with invalid attributes' do
    for_sale = create(:for_sale)
    invalid_attributes = { description: '', price: nil }
    put :update, id: for_sale.id, for_sale: invalid_attributes
    refute_equal invalid_attributes[:description], for_sale.reload.description
    refute_equal invalid_attributes[:price], for_sale.reload.price
    assert_template 'edit'
    assert_response :success
  end

  test 'delete destroy is successful' do
    for_sale = create(:for_sale)
    assert_difference 'ForSale.count', -1 do
      delete :destroy, id: for_sale.id
    end
    assert_redirected_to for_sales_path
  end
end
