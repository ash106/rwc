class PlaceOfUseAreasController < ApplicationController
  before_action :authenticate_user!
  before_action :set_place_of_use_area, only: [:show, :edit, :update, :destroy]

  # GET /place_of_use_areas
  def index
    @place_of_use_areas = PlaceOfUseArea.all
    authorize @place_of_use_areas
  end

  # GET /place_of_use_areas/1
  def show
    authorize @place_of_use_area
  end

  # GET /place_of_use_areas/new
  def new
    @place_of_use_area = PlaceOfUseArea.new
    authorize @place_of_use_area
  end

  # GET /place_of_use_areas/1/edit
  def edit
    authorize @place_of_use_area
  end

  # POST /place_of_use_areas
  def create
    @place_of_use_area = PlaceOfUseArea.new(place_of_use_area_params)
    authorize @place_of_use_area

    if @place_of_use_area.save
      redirect_to @place_of_use_area, notice: 'Place of use area was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /place_of_use_areas/1
  def update
    authorize @place_of_use_area
    if @place_of_use_area.update(place_of_use_area_params)
      redirect_to @place_of_use_area, notice: 'Place of use area was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /place_of_use_areas/1
  def destroy
    authorize @place_of_use_area
    @place_of_use_area.destroy
    redirect_to place_of_use_areas_url, notice: 'Place of use area was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_place_of_use_area
      @place_of_use_area = PlaceOfUseArea.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def place_of_use_area_params
      params.require(:place_of_use_area).permit(:name, :kml, :color)
    end
end
