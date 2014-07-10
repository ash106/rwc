class AddAttributesToWaterRights < ActiveRecord::Migration
  def change
    add_column :water_rights, :priority_date, :date
    add_column :water_rights, :comments, :text
  end
end
