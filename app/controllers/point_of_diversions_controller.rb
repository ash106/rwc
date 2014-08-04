class PointOfDiversionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_point_of_diversion, only: [:show, :edit, :update, :destroy]

  # GET /point_of_diversions
  def index
    @point_of_diversions = PointOfDiversion.all
    authorize @point_of_diversions
  end

  # GET /point_of_diversions/1
  def show
    authorize @point_of_diversion
  end

  # GET /point_of_diversions/new
  def new
    @point_of_diversion = PointOfDiversion.new
    authorize @point_of_diversion
  end

  # GET /point_of_diversions/1/edit
  def edit
    authorize @point_of_diversion
  end

  # POST /point_of_diversions
  def create
    @point_of_diversion = PointOfDiversion.new(point_of_diversion_params)
    authorize @point_of_diversion

    if @point_of_diversion.save
      redirect_to @point_of_diversion, notice: 'Point of diversion was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /point_of_diversions/1
  def update
    authorize @point_of_diversion
    if @point_of_diversion.update(point_of_diversion_params)
      redirect_to @point_of_diversion, notice: 'Point of diversion was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /point_of_diversions/1
  def destroy
    authorize @point_of_diversion
    @point_of_diversion.destroy
    redirect_to point_of_diversions_url, notice: 'Point of diversion was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_point_of_diversion
      @point_of_diversion = PointOfDiversion.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def point_of_diversion_params
      params.require(:point_of_diversion).permit(:name, :kml)
    end
end
