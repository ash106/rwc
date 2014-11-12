$ ->
  # Basic map options object
  mapOptions =
    center: new google.maps.LatLng(40.5999605, -111.747028)
    zoom: 9
    mapTypeId: google.maps.MapTypeId.ROADMAP

  # Create the map
  map = new google.maps.Map($("#map_canvas.water_rights")[0], mapOptions)
  
  # Create bounds to focus map on the added geometry
  bounds = new google.maps.LatLngBounds()

  # Empty array that will be used to store water rights
  water_rights = []

  # Load GeoJSON based on current_user ID, which defaults to 0 if no user is signed in
  map.data.loadGeoJson("/get-water-rights-data/#{$('#water_rights_table').data('user')}.json")

  #Date formatter for water rights dates in table
  date_formatter = (date) ->
    d = date.split("-")[2]
    m = date.split("-")[1]
    y = date.split("-")[0]
    m + "/" + d + "/" + y

  # setLinkListeners = ->
  #   console.log "called setLinkListeners"
  #   $('td a').click (e) ->
  #     e.preventDefault()
  #     map.data.revertStyle()
  #     clicked_wr_number = $(this).attr "href"
  #     $('#water_rights_table').html(
  #       for wr in water_rights
  #         if wr.number == clicked_wr_number
  #           "<tr class='highlighted'><td>#{wr.number}</td><td>#{date_formatter(wr.priority_date)}</td><td>#{wr.change_application_number}</td><td>#{date_formatter(wr.proof_due_date)}</td><td><a href='#{wr.number}'>View</a></td><td>#{if wr.flow_cfs != null then wr.flow_cfs else ""}</td><td>#{if wr.flow_ac_ft != null then wr.flow_ac_ft else ""}</td><td>#{wr.place_of_use}</td><td>#{if wr.comments != null then wr.comments else ""}</td></tr>"
  #         else
  #           "<tr><td>#{wr.number}</td><td>#{date_formatter(wr.priority_date)}</td><td>#{wr.change_application_number}</td><td>#{date_formatter(wr.proof_due_date)}</td><td><a href='#{wr.number}'>View</a></td><td>#{if wr.flow_cfs != null then wr.flow_cfs else ""}</td><td>#{if wr.flow_ac_ft != null then wr.flow_ac_ft else ""}</td><td>#{wr.place_of_use}</td><td>#{if wr.comments != null then wr.comments else ""}</td></tr>"
  #     )
  #     setLinkListeners()
  #     console.log clicked_wr_number
  #     selected_bounds = new google.maps.LatLngBounds()
  #     map.data.forEach (feature) ->
  #       feature_wrs = feature.getProperty "water_rights"
  #       for wr in feature_wrs
  #         if wr.number == clicked_wr_number
  #           if feature.getGeometry().getType() == "Polygon"
  #             map.data.overrideStyle feature, fillColor: '#76b5c6', strokeColor: '#6eb3c6'
  #             points = feature.getGeometry().getAt(0).getArray()
  #             for point in points
  #               selected_bounds.extend point
  #           if feature.getGeometry().getType() == "Point"
  #             map.data.overrideStyle feature, icon: 'https://cdn1.iconfinder.com/data/icons/Map-Markers-Icons-Demo-PNG/48/Map-Marker-Flag--Azure.png'
  #             selected_bounds.extend feature.getGeometry().get()
  #       map.fitBounds selected_bounds


  # Called when each feature is added to the map
  map.data.addListener 'addfeature', (e) ->
    console.log e.feature
    # If feature is a polygon, add all points of polygon to map bounds
    if e.feature.getGeometry().getType() == "Polygon"
      # Get array of points that make up outer linear ring of polygon
      points = e.feature.getGeometry().getAt(0).getArray()
      # Extend bounds for each point
      for point in points
        bounds.extend point
    # If feature is a point, add single point to map bounds
    if e.feature.getGeometry().getType() == "Point"
      bounds.extend e.feature.getGeometry().get()
    # Fit map bounds to added geometry
    map.fitBounds bounds
    # Get water rights property for the added feature
    wrs = e.feature.getProperty "water_rights"
    # Push each water right onto the main array
    for wr in wrs
      water_rights.push wr
    # These 3 functions should only be run once, but can't figure out how to not run them after every feature
    # Get rid of duplicates
    water_rights = _.uniq water_rights, (wr) ->
                      wr.number
    # Sort water rights by number
    water_rights = _.sortBy water_rights, (wr) ->
                      parseInt wr.number.match(/(\d+)$/)[0], 10
    # Clear water rights table before append
    $('#water_rights_table').html ""
    # Add water rights to table
    for wr in water_rights
      context = 
        wr: wr
        date_formatter: date_formatter
      # Append each water right using water_right.jst.eco template
      $('#water_rights_table').append JST['templates/water_right'](context)
        # "<tr><td>#{wr.number}</td><td>#{if wr.priority_date then date_formatter(wr.priority_date) else ""}</td><td>#{if wr.change_application_number then wr.change_application_number else ""}</td><td>#{if wr.proof_due_date then date_formatter(wr.proof_due_date) else ""}</td><td><a href='#{wr.number}'>View</a></td><td>#{if wr.flow_cfs then wr.flow_cfs else ""}</td><td>#{if wr.flow_ac_ft then wr.flow_ac_ft else ""}</td><td>#{if wr.place_of_use then wr.place_of_use else ""}</td><td>#{if wr.comments then wr.comments else ""}</td></tr>"

  #   setLinkListeners()
  #   return


  # map.data.addListener 'click', (event) ->
  #   map.data.revertStyle()
  #   if event.feature.getGeometry().getType() == "Polygon"
  #     map.data.overrideStyle event.feature, fillColor: '#76b5c6', strokeColor: '#6eb3c6'
  #   if event.feature.getGeometry().getType() == "Point"
  #     map.data.overrideStyle event.feature, icon: 'https://cdn1.iconfinder.com/data/icons/Map-Markers-Icons-Demo-PNG/48/Map-Marker-Flag--Azure.png'
  #   clicked_water_rights = event.feature.getProperty "water_rights"
  #   console.log water_rights
  #   $('#water_rights_table').html(
  #     for wr in water_rights
  #       if _.findWhere clicked_water_rights, wr
  #         "<tr class='highlighted'><td>#{wr.number}</td><td>#{date_formatter(wr.priority_date)}</td><td>#{wr.change_application_number}</td><td>#{date_formatter(wr.proof_due_date)}</td><td><a href='#{wr.number}'>View</a></td><td>#{if wr.flow_cfs != null then wr.flow_cfs else ""}</td><td>#{if wr.flow_ac_ft != null then wr.flow_ac_ft else ""}</td><td>#{wr.place_of_use}</td><td>#{if wr.comments != null then wr.comments else ""}</td></tr>"
  #       else
  #         "<tr><td>#{wr.number}</td><td>#{date_formatter(wr.priority_date)}</td><td>#{wr.change_application_number}</td><td>#{date_formatter(wr.proof_due_date)}</td><td><a href='#{wr.number}'>View</a></td><td>#{if wr.flow_cfs != null then wr.flow_cfs else ""}</td><td>#{if wr.flow_ac_ft != null then wr.flow_ac_ft else ""}</td><td>#{wr.place_of_use}</td><td>#{if wr.comments != null then wr.comments else ""}</td></tr>"
  #   )
  #   setLinkListeners()
  #   return

  # $('#user-selector').change (e) ->
  #   map.data.forEach (feature) ->
  #     map.data.remove feature
  #   map.data.loadGeoJson("/get-water-rights-data/#{$(this).val()}.json")
    

