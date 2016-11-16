class AddColorToPlaceOfUseAreas < ActiveRecord::Migration
  def change
    add_column :place_of_use_areas, :color, :string
  end
end
