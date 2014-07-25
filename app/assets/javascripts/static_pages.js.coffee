$ ->
  google.maps.visualRefresh = true
  ourLoc = new google.maps.LatLng(40.765344, -111.890736)
  mapOptions =
    center: ourLoc
    zoom: 15
    mapTypeId: google.maps.MapTypeId.ROADMAP
  map = new google.maps.Map($("#map_canvas")[0], mapOptions)
  marker = new google.maps.Marker
    position: ourLoc
    map: map
    title: "We are here!"