require 'open-uri'

class PlaceOfUseArea < ActiveRecord::Base
  validates :name, presence: true
  has_attached_file :kml, path: ":class/:id/:filename"
  after_create :queue_processing
  # validates_attachment_content_type :kml, content_type: "application/vnd.google-earth.kml+xml"
  validates_attachment_file_name :kml, matches: /kml\Z/

  def self.parse_kml(id)
    place_of_use_area = PlaceOfUseArea.find(id)
    doc = Nokogiri::HTML(open(place_of_use_area.kml.url))
    coordinates = doc.at_css("polygon coordinates").text
    coordinates_array = coordinates.scan(/(-?\d+.\d+),(-?\d+.\d+)/).collect { |lon, lat| [lon.to_f, lat.to_f]}
    place_of_use_area.polygon = 
      {
        type: "Polygon",
        coordinates: [
          coordinates_array
        ]
      }
    place_of_use_area.save
  end

private
  
  def queue_processing
    PlaceOfUseArea.delay.parse_kml(id)
  end
end
