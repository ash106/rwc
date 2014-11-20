require 'test_helper'

class ListingAreasControllerTest < ActionController::TestCase
  setup do
    @user = create(:admin)
    sign_in @user
    # @listing_area = listing_areas(:one)
  end

  teardown do
    @user.destroy
  end

  test "get index is successful" do
    listing_area = create(:listing_area)
    get :index
    assert_includes assigns(:listing_areas), listing_area
    assert_response :success
    listing_area.destroy
    # assert_not_nil assigns(:listing_areas)
  end

  test 'get show is successful' do
    listing_area = create(:listing_area)
    get :show, id: listing_area.id
    assert_equal listing_area, assigns(:listing_area)
    assert_response :success
    listing_area.destroy
  end

  test "get new is successful" do
    get :new
    assert_kind_of ListingArea, assigns(:listing_area)
    assert_response :success
  end

  test 'get edit is successful' do
    listing_area = create(:listing_area)
    get :edit, id: listing_area.id
    assert_equal listing_area, assigns(:listing_area)
    assert_response :success
    listing_area.destroy
  end

  test 'post create is successful with valid attributes' do
    kml_file = ActionDispatch::Http::UploadedFile.new({
      filename: 'SLV_Central.kml',
      content_type: 'application/xml',
      tempfile: File.new("#{Rails.root}/test/fixtures/SLV_Central.kml")
    })
    listing_area_params = { name: 'SLV Central', kml: kml_file }
    assert_difference 'ListingArea.count' do
      post :create, listing_area: listing_area_params
    end
    assert_redirected_to listing_area_path(ListingArea.last)
  end

  test 'post create is unsuccessful with invalid attributes' do
    invalid_params = { name: '', kml: '' }
    assert_no_difference 'ListingArea.count' do
      post :create, listing_area: invalid_params
    end
    assert_template 'new'
    assert_response :success
  end

  test 'put update is successful with valid attributes' do
    listing_area = create(:listing_area)
    valid_attributes = { name: 'Salt Lake Valley Central' }
    put :update, id: listing_area.id, listing_area: valid_attributes
    assert_equal valid_attributes[:name], listing_area.reload.name
    assert_redirected_to listing_area_path(listing_area)
    listing_area.destroy
  end

  test 'put update is unsuccessful with invalid attributes' do
    listing_area = create(:listing_area)
    invalid_attributes = { name: '' }
    put :update, id: listing_area.id, listing_area: invalid_attributes
    refute_equal invalid_attributes[:name], listing_area.reload.name
    assert_template 'edit'
    assert_response :success
  end

  test 'delete destroy is successful' do
    listing_area = create(:listing_area)
    assert_difference 'ListingArea.count', -1 do
      delete :destroy, id: listing_area.id
    end
    assert_redirected_to listing_areas_path
  end

#   test "should create listing_area" do
#     assert_difference('ListingArea.count') do
#       post :create, listing_area: { name: @listing_area.name, policy: @listing_area.policy }
#     end

#     assert_redirected_to listing_area_path(assigns(:listing_area))
#   end

#   test "should show listing_area" do
#     get :show, id: @listing_area
#     assert_response :success
#   end

#   test "should get edit" do
#     get :edit, id: @listing_area
#     assert_response :success
#   end

#   test "should update listing_area" do
#     patch :update, id: @listing_area, listing_area: { name: @listing_area.name, policy: @listing_area.policy }
#     assert_redirected_to listing_area_path(assigns(:listing_area))
#   end

#   test "should destroy listing_area" do
#     assert_difference('ListingArea.count', -1) do
#       delete :destroy, id: @listing_area
#     end

#     assert_redirected_to listing_areas_path
#   end
end
