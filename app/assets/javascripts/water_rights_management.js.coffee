$ ->
  mapOptions =
    center: new google.maps.LatLng(40.5999605, -111.747028)
    zoom: 9
    mapTypeId: google.maps.MapTypeId.ROADMAP
  map = new google.maps.Map($("#map_canvas.water_rights")[0], mapOptions)
  bounds = new google.maps.LatLngBounds()

  map.data.loadGeoJson('/get-water-rights-data.json')

  map.data.addListener 'addfeature', (feature) ->
    if feature.feature.getGeometry().getType() == "Polygon"
      points = feature.feature.getGeometry().getAt(0).getArray()
      for point in points
        bounds.extend point
    if feature.feature.getGeometry().getType() == "Point"
      bounds.extend feature.feature.getGeometry().get()
    map.fitBounds bounds
    return

  map.data.addListener 'click', (event) ->
    console.log event.feature.getProperty "water_rights"
    return