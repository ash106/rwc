class ForSalesController < ApplicationController
  before_action :set_for_sale, only: [:show, :edit, :update, :destroy]

  # GET /for_sales
  def index
    @for_sales = ForSale.all
  end

  # GET /for_sales/1
  def show
  end

  # GET /for_sales/new
  def new
    @for_sale = ForSale.new
  end

  # GET /for_sales/1/edit
  def edit
  end

  # POST /for_sales
  def create
    @for_sale = ForSale.new(for_sale_params)

    if @for_sale.save
      redirect_to @for_sale, notice: 'For sale was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /for_sales/1
  def update
    if @for_sale.update(for_sale_params)
      redirect_to @for_sale, notice: 'For sale was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /for_sales/1
  def destroy
    @for_sale.destroy
    redirect_to for_sales_url, notice: 'For sale was successfully destroyed.'
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
