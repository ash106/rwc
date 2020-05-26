class CreatePointOfDiversionWaterRights < ActiveRecord::Migration[4.2]
  def change
    create_table :point_of_diversion_water_rights do |t|
      t.references :point_of_diversion, index: true
      t.references :water_right, index: true

      t.timestamps
    end
  end
end
