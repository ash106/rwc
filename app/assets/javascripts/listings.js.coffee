$ ->
  mapOptions =
    center: new google.maps.LatLng(40.5999605, -111.747028)
    zoom: 9
    mapTypeId: google.maps.MapTypeId.ROADMAP
  map = new google.maps.Map($("#map_canvas")[0], mapOptions)

  map.data.loadGeoJson('http://rwc.dev/get-listings-data.json')