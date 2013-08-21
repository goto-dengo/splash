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

  $('body').animate
    scrollTop: getTargetOffset($el)
  , 400, ->
    $('body').removeData 'is-smooth-scrolling'
    $(window).trigger 'scroll'

$(document).on 'click', '[data-scroll-to]', (e) ->
  $el = $(@)
  e.preventDefault()
  scrollTo($el)
