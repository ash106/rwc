class CreatePlaceOfUseAreaWaterRights < ActiveRecord::Migration
  def change
    create_table :place_of_use_area_water_rights do |t|
      t.references :place_of_use_area, index: true
      t.references :water_right, index: true

      t.timestamps
    end
  end
end
