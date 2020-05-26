class CreateListingAreas < ActiveRecord::Migration[4.2]
  def change
    create_table :listing_areas do |t|
      t.string :name
      t.text :policy

      t.timestamps
    end
  end
end
