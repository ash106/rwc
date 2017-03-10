$(".home-page").ready ->
  skrollr.init
    forceHeight: false

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


      # styles: [{"stylers":[{"hue":"#ff1a00"},{"invert_lightness":true},{"saturation":-100},{"lightness":33},{"gamma":0.5}]},{"featureType":"water","elementType":"geometry","stylers":[{"color":"#2D333C"}]}]
       

      # [
      #   {
      #     "elementType": "geometry",
      #     "stylers": [
      #       {
      #         "color": "#2c2e2d"
      #       },
      #       {
      #         "weight": 5
      #       }
      #     ]
      #   },
      #   {
      #     "elementType": "labels.icon",
      #     "stylers": [
      #       {
      #         "visibility": "off"
      #       }
      #     ]
      #   },
      #   {
      #     "elementType": "labels.text.fill",
      #     "stylers": [
      #       {
      #         "color": "#757575"
      #       }
      #     ]
      #   },
      #   {
      #     "elementType": "labels.text.stroke",
      #     "stylers": [
      #       {
      #         "color": "#2c2e2d"
      #       }
      #     ]
      #   },
      #   {
      #     "featureType": "administrative",
      #     "elementType": "geometry",
      #     "stylers": [
      #       {
      #         "color": "#1b3622"
      #       },
      #       {
      #         "visibility": "off"
      #       }
      #     ]
      #   },
      #   {
      #     "featureType": "administrative.country",
      #     "elementType": "labels.text.fill",
      #     "stylers": [
      #       {
      #         "color": "#9e9e9e"
      #       }
      #     ]
      #   },
      #   {
      #     "featureType": "administrative.land_parcel",
      #     "stylers": [
      #       {
      #         "visibility": "off"
      #       }
      #     ]
      #   },
      #   {
      #     "featureType": "administrative.locality",
      #     "elementType": "labels.text.fill",
      #     "stylers": [
      #       {
      #         "color": "#bdbdbd"
      #       }
      #     ]
      #   },
      #   {
      #     "featureType": "poi",
      #     "stylers": [
      #       {
      #         "visibility": "off"
      #       }
      #     ]
      #   },
      #   {
      #     "featureType": "poi",
      #     "elementType": "labels.text.fill",
      #     "stylers": [
      #       {
      #         "color": "#757575"
      #       }
      #     ]
      #   },
      #   {
      #     "featureType": "poi.park",
      #     "elementType": "geometry",
      #     "stylers": [
      #       {
      #         "color": "#181818"
      #       }
      #     ]
      #   },
      #   {
      #     "featureType": "poi.park",
      #     "elementType": "labels.text.fill",
      #     "stylers": [
      #       {
      #         "color": "#616161"
      #       }
      #     ]
      #   },
      #   {
      #     "featureType": "poi.park",
      #     "elementType": "labels.text.stroke",
      #     "stylers": [
      #       {
      #         "color": "#1b1b1b"
      #       }
      #     ]
      #   },
      #   {
      #     "featureType": "road",
      #     "elementType": "geometry.fill",
      #     "stylers": [
      #       {
      #         "color": "#2c2c2c"
      #       }
      #     ]
      #   },
      #   {
      #     "featureType": "road",
      #     "elementType": "labels.icon",
      #     "stylers": [
      #       {
      #         "visibility": "off"
      #       }
      #     ]
      #   },
      #   {
      #     "featureType": "road",
      #     "elementType": "labels.text.fill",
      #     "stylers": [
      #       {
      #         "color": "#8a8a8a"
      #       }
      #     ]
      #   },
      #   {
      #     "featureType": "road.arterial",
      #     "elementType": "geometry",
      #     "stylers": [
      #       {
      #         "color": "#373737"
      #       }
      #     ]
      #   },
      #   {
      #     "featureType": "road.highway",
      #     "elementType": "geometry",
      #     "stylers": [
      #       {
      #         "color": "#3c3c3c"
      #       }
      #     ]
      #   },
      #   {
      #     "featureType": "road.highway.controlled_access",
      #     "elementType": "geometry",
      #     "stylers": [
      #       {
      #         "color": "#4e4e4e"
      #       }
      #     ]
      #   },
      #   {
      #     "featureType": "road.local",
      #     "elementType": "labels.text.fill",
      #     "stylers": [
      #       {
      #         "color": "#616161"
      #       }
      #     ]
      #   },
      #   {
      #     "featureType": "transit",
      #     "stylers": [
      #       {
      #         "visibility": "off"
      #       }
      #     ]
      #   },
      #   {
      #     "featureType": "transit",
      #     "elementType": "labels.text.fill",
      #     "stylers": [
      #       {
      #         "color": "#757575"
      #       }
      #     ]
      #   },
      #   {
      #     "featureType": "water",
      #     "elementType": "geometry",
      #     "stylers": [
      #       {
      #         "color": "#000000"
      #       }
      #     ]
      #   },
      #   {
      #     "featureType": "water",
      #     "elementType": "labels.text.fill",
      #     "stylers": [
      #       {
      #         "color": "#3d3d3d"
      #       }
      #     ]
      #   }
      # ]

    # Create the map
    map = new google.maps.Map($("#homepage-map")[0], mapOptions)

    marker = new google.maps.Marker
      position: ourLoc
      map: map
      icon: "https://cdn2.iconfinder.com/data/icons/font-awesome/1792/map-marker-64.png"
      title: "We are here!"

  createMap()
