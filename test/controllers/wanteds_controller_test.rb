# require 'test_helper'

# class WantedsControllerTest < ActionController::TestCase
#   setup do
#     @wanted = wanteds(:one)
#   end

#   test "should get index" do
#     get :index
#     assert_response :success
#     assert_not_nil assigns(:wanteds)
#   end

#   test "should get new" do
#     get :new
#     assert_response :success
#   end

#   test "should create wanted" do
#     assert_difference('Wanted.count') do
#       post :create, wanted: { contact_info: @wanted.contact_info, description: @wanted.description, listing_area_id: @wanted.listing_area_id, source: @wanted.source, volume: @wanted.volume }
#     end

#     assert_redirected_to wanted_path(assigns(:wanted))
#   end

#   test "should show wanted" do
#     get :show, id: @wanted
#     assert_response :success
#   end

#   test "should get edit" do
#     get :edit, id: @wanted
#     assert_response :success
#   end

#   test "should update wanted" do
#     patch :update, id: @wanted, wanted: { contact_info: @wanted.contact_info, description: @wanted.description, listing_area_id: @wanted.listing_area_id, source: @wanted.source, volume: @wanted.volume }
#     assert_redirected_to wanted_path(assigns(:wanted))
#   end

#   test "should destroy wanted" do
#     assert_difference('Wanted.count', -1) do
#       delete :destroy, id: @wanted
#     end

#     assert_redirected_to wanteds_path
#   end
# end
