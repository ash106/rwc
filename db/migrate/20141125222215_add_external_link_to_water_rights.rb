class AddExternalLinkToWaterRights < ActiveRecord::Migration
  def change
    add_column :water_rights, :external_link, :string
  end
end
