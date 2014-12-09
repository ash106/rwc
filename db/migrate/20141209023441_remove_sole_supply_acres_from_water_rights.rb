class RemoveSoleSupplyAcresFromWaterRights < ActiveRecord::Migration
  def change
    remove_column :water_rights, :sole_supply_acres, :integer
  end
end
