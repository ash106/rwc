$(".listings-dashboard, .water_rights_management-dashboard").ready ->
  $('a[data-toggle="tab"]').on 'shown.bs.tab', (e) ->
    $.fn.dataTable.tables(
      visible: true
      api: true).columns.adjust()
    return
