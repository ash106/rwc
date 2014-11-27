require 'open-uri'

class KmlParser
  def initialize(id, model_name)
    @id = id
    @model_name = model_name.constantize
  end

  def parse_polygon
    model = get_model
    doc = open_doc(model)
    coordinates_array = parse_coordinates(doc.at_css("polygon coordinates").text)
    polygon = 
      {
        type: "Polygon",
        coordinates: [
          coordinates_array
        ]
      }
    model.update_column(:polygon, polygon)
  end

  def parse_point
    model = get_model
    doc = open_doc(model) 
    coordinates_set = parse_coordinates(doc.at_css("point coordinates").text)
    point = 
      {
        type: "Point",
        coordinates: coordinates_set[0]
      }
    model.update_column(:point, point)
  end

private

  def get_model
    @model_name.find(@id)
  end
  
  def open_doc(model)
    Nokogiri::HTML(open(model.kml.url))
  end

  def parse_coordinates(coordinates)
    coordinates.scan(/(-?\d+.\d+),(-?\d+.\d+)/).collect { |lon, lat| [lon.to_f, lat.to_f]}
  end
end