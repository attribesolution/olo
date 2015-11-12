# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
######
$ ->
  $(".approve_disapprove_menus").click ->
    id = $(this).attr("id")

    $.post "/menus/approve_disapprove_menus", { id: id }, (data) ->
      if data.status == 200
        $(".approve_menus_" + id).html(data.approved)######
$ ->
  $(".add_dirty_menus").click ->
    id = $(this).attr("id")

    $.post "/menus/add_dirty_menus", { id: id }, (data) ->
      if data.status == 200
        $(".dirty_menus_" + id).html(data.dirty)