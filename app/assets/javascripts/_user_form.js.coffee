$ ->
  $('#login-form-link').click (e) ->
    $('#login-form').delay(100).fadeIn 100
    $('#register-form').fadeOut 100
    $('#register-form-link').removeClass 'active'
    $(this).addClass 'active'
    e.preventDefault()
    return
  $('#register-form-link').click (e) ->
    $('#register-form').delay(100).fadeIn 100
    $('#login-form').fadeOut 100
    $('#login-form-link').removeClass 'active'
    $(this).addClass 'active'
    e.preventDefault()
    return
  return
