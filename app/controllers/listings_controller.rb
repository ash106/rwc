class ListingsController < ApplicationController
  before_action :authenticate_user!, only: :dashboard

  def dashboard
    @listing_areas = ListingArea.all
    @wanteds = Wanted.all
    @for_sales = ForSale.all
    authorize @listing_areas, :index?
  end

  def buy_sell
  end

  def get_data
    @areas = ListingArea.all
    render json: @areas, root: "features", meta: "FeatureCollection", meta_key: 'type'
  end
end
