# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$('#new_menu_option').validate
    rules:
      "menu_option[name]":
        required: true
      "menu_option[price]":
        required: true
      "menu_option[option_category_id]":
        required: true