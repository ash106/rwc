class CreateWanteds < ActiveRecord::Migration[4.2]
  def change
    create_table :wanteds do |t|
      t.float :volume
      t.string :source
      t.text :description
      t.string :contact_info
      t.references :listing_area, index: true

      t.timestamps
    end
  end
end
