class AddViewLinkTextToWaterRights < ActiveRecord::Migration[4.2]
  def change
    add_column :water_rights, :view_link_text, :string
  end
end
