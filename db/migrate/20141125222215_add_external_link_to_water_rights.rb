class AddExternalLinkToWaterRights < ActiveRecord::Migration[4.2]
  def change
    add_column :water_rights, :external_link, :string
  end
end
