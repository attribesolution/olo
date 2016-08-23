# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
############
$ ->
  $(".approve_disapprove_menus").click ->
    id = $(this).attr("id")

    $.post "/menus/approve_disapprove_menus", { id: id }, (data) ->
      if data.status == 200
        $(".approve_menus_" + id).html(data.approved)

  $('#new_menu').validate
    rules:
      "menu[name]":
        required: true
      "menu[price]":
        required: true
      "menu[category_id]":
        required: true

  # updateOutput = (e) ->
  #   list = if e.length then e else $(e.target)
  #   output = list.data('output')
  #   if window.JSON
  #     array = []
  #     i = 0
  #     while i < list.nestable('serialize').length
  #       id = list.nestable('serialize')[i].id
  #       array.push(id)
  #       i++
  #     output.val array
  #     $.post "/menus/menu_sorting", { sorted_ids: array }, (data) ->
  #       console.log(data.message)
  #   else
  #     output.val 'JSON browser support required for this demo.'
  #   return

  # # activate Nestable for list 2
  # $('#nestable2').nestable(group: 1).nestable('collapseAll').on 'change', updateOutput
  # # output initial serialised data
  # updateOutput $('#nestable2').data('output', $('#nestable2-output'))
  # return