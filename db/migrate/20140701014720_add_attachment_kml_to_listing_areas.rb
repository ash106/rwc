class AddAttachmentKmlToListingAreas < ActiveRecord::Migration[4.2]
  def self.up
    change_table :listing_areas do |t|
      t.attachment :kml
    end
  end

  def self.down
    drop_attached_file :listing_areas, :kml
  end
end
