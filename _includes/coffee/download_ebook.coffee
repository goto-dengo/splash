$(document).on 'submit', '.download-ebook-form', (e) ->
  e.preventDefault()

  downloadUrl = $('.gh-link').attr('href')
  email = $(@).find('input').val()

  ga('send', 'event', 'Download ebook', 'clicked')

  $.getJSON "http://dobt.us7.list-manage1.com/subscribe/post-json?u=9f7643525159ed54ae9670c8a"+
            "&amp;id=9b82ed8ef1&c=?&EMAIL=#{email}", =>

    $(@).hide()
    $(".download-ebook-link").show()
    window.location = downloadUrl