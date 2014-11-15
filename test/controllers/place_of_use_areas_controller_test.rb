# require 'test_helper'

# class PlaceOfUseAreasControllerTest < ActionController::TestCase
#   setup do
#     @place_of_use_area = place_of_use_areas(:one)
#   end

#   test "should get index" do
#     get :index
#     assert_response :success
#     assert_not_nil assigns(:place_of_use_areas)
#   end

#   test "should get new" do
#     get :new
#     assert_response :success
#   end

#   test "should create place_of_use_area" do
#     assert_difference('PlaceOfUseArea.count') do
#       post :create, place_of_use_area: { name: @place_of_use_area.name, polygon: @place_of_use_area.polygon }
#     end

#     assert_redirected_to place_of_use_area_path(assigns(:place_of_use_area))
#   end

#   test "should show place_of_use_area" do
#     get :show, id: @place_of_use_area
#     assert_response :success
#   end

#   test "should get edit" do
#     get :edit, id: @place_of_use_area
#     assert_response :success
#   end

#   test "should update place_of_use_area" do
#     patch :update, id: @place_of_use_area, place_of_use_area: { name: @place_of_use_area.name, polygon: @place_of_use_area.polygon }
#     assert_redirected_to place_of_use_area_path(assigns(:place_of_use_area))
#   end

#   test "should destroy place_of_use_area" do
#     assert_difference('PlaceOfUseArea.count', -1) do
#       delete :destroy, id: @place_of_use_area
#     end

#     assert_redirected_to place_of_use_areas_path
#   end
# end
