# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $(".approve_disapprove").click ->
    id = $(this).attr("id")

    $.post "/control_panel/users/approve_disapprove", { id: id }, (data) ->
      if data.status == 200
        $(".approve_menus" + id).html(data.approved)