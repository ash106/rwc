class AddPolygonToListingAreas < ActiveRecord::Migration
  def change
    add_column :listing_areas, :polygon, :json
  end
end
