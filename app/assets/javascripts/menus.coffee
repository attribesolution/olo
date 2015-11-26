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

  $ ->
  menu_name = $("#menu_name").val()
  menu_price = $("#menu_price").val()
  menu_description = $("#menu_description").val()
  menu_category_id = $("#menu_category_id").val()
  $("#menu_name").keyup ->
    if menu_name is $("#menu_name").val()
      $("#add_button_menus").attr "disabled", true
    else
      $("#add_button_menus").attr "disabled", false


  $("#menu_price").keyup ->
    if menu_price is $("#menu_price").val()
      $("#add_button_menus").attr "disabled", true
    else
      $("#add_button_menus").attr "disabled", false

  $("#menu_description").keyup ->
    if menu_description is $("#menu_description").val()
      $("#add_button_menus").attr "disabled", true
    else
      $("#add_button_menus").attr "disabled", false 

  $("#menu_category_id").click ->
    if menu_category_id is $("#menu_category_id").val()
      $("#add_button_menus").attr "disabled", true
    else
      $("#add_button_menus").attr "disabled", false 

  
