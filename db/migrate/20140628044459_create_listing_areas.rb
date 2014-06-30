class CreateListingAreas < ActiveRecord::Migration
  def change
    create_table :listing_areas do |t|
      t.string :name
      t.text :policy

      t.timestamps
    end
  end
end
