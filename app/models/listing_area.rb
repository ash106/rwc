require 'open-uri'

class ListingArea < ActiveRecord::Base
  has_many :wanteds
  validates :name, presence: true
  has_attached_file :kml, path: ":class/:id/:filename"
  after_create :queue_processing
  # validates_attachment_content_type :kml, content_type: "application/vnd.google-earth.kml+xml"
  validates_attachment_file_name :kml, matches: /kml\Z/

  def self.parse_kml(id)
    listing_area = ListingArea.find(id)
    doc = Nokogiri::HTML(open(listing_area.kml.url))
    coordinates = doc.at_css("polygon coordinates").text
    coordinates_array = coordinates.scan(/(-?\d+.\d+),(-?\d+.\d+)/).collect { |lon, lat| [lon.to_f, lat.to_f]}
    listing_area.polygon = 
      {
        type: "Polygon",
        coordinates: [
          coordinates_array
        ]
      }
    listing_area.save
  end

private
  
  def queue_processing
    ListingArea.delay.parse_kml(id)
  end
end
