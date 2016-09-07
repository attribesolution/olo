$ ->
  $('#authorization_key').click ->
    $(this).text $('#current_user_api_key').val()
    return
