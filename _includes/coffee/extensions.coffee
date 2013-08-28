$.fn.extend
  flash_placeholder: (text, timeout) ->
    return @each ->
      existingPlaceholder = $(@).attr("placeholder")
      $(@).val("")
      $(@).attr("placeholder", text)

      if !$(@).data('original-placeholder')
        $(@).data("original-placeholder", existingPlaceholder)

      if timeout
        setTimeout =>
          $(@).attr("placeholder", $(@).data("original-placeholder"))
          $(@).data('original-placeholder', "")
        , timeout

  disable_button: ->
    return @each ->
      if $(@).attr('disabled')
        $(@).removeAttr('disabled')
        $(@).text($(@).data('original-text'))

      else
        $(@).attr('disabled', true)
        $(@).data('original-text', $(@).text())
        $(@).text($(@).data('disabled-text'))
