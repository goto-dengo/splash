$(document).on "submit", ".subscribe-form", (e) ->
  e.preventDefault()
  $input = $(@).find("input[type=text]")
  return unless $input.val()

  $.getJSON "http://dobt.us7.list-manage1.com/subscribe/post-json?u=9f7643525159ed54ae9670c8a"+
            "&amp;id=9b82ed8ef1&c=?&EMAIL=#{$input.val()}", (data) ->
    if data.result == "success"
      $input.flash_placeholder("Thanks!", 2000)
    else
      $input.flash_placeholder((if data.msg.match("already subscribed") then "Already subscribed!" else "Error, please try again."), 2000)

  $input.flash_placeholder("Subscribing...")
  $input.blur()
