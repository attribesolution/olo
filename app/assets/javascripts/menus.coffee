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
