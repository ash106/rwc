# Riley Water Consulting

[![Build Status](https://travis-ci.org/ash106/rwc.svg?branch=master)](https://travis-ci.org/ash106/rwc)
[![Coverage Status](https://coveralls.io/repos/github/ash106/rwc/badge.svg?branch=master)](https://coveralls.io/github/ash106/rwc?branch=master)
[![Code Climate](https://codeclimate.com/github/ash106/rwc/badges/gpa.svg)](https://codeclimate.com/github/ash106/rwc)

![Riley Water Consulting](http://i.imgur.com/gAAFErD.png)

[Demo](http://rwc-staging.herokuapp.com/)

## Built With

* [Ruby on Rails](http://rubyonrails.org/) - Used for parsing KML files, GeoJSON API endpoint, etc. 
* [Bootstrap](http://getbootstrap.com/) - CSS framework used for site design
* [Google Maps API](https://developers.google.com/maps/documentation/javascript/) - Used to draw points and polygons based on GeoJSON data from Rails

## Relevant Code

```ruby
# app/services/kml_parser.rb

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
```

```ruby
# app/helpers/application_helper.rb

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
    simple_coordinates = simplify_coordinates(poly["coordinates"][0])
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

def simplify_coordinates(coordinates)
  # Parse coordinates into expected format for simplify method
  coordinates_hash = []
  coordinates.each do |c|
    coordinates_hash << {x: c[0], y: c[1]}
  end
  # Simplify coordinates using tolerance: 0.001
  SimplifyRb.simplify(coordinates_hash, 0.001)
end
```

## Getting Started

### Prerequisites

```bash
ruby -v     # 2.4.1
rails -v    # 4.2.9
```

### Installing

Install dependencies

```bash
bundle install
```

Create `.env` file in project's root directory (to easily get a `SECRET_KEY_BASE` run `rake secret`)

```
RACK_ENV=development
SECRET_KEY_BASE=secret-key-base
S3_BUCKET_NAME=s3-bucket-name
AWS_ACCESS_KEY_ID=aws-id
AWS_SECRET_ACCESS_KEY=aws-secret-key
GOOGLE_MAPS_KEY=google-maps-key
SENDGRID_USERNAME=sendgrid-username
SENDGRID_PASSWORD=sendgrid-password
```

Setup database

```bash
rake db:setup
```

Run server

```bash
foreman start
```

[Click a point or polygon on the map](http://localhost:5000/show-water-rights)
