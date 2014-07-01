class ListingsController < ApplicationController
  def dashboard
  end

  def buy_sell
  end

  def get_listings_data
    @areas = ListingArea.all
    render json: @areas, root: "features", meta: "FeatureCollection", meta_key: 'type'
  end
end
