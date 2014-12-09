class AddViewLinkTextToWaterRights < ActiveRecord::Migration
  def change
    add_column :water_rights, :view_link_text, :string
  end
end
