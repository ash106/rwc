class PointOfDiversionWaterRightsController < ApplicationController
  def create
    point_of_diversion_water_right = PointOfDiversionWaterRight.new(point_of_diversion_water_right_params)

    if point_of_diversion_water_right.save
      flash[:notice] = "Association successfully created!"
    else
      flash[:alert] = "Uh oh! Something went wrong. Please try again or contact us for support!"
    end
    redirect_to water_right_path(params[:point_of_diversion_water_right][:water_right_id])
  end

private

  def point_of_diversion_water_right_params
    params.require(:point_of_diversion_water_right).permit(:water_right_id, :point_of_diversion_id)
  end

end
