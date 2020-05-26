class AddColorToPlaceOfUseAreas < ActiveRecord::Migration[4.2]
  def change
    add_column :place_of_use_areas, :color, :string
  end
end
