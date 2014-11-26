class WaterRightsManagementController < ApplicationController
  before_action :authenticate_user!, only: :dashboard

  def dashboard
    if params[:user_id]
      @user = User.find(params[:user_id])
      @water_rights = @user.water_rights
      areas = []
      points = []
      @user.water_rights.each do |wr|
        areas << wr.place_of_use_areas
        points << wr.point_of_diversions
      end
      @place_of_use_areas = areas.flatten.uniq{|a| a.id}
      @point_of_diversions = points.flatten.uniq{|p| p.id}
    else
      @water_rights = WaterRight.all
      @place_of_use_areas = PlaceOfUseArea.all
      @point_of_diversions = PointOfDiversion.all
    end
    @users = User.all.map{ |user| [user.email, user.id] if user.water_rights.any? }.compact
    @users.unshift ["All Users", nil]
    authorize @water_rights, :index?
  end

  def show_water_rights
    if current_user
      @user_id = current_user.id
      if current_user.has_role? :admin
        @users = User.all.map{ |user| [user.email, user.id] if user.water_rights.any? }.compact
        @users.unshift ["All Users", @user_id]
      end
    else
      @user_id = 0
    end
  end

  def get_data
    if params[:id].to_i > 0 # params[:id] is set to 0 if no user signed in
      user = User.find(params[:id])
      @geometry = set_geometry(user)
    else
      user = User.find_by(email: 'tester@example.com')
      @geometry = set_geometry(user)
    end
    render json: @geometry, root: "features", meta: "FeatureCollection", meta_key: 'type'
  end

private

  def set_geometry(user)
    areas = []
    points = []
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
    areas + points
  end

end
