filterPath = (string) ->
  string.replace /\/$/, ""

getTargetOffset = ($el) ->
  $($el.data('scroll-to')).offset().top - 45 # -45 to account for the sticky nav

scrollTo = ($el) ->
  $('body').data('is-smooth-scrolling', true)

  if $el.closest('li')[0]
    $el.closest('li').addClass('active')
                     .siblings()
                     .removeClass('active')

  $('html, body').animate
    scrollTop: getTargetOffset($el)
  , 400, ->
    $('body').removeData 'is-smooth-scrolling'
    $(window).trigger 'scroll'

  if $el.data('scroll-to') == '#contact'
    $('#contact-form :input').first().focus()

  ga('send', 'event', 'scrollTo', 'scrollTo', $el.data('scroll-to'))


$(document).on 'click', '[data-scroll-to]', (e) ->
  $el = $(@)
  e.preventDefault()
  scrollTo($el)
