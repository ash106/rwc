$(".listing_areas-edit, .place_of_use_areas-edit, .point_of_diversions-edit, .listing_areas-show, .place_of_use_areas-show, .point_of_diversions-show").ready ->
  createMap = ->
    # Basic map options object
    mapOptions =
      center: new google.maps.LatLng(40.5999605, -111.747028)
      zoom: 9
      mapTypeId: google.maps.MapTypeId.ROADMAP

    # Create the map
    map = new google.maps.Map($("#map_canvas")[0], mapOptions)

    # Create bounds to focus map on the added geometry
    bounds = new google.maps.LatLngBounds()

    # console.log $("#map_canvas").data('feature')

    # Add GeoJSON for area being edited
    map.data.addGeoJson $("#map_canvas").data('feature')

    # Set bounds of map for added feature
    map.data.forEach (feature) ->
      # If feature is a polygon, add all points of polygon to map bounds
      if feature.getGeometry().getType() == "Polygon"
        # Get array of points that make up outer linear ring of polygon
        points = feature.getGeometry().getAt(0).getArray()
        # Extend bounds for each point
        for point in points
          bounds.extend point
        # Fit map bounds to added polygon
        map.fitBounds bounds
      # If feature is a point, add single point to map bounds and set map center and zoom
      if feature.getGeometry().getType() == "Point"
        bounds.extend feature.getGeometry().get()
        map.setCenter bounds.getCenter()
        map.setZoom 14

  createMap() if $("#map_canvas").data('feature') 