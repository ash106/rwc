require 'open-uri'

class PointOfDiversion < ActiveRecord::Base
  validates :name, presence: true
  has_many :point_of_diversion_water_rights
  has_many :water_rights, through: :point_of_diversion_water_rights
  has_attached_file :kml, path: ":class/:id/:filename"
  after_create :queue_processing
  # validates_attachment_content_type :kml, content_type: "application/vnd.google-earth.kml+xml"
  validates_attachment_file_name :kml, matches: /kml\Z/

  def self.parse_kml(id)
    point_of_diversion = PointOfDiversion.find(id)
    doc = Nokogiri::HTML(open(point_of_diversion.kml.url))
    coordinates = doc.at_css("point coordinates").text
    coordinates_set = coordinates.scan(/(-?\d+.\d+),(-?\d+.\d+)/).collect { |lon, lat| [lon.to_f, lat.to_f]}
    point_of_diversion.point = 
      {
        type: "Point",
        coordinates: coordinates_set
      }
    point_of_diversion.save
  end

private
  
  def queue_processing
    PointOfDiversion.delay.parse_kml(id)
  end
end
