class ChangeWaterRightPlaceOfUseToUses < ActiveRecord::Migration[4.2]
  def change
    rename_column :water_rights, :place_of_use, :uses
  end
end
