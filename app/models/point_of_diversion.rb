require 'open-uri'

class PointOfDiversion < ActiveRecord::Base
  has_many :point_of_diversion_water_rights
  has_many :water_rights, through: :point_of_diversion_water_rights
  validates :name, presence: true, uniqueness: true
  has_attached_file :kml, use_timestamp: false
  # validates_attachment_content_type :kml, content_type: "application/vnd.google-earth.kml+xml"
  validates_attachment_presence :kml
  validates_attachment_file_name :kml, matches: /kml\Z/
  after_create :queue_processing

  def self.parse_kml(id)
    point_of_diversion = PointOfDiversion.find(id)
    doc = Nokogiri::HTML(open(point_of_diversion.kml.url))
    coordinates = doc.at_css("point coordinates").text
    coordinates_set = coordinates.scan(/(-?\d+.\d+),(-?\d+.\d+)/).collect { |lon, lat| [lon.to_f, lat.to_f]}
    point = 
      {
        type: "Point",
        coordinates: coordinates_set[0]
      }
    point_of_diversion.update_column(:point, point)
  end

private
  
  def queue_processing
    PointOfDiversion.delay.parse_kml(id)
  end
end
