class AddAttributesToWaterRights < ActiveRecord::Migration[4.2]
  def change
    add_column :water_rights, :priority_date, :date
    add_column :water_rights, :comments, :text
  end
end
