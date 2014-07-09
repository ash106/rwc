class AddUserIdToWaterRights < ActiveRecord::Migration
  def change
    add_reference :water_rights, :user, index: true
  end
end
