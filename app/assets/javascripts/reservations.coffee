$ ->
  getNewReservations = ->
    $.ajax(
      type: 'GET'
      url: '/reservations'
      data: {"lastReservationId" : gon.lastReservationId}
      dataType: 'script').success (json) ->
      return
      false
      
  if gon.autoFetchNewReservations && gon.autoFetchNewReservations == true
    setInterval (->
      getNewReservations()
      return
    ), 5000
