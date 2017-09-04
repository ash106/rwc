require 'test_helper'

class PlaceOfUseAreasControllerTest < ActionController::TestCase
  setup do
    @user = create(:admin)
    sign_in @user
    # @listing_area = listing_areas(:one)
  end

  teardown do
    @user.destroy
  end

  test "get index is successful" do
    place_of_use_area = create(:place_of_use_area)
    get :index
    assert_includes assigns(:place_of_use_areas), place_of_use_area
    assert_response :success
  end

  test 'get show is successful' do
    place_of_use_area = create(:place_of_use_area)
    get :show, params: { id: place_of_use_area.id }
    assert_equal place_of_use_area, assigns(:place_of_use_area)
    assert_response :success
  end

  test "get new is successful" do
    get :new
    assert_kind_of PlaceOfUseArea, assigns(:place_of_use_area)
    assert_response :success
  end

  test 'get edit is successful' do
    place_of_use_area = create(:place_of_use_area)
    get :edit, params: { id: place_of_use_area.id }
    assert_equal place_of_use_area, assigns(:place_of_use_area)
    assert_response :success
  end

  test 'post create is successful with valid attributes' do
    kml_file = Rack::Test::UploadedFile.new(
      "#{Rails.root}/test/fixtures/Area_1.kml",
      "application/xml"
    )
    place_of_use_area_params = { name: 'Area One', kml: kml_file }
    assert_difference 'PlaceOfUseArea.count' do
      post :create, params: { place_of_use_area: place_of_use_area_params }
    end
    assert_redirected_to place_of_use_area_path(PlaceOfUseArea.last)
  end

  test 'post create is unsuccessful with invalid attributes' do
    invalid_params = { name: '', kml: '' }
    assert_no_difference 'PlaceOfUseArea.count' do
      post :create, params: { place_of_use_area: invalid_params }
    end
    assert_template 'new'
    assert_response :success
  end

  test 'put update is successful with valid attributes' do
    place_of_use_area = create(:place_of_use_area)
    valid_attributes = { name: 'Area Uno' }
    put :update, params: { id: place_of_use_area.id, place_of_use_area: valid_attributes }
    assert_equal valid_attributes[:name], place_of_use_area.reload.name
    assert_redirected_to place_of_use_area_path(place_of_use_area)
  end

  test 'put update is unsuccessful with invalid attributes' do
    place_of_use_area = create(:place_of_use_area)
    invalid_attributes = { name: '' }
    put :update, params: { id: place_of_use_area.id, place_of_use_area: invalid_attributes }
    refute_equal invalid_attributes[:name], place_of_use_area.reload.name
    assert_template 'edit'
    assert_response :success
  end

  test 'delete destroy is successful' do
    place_of_use_area = create(:place_of_use_area)
    assert_difference 'PlaceOfUseArea.count', -1 do
      delete :destroy, params: { id: place_of_use_area.id }
    end
    assert_redirected_to wrm_dashboard_path
  end
end
