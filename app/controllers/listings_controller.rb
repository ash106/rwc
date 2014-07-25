class ListingsController < ApplicationController
  def dashboard
    @listing_areas = ListingArea.all
    @wanteds = Wanted.all
    @for_sales = ForSale.all

  end

  def buy_sell
  end

  def get_data
    @areas = ListingArea.all
    render json: @areas, root: "features", meta: "FeatureCollection", meta_key: 'type'
  end
end
