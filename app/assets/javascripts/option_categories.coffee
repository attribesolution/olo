# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
	$('#new_option_category').validate
    rules:
      "option_category[menu_id]":
        required: true
      "option_category[name]":
        required: true