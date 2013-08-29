$(document).on "submit", "#contact-form", (e) ->
  e.preventDefault()

  email = $(@).find('input[name=email]').val()
  name = $(@).find('input[name=name]').val()
  message = $(@).find('textarea[name=message]').val()
  verify = $(@).find('input[name=verify]').val()

  unless email && name && message && verify
    return feedback("Please fill out all the fields.")

  $(@).find('button').disable_button()

  $(@).ajaxSubmit
    success: (data) =>
      $(@).find('button').disable_button()
      feedback("Verification failed.")

      if data.status == 'success'
        $(@).resetForm()
        feedback("Thanks for contacting us. We'll be in touch shortly.")

feedback = (msg) ->
  $('#contact-us-feedback').hide().text(msg).fadeIn(300)
