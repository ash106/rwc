module ApplicationHelper

  def google_maps_api_key
    ENV['GOOGLE_MAPS_KEY']
  end

  def google_api_url
    "http://maps.googleapis.com/maps/api/js"
  end

  def google_api_access
    "#{google_api_url}?key=#{google_maps_api_key}&sensor=false"
  end

  def google_maps_api
    content_tag(:script, type: "text/javascript", src: google_api_access) do
    end
  end

  def static_map(geometry)
    # If polygon, encode polygon and attach to URL
    if geometry["type"] == "Polygon"
      encoded_poly = encode_polygon(geometry)
      image_tag URI.encode("https://maps.googleapis.com/maps/api/staticmap?key=#{google_maps_api_key}&size=200x200&path=fillcolor:0x00000077|color:0x000000FF|weight:2|enc:#{encoded_poly}")
    # If point, just attach point in lat,lon format
    elsif geometry["type"] == "Point"
      point = "#{geometry["coordinates"][1]},#{geometry["coordinates"][0]}"
      image_tag URI.encode("https://maps.googleapis.com/maps/api/staticmap?key=#{google_maps_api_key}&size=200x200&zoom=14&markers=#{point}")
    end
  end

  def encode_polygon(poly)
    coordinates = []
    # If more than 200 points in polygon, then simplify polygon
    if poly["coordinates"][0].length > 200
      # Parse coordinates into expected format for simplify method
      coordinates_hash = []
      poly["coordinates"][0].each do |c|
        coordinates_hash << {x: c[0], y: c[1]}
      end
      # Simplify coordinates using tolerance: 0.001
      simple_coordinates = SimplifyRb.simplify(coordinates_hash, 0.001)
      # Parse coordinates into expected format for encode method
      simple_coordinates.each do |c|
        coordinates << [c[:y], c[:x]]
      end
    # If less than 200 points in polygon, just parse into expected format for encode method 
    else
      poly["coordinates"][0].each do |c|
        coordinates << [c[1], c[0]]
      end
    end
    # Encode points using Google encoded polyline algorithm
    Polylines::Encoder.encode_points(coordinates)
  end
  
end
