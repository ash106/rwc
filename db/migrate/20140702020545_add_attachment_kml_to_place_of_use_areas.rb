class AddAttachmentKmlToPlaceOfUseAreas < ActiveRecord::Migration
  def self.up
    change_table :place_of_use_areas do |t|
      t.attachment :kml
    end
  end

  def self.down
    drop_attached_file :place_of_use_areas, :kml
  end
end
