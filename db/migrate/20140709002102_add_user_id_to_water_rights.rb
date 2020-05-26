class AddUserIdToWaterRights < ActiveRecord::Migration[4.2]
  def change
    add_reference :water_rights, :user, index: true
  end
end
