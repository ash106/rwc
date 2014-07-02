$ ->
  _.uniqObjects = (arr) ->
    _.uniq _.collect arr, (x) ->
      JSON.stringify x

  mapOptions =
    center: new google.maps.LatLng(40.5999605, -111.747028)
    zoom: 9
    mapTypeId: google.maps.MapTypeId.ROADMAP
  map = new google.maps.Map($("#map_canvas.water_rights")[0], mapOptions)
  bounds = new google.maps.LatLngBounds()

  map.data.loadGeoJson('/get-water-rights-data.json')

  water_rights = []

  map.data.addListener 'addfeature', (feature) ->
    if feature.feature.getGeometry().getType() == "Polygon"
      points = feature.feature.getGeometry().getAt(0).getArray()
      for point in points
        bounds.extend point
    if feature.feature.getGeometry().getType() == "Point"
      bounds.extend feature.feature.getGeometry().get()
    map.fitBounds bounds
    wrs = feature.feature.getProperty "water_rights"
    for wr in wrs
      water_rights.push wr
    water_rights = _.uniq water_rights, (wr) ->
                      wr.number
    water_rights = _.sortBy water_rights, (wr) ->
                      parseInt wr.number.match(/(\d+)$/)[0], 10
    $('#water_rights_table').html(
      for wr in water_rights
        "<tr><td>#{wr.number}</td><td>#{wr.flow_cfs}</td><td>#{wr.change_application_number}</td></tr>"
    )
    return

  map.data.addListener 'click', (event) ->
    map.data.revertStyle()
    if event.feature.getGeometry().getType() == "Polygon"
      map.data.overrideStyle event.feature, fillColor: '#76b5c6', strokeColor: '#6eb3c6'
    if event.feature.getGeometry().getType() == "Point"
      map.data.overrideStyle event.feature, icon: 'http://www.googlemapsmarkers.com/v1/76b5c6/'
    clicked_water_rights = event.feature.getProperty "water_rights"
    console.log water_rights
    $('#water_rights_table').html(
      for wr in water_rights
        if _.findWhere clicked_water_rights, wr
          "<tr class='highlighted'><td>#{wr.number}</td><td>#{wr.flow_cfs}</td><td>#{wr.change_application_number}</td></tr>"
        else
          "<tr><td>#{wr.number}</td><td>#{wr.flow_cfs}</td><td>#{wr.change_application_number}</td></tr>"
    )
    return

