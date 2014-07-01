class ListingAreasController < ApplicationController
  before_action :set_listing_area, only: [:show, :edit, :update, :destroy]

  # GET /listing_areas
  def index
    @listing_areas = ListingArea.all
  end

  # GET /listing_areas/1
  def show
  end

  # GET /listing_areas/new
  def new
    @listing_area = ListingArea.new
  end

  # GET /listing_areas/1/edit
  def edit
  end

  # POST /listing_areas
  def create
    @listing_area = ListingArea.new(listing_area_params)

    if @listing_area.save
      redirect_to @listing_area, notice: 'Listing area was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /listing_areas/1
  def update
    if @listing_area.update(listing_area_params)
      redirect_to @listing_area, notice: 'Listing area was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /listing_areas/1
  def destroy
    @listing_area.destroy
    redirect_to listing_areas_url, notice: 'Listing area was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_listing_area
      @listing_area = ListingArea.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def listing_area_params
      params.require(:listing_area).permit(:name, :policy, :kml)
    end
end
