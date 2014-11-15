# require 'test_helper'

# class PointOfDiversionsControllerTest < ActionController::TestCase
#   setup do
#     @point_of_diversion = point_of_diversions(:one)
#   end

#   test "should get index" do
#     get :index
#     assert_response :success
#     assert_not_nil assigns(:point_of_diversions)
#   end

#   test "should get new" do
#     get :new
#     assert_response :success
#   end

#   test "should create point_of_diversion" do
#     assert_difference('PointOfDiversion.count') do
#       post :create, point_of_diversion: { name: @point_of_diversion.name, point: @point_of_diversion.point }
#     end

#     assert_redirected_to point_of_diversion_path(assigns(:point_of_diversion))
#   end

#   test "should show point_of_diversion" do
#     get :show, id: @point_of_diversion
#     assert_response :success
#   end

#   test "should get edit" do
#     get :edit, id: @point_of_diversion
#     assert_response :success
#   end

#   test "should update point_of_diversion" do
#     patch :update, id: @point_of_diversion, point_of_diversion: { name: @point_of_diversion.name, point: @point_of_diversion.point }
#     assert_redirected_to point_of_diversion_path(assigns(:point_of_diversion))
#   end

#   test "should destroy point_of_diversion" do
#     assert_difference('PointOfDiversion.count', -1) do
#       delete :destroy, id: @point_of_diversion
#     end

#     assert_redirected_to point_of_diversions_path
#   end
# end
