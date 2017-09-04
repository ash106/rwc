class ListingArea < ApplicationRecord
  has_many :wanteds, dependent: :destroy
  has_many :for_sales, dependent: :destroy
  validates :name, presence: true, uniqueness: true
  has_attached_file :kml, use_timestamp: false
  # validates_attachment_content_type :kml, content_type: "application/vnd.google-earth.kml+xml"
  validates_attachment_presence :kml
  validates_attachment_file_name :kml, matches: /kml\Z/
  after_save :queue_processing

private
  
  def queue_processing
    if saved_change_to_kml_updated_at?
      parser = KmlParser.new(id, 'ListingArea')
      parser.delay.parse_polygon
    end
  end
end
