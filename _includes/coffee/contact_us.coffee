$(document).on "submit", "#contact-form", (e) ->
  e.preventDefault()

  email = $(@).find('input[name=email]').val()
  name = $(@).find('input[name=name]').val()
  message = $(@).find('textarea[name=message]').val()

  return errors() unless email && name && message

  $(@).find('button').disable_button()

  $(@).ajaxSubmit
    success: =>
      $(@).find('button').disable_button()
      $(@).resetForm()

      $('#contact-us-errors').hide()
      $('#contact-us-success').fadeIn(300)

errors = ->
  $('#contact-us-success').hide()
  $('#contact-us-errors').fadeIn(300)
