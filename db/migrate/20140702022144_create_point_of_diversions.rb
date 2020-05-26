class CreatePointOfDiversions < ActiveRecord::Migration[4.2]
  def change
    create_table :point_of_diversions do |t|
      t.string :name
      t.json :point

      t.timestamps
    end
  end
end
