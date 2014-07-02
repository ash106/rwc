class PointOfDiversionsController < ApplicationController
  before_action :set_point_of_diversion, only: [:show, :edit, :update, :destroy]

  # GET /point_of_diversions
  def index
    @point_of_diversions = PointOfDiversion.all
  end

  # GET /point_of_diversions/1
  def show
  end

  # GET /point_of_diversions/new
  def new
    @point_of_diversion = PointOfDiversion.new
  end

  # GET /point_of_diversions/1/edit
  def edit
  end

  # POST /point_of_diversions
  def create
    @point_of_diversion = PointOfDiversion.new(point_of_diversion_params)

    if @point_of_diversion.save
      redirect_to @point_of_diversion, notice: 'Point of diversion was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /point_of_diversions/1
  def update
    if @point_of_diversion.update(point_of_diversion_params)
      redirect_to @point_of_diversion, notice: 'Point of diversion was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /point_of_diversions/1
  def destroy
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
