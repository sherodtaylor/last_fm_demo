$(document).ready ->
  $.ajax(
    url: '/morris.json?user=sherodtaylor'
    method: 'get'
    data: 'json'
    success: (data) ->
      Morris.Bar(
        element: 'chart'
        data: data
        xkey: 'name'
        labels: ['playcount']
        ykeys: ['playcount']
      )
  )
