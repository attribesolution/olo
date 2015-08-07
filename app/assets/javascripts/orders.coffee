$ ->
  getNewOrders = ->
    $.ajax(
      type: 'GET'
      url: '/orders/full_screen'
      data: {"lastOrderId" : gon.lastOrderId, "pathname" : window.location.pathname}
      dataType: 'script').success (json) ->
      return
      false
  if gon.autoFetchNewOrders && gon.autoFetchNewOrders == true
    setInterval (->
      getNewOrders()
      return
    ), 5000
