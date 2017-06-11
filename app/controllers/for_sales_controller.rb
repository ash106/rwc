class ForSalesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_for_sale, only: [:show, :edit, :update, :destroy]

  # GET /for_sales
  def index
    @for_sales = ForSale.includes(:listing_area)
    authorize @for_sales
  end

  # GET /for_sales/1
  def show
    authorize @for_sale
  end

  # GET /for_sales/new
  def new
    @for_sale = ForSale.new
    authorize @for_sale
  end

  # GET /for_sales/1/edit
  def edit
    authorize @for_sale
  end

  # POST /for_sales
  def create
    @for_sale = ForSale.new(for_sale_params)
    authorize @for_sale

    if @for_sale.save
      redirect_to @for_sale, notice: 'For sale was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /for_sales/1
  def update
    authorize @for_sale
    if @for_sale.update(for_sale_params)
      redirect_to @for_sale, notice: 'For sale was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /for_sales/1
  def destroy
    authorize @for_sale
    @for_sale.destroy
    redirect_to listings_dashboard_url, notice: 'For sale was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_for_sale
      @for_sale = ForSale.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def for_sale_params
      params.require(:for_sale).permit(:volume, :source, :description, :price, :contact_info, :listing_area_id)
    end
end
