class CreatePlaceOfUseAreas < ActiveRecord::Migration
  def change
    create_table :place_of_use_areas do |t|
      t.string :name
      t.json :polygon

      t.timestamps
    end
  end
end
