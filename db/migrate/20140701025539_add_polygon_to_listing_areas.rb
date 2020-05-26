class AddPolygonToListingAreas < ActiveRecord::Migration[4.2]
  def change
    add_column :listing_areas, :polygon, :json
  end
end
