class ChangeWaterRightPlaceOfUseToUses < ActiveRecord::Migration
  def change
    rename_column :water_rights, :place_of_use, :uses
  end
end
