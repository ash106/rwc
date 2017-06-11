class WantedsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_wanted, only: [:show, :edit, :update, :destroy]

  # GET /wanteds
  def index
    @wanteds = Wanted.includes(:listing_area)
    authorize @wanteds
  end

  # GET /wanteds/1
  def show
    authorize @wanted
  end

  # GET /wanteds/new
  def new
    @wanted = Wanted.new
    authorize @wanted
  end

  # GET /wanteds/1/edit
  def edit
    authorize @wanted
  end

  # POST /wanteds
  def create
    @wanted = Wanted.new(wanted_params)
    authorize @wanted

    if @wanted.save
      redirect_to @wanted, notice: 'Wanted was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /wanteds/1
  def update
    authorize @wanted
    if @wanted.update(wanted_params)
      redirect_to @wanted, notice: 'Wanted was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /wanteds/1
  def destroy
    authorize @wanted
    @wanted.destroy
    redirect_to listings_dashboard_url, notice: 'Wanted was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wanted
      @wanted = Wanted.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def wanted_params
      params.require(:wanted).permit(:volume, :source, :description, :contact_info, :listing_area_id)
    end
end
