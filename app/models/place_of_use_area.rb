require 'open-uri'

class PlaceOfUseArea < ActiveRecord::Base
  has_many :place_of_use_area_water_rights
  has_many :water_rights, through: :place_of_use_area_water_rights
  validates :name, presence: true, uniqueness: true
  has_attached_file :kml, use_timestamp: false
  # validates_attachment_content_type :kml, content_type: "application/vnd.google-earth.kml+xml"
  validates_attachment_presence :kml
  validates_attachment_file_name :kml, matches: /kml\Z/
  after_create :queue_processing

  def self.parse_kml(id)
    place_of_use_area = PlaceOfUseArea.find(id)
    doc = Nokogiri::HTML(open(place_of_use_area.kml.url))
    coordinates = doc.at_css("polygon coordinates").text
    coordinates_array = coordinates.scan(/(-?\d+.\d+),(-?\d+.\d+)/).collect { |lon, lat| [lon.to_f, lat.to_f]}
    polygon = 
      {
        type: "Polygon",
        coordinates: [
          coordinates_array
        ]
      }
    place_of_use_area.update_column(:polygon, polygon)
  end

private
  
  def queue_processing
    PlaceOfUseArea.delay.parse_kml(id)
  end
end
