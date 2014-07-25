class WaterRightsManagementController < ApplicationController
  def dashboard
    @water_rights = WaterRight.all
    @place_of_use_areas = PlaceOfUseArea.all
    @point_of_diversions = PointOfDiversion.all
  end

  def show_water_rights
    if current_user
      @user_id = current_user.id
    else
      @user_id = 0
    end
    @users = User.all.map{ |user| [user.email, user.id] if user.water_rights.any? }.compact
    @users.unshift ["All Users", @user_id]
  end

  def get_data
    areas = []
    points = []
    if params[:id].to_i > 0
      user = User.find(params[:id].to_i)
      if user.has_role? :admin
        areas = PlaceOfUseArea.all
        points = PointOfDiversion.all
      else
        user.water_rights.each do |wr|
          areas << wr.place_of_use_areas
          points << wr.point_of_diversions
        end
        areas = areas.flatten.uniq{|a| a.id}
        points = points.flatten.uniq{|p| p.id}
      end
    else
      user = User.find_by(email: 'tester@example.com')
      user.water_rights.each do |wr|
        areas << wr.place_of_use_areas
        points << wr.point_of_diversions
      end
      areas = areas.flatten.uniq{|a| a.id}
      points = points.flatten.uniq{|p| p.id}
    end
    @geometry = areas + points
    render json: @geometry, root: "features", meta: "FeatureCollection", meta_key: 'type'
  end
end
