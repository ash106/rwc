require 'test_helper'

class PointOfDiversionsControllerTest < ActionController::TestCase
  setup do
    @user = create(:admin)
    sign_in @user
  end

  teardown do
    @user.destroy
  end

  test "get index is successful" do
    point_of_diversion = create(:point_of_diversion)
    get :index
    assert_includes assigns(:point_of_diversions), point_of_diversion
    assert_response :success
  end

  test 'get show is successful' do
    point_of_diversion = create(:point_of_diversion)
    get :show, id: point_of_diversion.id
    assert_equal point_of_diversion, assigns(:point_of_diversion)
    assert_response :success
  end

  test "get new is successful" do
    get :new
    assert_kind_of PointOfDiversion, assigns(:point_of_diversion)
    assert_response :success
  end

  test 'get edit is successful' do
    point_of_diversion = create(:point_of_diversion)
    get :edit, id: point_of_diversion.id
    assert_equal point_of_diversion, assigns(:point_of_diversion)
    assert_response :success
  end

  test 'post create is successful with valid attributes' do
    kml_file = ActionDispatch::Http::UploadedFile.new({
      filename: 'Stream.kml',
      content_type: 'application/xml',
      tempfile: File.new("#{Rails.root}/test/fixtures/Stream.kml")
    })
    point_of_diversion_params = { name: 'Stream', kml: kml_file }
    assert_difference 'PointOfDiversion.count' do
      post :create, point_of_diversion: point_of_diversion_params
    end
    assert_redirected_to point_of_diversion_path(PointOfDiversion.last)
  end

  test 'post create is unsuccessful with invalid attributes' do
    invalid_params = { name: '', kml: '' }
    assert_no_difference 'PointOfDiversion.count' do
      post :create, point_of_diversion: invalid_params
    end
    assert_template 'new'
    assert_response :success
  end

  test 'put update is successful with valid attributes' do
    point_of_diversion = create(:point_of_diversion)
    valid_attributes = { name: 'Streeeeem' }
    put :update, id: point_of_diversion.id, point_of_diversion: valid_attributes
    assert_equal valid_attributes[:name], point_of_diversion.reload.name
    assert_redirected_to point_of_diversion_path(point_of_diversion)
  end

  test 'put update is unsuccessful with invalid attributes' do
    point_of_diversion = create(:point_of_diversion)
    invalid_attributes = { name: '' }
    put :update, id: point_of_diversion.id, point_of_diversion: invalid_attributes
    refute_equal invalid_attributes[:name], point_of_diversion.reload.name
    assert_template 'edit'
    assert_response :success
  end

  test 'delete destroy is successful' do
    point_of_diversion = create(:point_of_diversion)
    assert_difference 'PointOfDiversion.count', -1 do
      delete :destroy, id: point_of_diversion.id
    end
    assert_redirected_to wrm_dashboard_path
  end
end
