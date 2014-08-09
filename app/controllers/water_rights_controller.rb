class WaterRightsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_water_right, only: [:show, :edit, :update, :destroy]

  # GET /water_rights
  def index
    @water_rights = WaterRight.all
    authorize @water_rights
  end

  # GET /water_rights/1
  def show
    authorize @water_right
    @unassociated_place_of_use_areas = PlaceOfUseArea.all - @water_right.place_of_use_areas
    @unassociated_point_of_diversions = PointOfDiversion.all - @water_right.point_of_diversions
  end

  # GET /water_rights/new
  def new
    @water_right = WaterRight.new
    authorize @water_right
  end

  # GET /water_rights/1/edit
  def edit
    authorize @water_right
  end

  # POST /water_rights
  def create
    @water_right = WaterRight.new(water_right_params)
    authorize @water_right

    if @water_right.save
      redirect_to @water_right, notice: 'Water right was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /water_rights/1
  def update
    authorize @water_right
    if @water_right.update(water_right_params)
      redirect_to @water_right, notice: 'Water right was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /water_rights/1
  def destroy
    authorize @water_right
    @water_right.destroy
    redirect_to water_rights_url, notice: 'Water right was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_water_right
      @water_right = WaterRight.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def water_right_params
      params.require(:water_right).permit(:number, :flow_cfs, :flow_ac_ft, :sole_supply_acres, :place_of_use, :change_application_number, :proof_due_date, :user_id, :priority_date, :comments)
    end
end
