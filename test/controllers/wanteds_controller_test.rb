require 'test_helper'

class WantedsControllerTest < ActionController::TestCase
  setup do
    @user = create(:admin)
    sign_in @user
  end

  teardown do
    @user.destroy
  end

  test "get index is successful" do
    wanted = create(:wanted)
    get :index
    assert_includes assigns(:wanteds), wanted
    assert_response :success
  end

  test 'get show is successful' do
    wanted = create(:wanted)
    get :show, params: { id: wanted.id }
    assert_equal wanted, assigns(:wanted)
    assert_response :success
  end

  test "get new is successful" do
    get :new
    assert_kind_of Wanted, assigns(:wanted)
    assert_response :success
  end

  test 'get edit is successful' do
    wanted = create(:wanted)
    get :edit, params: { id: wanted.id }
    assert_equal wanted, assigns(:wanted)
    assert_response :success
  end

  test 'post create is successful with valid attributes' do
    listing_area = create(:listing_area)
    wanted_params = { volume: 20, source: 'Surface', description: 'Need 5 to 20 acre feet of Strawberry Water.', contact_info: 'tester@example.com', listing_area_id: listing_area.id }
    assert_difference 'Wanted.count' do
      post :create, params: { wanted: wanted_params }
    end
    assert_redirected_to wanted_path(Wanted.last)
  end

  test 'post create is unsuccessful with invalid attributes' do
    invalid_params = { description: '' }
    assert_no_difference 'Wanted.count' do
      post :create, params: { wanted: invalid_params }
    end
    assert_template 'new'
    assert_response :success
  end

  test 'put update is successful with valid attributes' do
    wanted = create(:wanted)
    valid_attributes = { description: 'Need 10 to 20 acre feet of waters.' }
    put :update, params: { id: wanted.id, wanted: valid_attributes }
    assert_equal valid_attributes[:description], wanted.reload.description
    assert_redirected_to wanted_path(wanted)
  end

  test 'put update is unsuccessful with invalid attributes' do
    wanted = create(:wanted)
    invalid_attributes = { description: '' }
    put :update, params: { id: wanted.id, wanted: invalid_attributes }
    refute_equal invalid_attributes[:description], wanted.reload.description
    assert_template 'edit'
    assert_response :success
  end

  test 'delete destroy is successful' do
    wanted = create(:wanted)
    assert_difference 'Wanted.count', -1 do
      delete :destroy, params: { id: wanted.id }
    end
    assert_redirected_to listings_dashboard_path
  end
end
