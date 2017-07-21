$(".listings-dashboard, .water_rights_management-dashboard").ready ->
  $('a[data-toggle="tab"]').on 'shown.bs.tab', (e) ->
    $.fn.dataTable.tables(
      visible: true
      api: true).columns.adjust()
    return

  $.fn.responsiveTabs = ->
    @addClass 'responsive-tabs'
    @append $('<span class="glyphicon glyphicon-triangle-bottom"></span>')
    @append $('<span class="glyphicon glyphicon-triangle-top"></span>')
    @on 'click', 'li.active > a, span.glyphicon', (->
      @toggleClass 'open'
      return
    ).bind(this)
    @on 'click', 'li:not(.active) > a', (->
      @removeClass 'open'
      return
    ).bind(this)
    return

  $('.nav.nav-tabs').responsiveTabs()
