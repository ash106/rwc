class WaterRightsManagementController < ApplicationController
  before_action :authenticate_user!, only: :dashboard

  def dashboard
    if params[:user_id]
      @user = User.find(params[:user_id])
      @water_rights = @user.water_rights
      @place_of_use_areas = PlaceOfUseArea.for_user(@user)#.preload(:water_rights)
      @point_of_diversions = PointOfDiversion.for_user(@user)#.preload(:water_rights)
    else
      @water_rights = WaterRight.includes(:user)
      @place_of_use_areas = PlaceOfUseArea.all
      @point_of_diversions = PointOfDiversion.all
    end
    @users = set_users_for_select(nil)
    authorize @water_rights, :index?
  end

  def show_water_rights
    if current_user
      @user_id = current_user.id
      if current_user.has_role? :admin
        @users = set_users_for_select(@user_id)
      end
    else
      @user_id = 0
    end
  end

  def get_data
    if params[:id].to_i > 0 # params[:id] is set to 0 if no user signed in
      user = User.find(params[:id])
    else
      user = User.find_by(email: 'tester@example.com')
    end
    if user.has_role? :admin
      @geometry = PlaceOfUseArea.includes(:water_rights) + PointOfDiversion.includes(:water_rights)
    else
      @geometry = PlaceOfUseArea.for_user(user).preload(:water_rights) + PointOfDiversion.for_user(user).preload(:water_rights)
    end
    render json: @geometry, root: "features", meta: "FeatureCollection", meta_key: 'type'
  end

private

  # def set_geometry(water_rights, geo_type)
  #   geometry = []
  #   water_rights.each do |wr|
  #     geometry << wr.send(geo_type)
  #   end
  #   geometry.flatten.uniq{|a| a.id}
  # end

  def set_users_for_select(all_users_val)
    users = User.includes(:water_rights).map{ |user| [user.email, user.id] if user.water_rights.any? }.compact
    users.unshift ["All Users", all_users_val]
  end

end
