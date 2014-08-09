class PlaceOfUseAreaWaterRightsController < ApplicationController
  def create
    place_of_use_area_water_right = PlaceOfUseAreaWaterRight.new(place_of_use_area_water_right_params)

    if place_of_use_area_water_right.save
      flash[:notice] = "Association successfully created!"
    else
      flash[:alert] = "Uh oh! Something went wrong. Please try again or contact us for support!"
    end
    redirect_to water_right_path(params[:place_of_use_area_water_right][:water_right_id])
  end

private

  def place_of_use_area_water_right_params
    params.require(:place_of_use_area_water_right).permit(:water_right_id, :place_of_use_area_id)
  end

end
