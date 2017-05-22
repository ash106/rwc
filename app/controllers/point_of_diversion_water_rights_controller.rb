class PointOfDiversionWaterRightsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    point_of_diversion_water_right = PointOfDiversionWaterRight.new(point_of_diversion_water_right_params)

    if point_of_diversion_water_right.save
      flash[:notice] = "Association successfully created!"
    else
      flash[:alert] = "Uh oh! Something went wrong. Please try again or contact us for support!"
    end
    redirect_to water_right_path(params[:point_of_diversion_water_right][:water_right_id])
  end

  def destroy
    point_of_diversion_water_right = PointOfDiversionWaterRight.find_by(point_of_diversion_id: params[:point_of_diversion_id], water_right_id: params[:water_right_id])
    point_of_diversion_water_right.destroy
    redirect_to water_right_path(params[:water_right_id]), notice: 'Association was successfully destroyed.'
  end

private

  def point_of_diversion_water_right_params
    params.require(:point_of_diversion_water_right).permit(:water_right_id, :point_of_diversion_id)
  end

end
