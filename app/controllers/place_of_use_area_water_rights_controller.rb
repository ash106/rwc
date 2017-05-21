class PlaceOfUseAreaWaterRightsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    place_of_use_area_water_right = PlaceOfUseAreaWaterRight.new(place_of_use_area_water_right_params)

    if place_of_use_area_water_right.save
      flash[:notice] = "Association successfully created!"
    else
      flash[:alert] = "Uh oh! Something went wrong. Please try again or contact us for support!"
    end
    redirect_to water_right_path(params[:place_of_use_area_water_right][:water_right_id])
  end

  def destroy
    place_of_use_area_water_right = PlaceOfUseAreaWaterRight.find_by(place_of_use_area_id: params[:place_of_use_area_id], water_right_id: params[:water_right_id])
    place_of_use_area_water_right.destroy
    redirect_to water_right_path(params[:water_right_id]), notice: 'Association was successfully destroyed.'
  end

private

  def place_of_use_area_water_right_params
    params.require(:place_of_use_area_water_right).permit(:water_right_id, :place_of_use_area_id)
  end

end
