class WaterRightsManagementController < ApplicationController
  def dashboard
  end

  def show_water_rights
  end

  def get_data
    areas = PlaceOfUseArea.all
    points = PointOfDiversion.all
    @geometry = areas + points
    render json: @geometry, root: "features", meta: "FeatureCollection", meta_key: 'type'
  end
end
