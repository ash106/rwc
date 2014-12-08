class ListingsController < ApplicationController
  before_action :authenticate_user!, only: :dashboard

  def dashboard
    @listing_areas = ListingArea.all
    @wanteds = Wanted.includes(:listing_area)
    @for_sales = ForSale.includes(:listing_area)
    authorize @listing_areas, :index?
  end

  def buy_sell
  end

  def get_data
    @areas = ListingArea.includes(:wanteds, :for_sales)
    render json: @areas, root: "features", meta: "FeatureCollection", meta_key: 'type'
  end
end
