$(".contact-page").ready ->
  createMap = ->
    ourLoc = new google.maps.LatLng(40.765344, -111.890736)
    # Basic map options object
    mapOptions =
      center: ourLoc
      zoom: 16
      mapTypeId: google.maps.MapTypeId.ROADMAP
      disableDefaultUI: true
      scrollwheel: false
      styles: [
        {
          "featureType":"all",
          "elementType":"all",
          "stylers": [
            {
              "hue":"#ff0000"
            },
            {
              "saturation":-100
            },
            {
              "lightness":-30
            }
          ]
        },
        {
          "featureType":"all",
          "elementType":"labels.text.fill",
          "stylers": [
            {
              "color":"#ffffff"
            }
          ]
        },
        {
          "featureType":"all",
          "elementType":"labels.text.stroke",
          "stylers": [
            {
              "color":"#353535"
            }
          ]
        },
        {
          "featureType":"landscape",
          "elementType":"geometry",
          "stylers": [
            {
              "color":"#656565"
            }
          ]
        },
        {
          "featureType":"poi",
          "elementType":"geometry.fill",
          "stylers": [
            {
              "color":"#505050"
            }
          ]
        },
        {
          "featureType":"poi",
          "elementType":"geometry.stroke",
          "stylers": [
            {
              "color":"#808080"
            }
          ]
        },
        {
          "featureType":"road",
          "elementType":"geometry",
          "stylers": [
            {
              "color":"#454545"
            }
          ]
        },
        {
          "featureType": "poi",
          "stylers": [
            {
              "visibility": "off"
            }
          ]
        },
        {
          "featureType": "transit",
          "stylers": [
            {
              "visibility": "off"
            }
          ]
        },
        {
          "featureType":"administrative",
          "stylers": [
            {
              "visibility": "off"
            }
          ]
        }
      ]

    # Create the map
    map = new google.maps.Map($("#contact-page-map")[0], mapOptions)

    marker = new google.maps.Marker
      position: ourLoc
      map: map
      icon: "https://cdn2.iconfinder.com/data/icons/font-awesome/1792/map-marker-64.png"
      title: "We are here!"

  createMap()
