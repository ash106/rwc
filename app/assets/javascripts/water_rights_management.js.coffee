$ ->
  mapOptions =
    center: new google.maps.LatLng(40.5999605, -111.747028)
    zoom: 9
    mapTypeId: google.maps.MapTypeId.ROADMAP
  map = new google.maps.Map($("#map_canvas.water_rights")[0], mapOptions)
  bounds = new google.maps.LatLngBounds()

  map.data.loadGeoJson("/get-water-rights-data/#{$('#water_rights_table').data('user')}.json")

  water_rights = []

  date_formatter = (date) ->
    d = date.split("-")[2]
    m = date.split("-")[1]
    y = date.split("-")[0]
    m + "/" + d + "/" + y

  setLinkListeners = ->
    $('td a').click (e) ->
      e.preventDefault()
      map.data.revertStyle()
      clicked_wr_number = $(this).attr "href"
      $('#water_rights_table').html(
        for wr in water_rights
          if wr.number == clicked_wr_number
            "<tr class='highlighted'><td>#{wr.number}</td><td>#{date_formatter(wr.priority_date)}</td><td>#{wr.change_application_number}</td><td>#{date_formatter(wr.proof_due_date)}</td><td><a href='#{wr.number}'>View</a></td><td>#{if wr.flow_cfs != null then wr.flow_cfs else ""}</td><td>#{if wr.flow_ac_ft != null then wr.flow_ac_ft else ""}</td><td>#{wr.place_of_use}</td><td>#{if wr.comments != null then wr.comments else ""}</td></tr>"
          else
            "<tr><td>#{wr.number}</td><td>#{date_formatter(wr.priority_date)}</td><td>#{wr.change_application_number}</td><td>#{date_formatter(wr.proof_due_date)}</td><td><a href='#{wr.number}'>View</a></td><td>#{if wr.flow_cfs != null then wr.flow_cfs else ""}</td><td>#{if wr.flow_ac_ft != null then wr.flow_ac_ft else ""}</td><td>#{wr.place_of_use}</td><td>#{if wr.comments != null then wr.comments else ""}</td></tr>"
      )
      setLinkListeners()
      console.log clicked_wr_number
      selected_bounds = new google.maps.LatLngBounds()
      map.data.forEach (feature) ->
        feature_wrs = feature.getProperty "water_rights"
        for wr in feature_wrs
          if wr.number == clicked_wr_number
            if feature.getGeometry().getType() == "Polygon"
              map.data.overrideStyle feature, fillColor: '#76b5c6', strokeColor: '#6eb3c6'
              points = feature.getGeometry().getAt(0).getArray()
              for point in points
                selected_bounds.extend point
            if feature.getGeometry().getType() == "Point"
              map.data.overrideStyle feature, icon: 'http://www.googlemapsmarkers.com/v1/76b5c6/'
              selected_bounds.extend feature.getGeometry().get()
        map.fitBounds selected_bounds


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
        "<tr><td>#{wr.number}</td><td>#{date_formatter(wr.priority_date)}</td><td>#{wr.change_application_number}</td><td>#{date_formatter(wr.proof_due_date)}</td><td><a href='#{wr.number}'>View</a></td><td>#{if wr.flow_cfs != null then wr.flow_cfs else ""}</td><td>#{if wr.flow_ac_ft != null then wr.flow_ac_ft else ""}</td><td>#{wr.place_of_use}</td><td>#{if wr.comments != null then wr.comments else ""}</td></tr>"
    )
    setLinkListeners()
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
          "<tr class='highlighted'><td>#{wr.number}</td><td>#{date_formatter(wr.priority_date)}</td><td>#{wr.change_application_number}</td><td>#{date_formatter(wr.proof_due_date)}</td><td><a href='#{wr.number}'>View</a></td><td>#{if wr.flow_cfs != null then wr.flow_cfs else ""}</td><td>#{if wr.flow_ac_ft != null then wr.flow_ac_ft else ""}</td><td>#{wr.place_of_use}</td><td>#{if wr.comments != null then wr.comments else ""}</td></tr>"
        else
          "<tr><td>#{wr.number}</td><td>#{date_formatter(wr.priority_date)}</td><td>#{wr.change_application_number}</td><td>#{date_formatter(wr.proof_due_date)}</td><td><a href='#{wr.number}'>View</a></td><td>#{if wr.flow_cfs != null then wr.flow_cfs else ""}</td><td>#{if wr.flow_ac_ft != null then wr.flow_ac_ft else ""}</td><td>#{wr.place_of_use}</td><td>#{if wr.comments != null then wr.comments else ""}</td></tr>"
    )
    setLinkListeners()
    return

  $('#user-selector').change (e) ->
    map.data.forEach (feature) ->
      map.data.remove feature
    map.data.loadGeoJson("/get-water-rights-data/#{$(this).val()}.json")
    

