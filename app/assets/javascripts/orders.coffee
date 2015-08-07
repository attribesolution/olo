$ ->
  getNewOrders = ->
    value = {}
    value = {"lastOrderId" : gon.lastOrderId}
    $.ajax(
      type: 'GET'
      url: '/orders/full_screen'
      data: value
      dataType: 'script').success (json) ->
      return
      false
  if gon.fetchNewOrders && gon.fetchNewOrders == true
    setInterval (->
      getNewOrders()
      return
    ), 5000
