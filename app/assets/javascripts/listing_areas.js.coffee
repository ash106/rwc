$(".listing_areas-edit").ready ->
  createMap = ->
    # Basic map options object
    mapOptions =
      center: new google.maps.LatLng(40.5999605, -111.747028)
      zoom: 9
      mapTypeId: google.maps.MapTypeId.ROADMAP

    # Create the map
    map = new google.maps.Map($("#map_canvas.edit_page")[0], mapOptions)

    # Create bounds to focus map on the added geometry
    bounds = new google.maps.LatLngBounds()

    # console.log $("#map_canvas.edit_page").data('feature')

    # Add GeoJSON for area being edited
    map.data.addGeoJson $("#map_canvas.edit_page").data('feature')

    # Set bounds of map for added feature
    map.data.forEach (feature) ->
      # Get array of points that make up outer linear ring of polygon
      points = feature.getGeometry().getAt(0).getArray()
      # Extend bounds for each point
      for point in points
        bounds.extend point
      # Fit map bounds to added geometry
      map.fitBounds bounds

  createMap() if $("#map_canvas.edit_page").data('feature') 