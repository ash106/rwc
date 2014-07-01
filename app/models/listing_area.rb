class ListingArea < ActiveRecord::Base
  validates :name, presence: true
  has_attached_file :kml, path: ":class/:id/:filename"
  validates_attachment_content_type :kml, content_type: "application/vnd.google-earth.kml+xml"
end
