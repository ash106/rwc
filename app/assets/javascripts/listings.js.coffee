$(".listings-buy_sell").ready ->
  # Basic map options object
  mapOptions =
    center: new google.maps.LatLng(40.5999605, -111.747028)
    zoom: 9
    mapTypeId: google.maps.MapTypeId.ROADMAP

  # Create map
  map = new google.maps.Map($("#map_canvas.listings")[0], mapOptions)

  # Geometry style settings
  polygon_fill_color = '#76b5c6'
  # polygon_stroke_color = '#6eb3c6'

  # Load GeoJSON listings data
  map.data.loadGeoJson('/get-listings-data.json')

  # Called when an area on the map is clicked
  map.data.addListener 'click', (e) ->
    # Reset styling for map features 
    map.data.revertStyle()
    # Set styling for clicked feature
    map.data.overrideStyle e.feature, fillColor: polygon_fill_color#, strokeColor: polygon_stroke_color
    # Set listing_title to clicked feature's name
    $('#listing_title').html "#{e.feature.getProperty "name"} Listings"
    # Set area_policy to clicked feature's policy
    $('#area_policy').html e.feature.getProperty "policy"
    # Get wanteds and for_sales for clicked feature
    wanteds = e.feature.getProperty "wanteds"
    for_sales = e.feature.getProperty "for_sales"
    # Clear wanted div before appending new wanteds
    $('#wanted').html ""
    # If any wanteds, append them to wanted div
    if wanteds.length > 0
      for wanted in wanteds
        $('#wanted').append JST['templates/wanted'](wanted: wanted)
    # Otherwise print generic message
    else
      $('#wanted').append "<div><h5>No wanted listings for this area.</h5></div>"
    # Clear for_sale div before appending new for_sales
    $('#for_sale').html ""
    # If any for_sales, append them to for_sale div
    if for_sales.length > 0
      for for_sale in for_sales
        $('#for_sale').append JST['templates/for_sale'](for_sale: for_sale)
    # Otherwise print generic message
    else
      $('#for_sale').html "<div><h5>No for sale listings for this area.</h5></div>"


$(".listings-dashboard").ready ->
  $('#listing-areas-table').DataTable
    pagingType: 'simple_numbers',
    responsive: true,
    dom: "<'row'<'col-sm-6 hidden-xs'l><'col-sm-6'f>>" +
         "<'row'<'col-sm-12'tr>>" +
         "<'row'<'col-sm-5'i><'col-sm-7'p>>",
    columnDefs: [
      { orderable: false, targets: [2,3,4,5] },
      { responsivePriority: 1, targets: [0,2] }, # Name, Preview Map
      { responsivePriority: 2, targets: [4] }    # Edit
    ],
    language: {
      search: "_INPUT_",
      searchPlaceholder: "Search..."
    }
  $('#wanteds-table').DataTable
    pagingType: 'simple_numbers',
    responsive: true,
    dom: "<'row'<'col-sm-6 hidden-xs'l><'col-sm-6'f>>" +
         "<'row'<'col-sm-12'tr>>" +
         "<'row'<'col-sm-5'i><'col-sm-7'p>>",
    columnDefs: [
      { orderable: false, targets: [5,6,7] },
      { responsivePriority: 1, targets: [0] }, # Description
      { responsivePriority: 2, targets: [4] }  # Listing area
    ],
    language: {
      search: "_INPUT_",
      searchPlaceholder: "Search..."
    }
  $('#for-sales-table').DataTable
    pagingType: 'simple_numbers',
    responsive: true,
    dom: "<'row'<'col-sm-6 hidden-xs'l><'col-sm-6'f>>" +
         "<'row'<'col-sm-12'tr>>" +
         "<'row'<'col-sm-5'i><'col-sm-7'p>>",
    columnDefs: [
      { orderable: false, targets: [6,7,8] },
      { responsivePriority: 1, targets: [0] }, # Description
      { responsivePriority: 2, targets: [5] }, # Listing Area
      { responsivePriority: 3, targets: [3] }  # Price
    ],
    language: {
      search: "_INPUT_",
      searchPlaceholder: "Search..."
    }
