# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  category_name = $("#category_name").val()
  $("#category_name").keyup ->
  	if category_name is $("#category_name").val()
      $("#add_button").attr "disabled", true
    else
      $("#add_button").attr "disabled", false