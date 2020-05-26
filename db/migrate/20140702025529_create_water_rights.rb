class CreateWaterRights < ActiveRecord::Migration[4.2]
  def change
    create_table :water_rights do |t|
      t.string :number
      t.decimal :flow_cfs
      t.decimal :flow_ac_ft
      t.decimal :sole_supply_acres
      t.string :place_of_use
      t.string :change_application_number
      t.date :proof_due_date

      t.timestamps
    end
  end
end
