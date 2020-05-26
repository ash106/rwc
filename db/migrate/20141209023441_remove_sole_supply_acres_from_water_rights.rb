class RemoveSoleSupplyAcresFromWaterRights < ActiveRecord::Migration[4.2]
  def change
    remove_column :water_rights, :sole_supply_acres, :integer
  end
end
