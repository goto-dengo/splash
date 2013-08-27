syncFirstPageHeight = ->
  newHeight = Math.min($(window).height(), 700)
  $('#first-page').height newHeight
  $('#what-we-do').css 'margin-top', newHeight

getNavItems = ->
  $('.top-bar-section [data-scroll-to]').map ->
    $(@).data('scroll-to')
  .get()

getListItemForSection = (section) ->
  $("[data-scroll-to=\"#{section}\"]").closest('li')

highlightNavSection = (scrollTop) ->
  return if $('body').data('is-smooth-scrolling')

  halfOfWindowHeight = $(window).height() / 2
  currentSection = undefined

  for i in getNavItems().reverse()
    if ($(i).position().top + halfOfWindowHeight) < scrollTop
      currentSection = i
      break

  if currentSection
    getListItemForSection(currentSection).addClass('active')
                                         .siblings()
                                         .removeClass('active')
  else
    $(".top-bar-section li").removeClass('active')

handleScroll = ->
  scrollTop = $(window).scrollTop()

  $('body')[if scrollTop > 0 then 'addClass' else 'removeClass']('scrolled')

  highlightNavSection(scrollTop)

$ ->
  $(document).foundation()
  syncFirstPageHeight()
  $(window).on 'resize', syncFirstPageHeight
  $(window).on 'scroll', handleScroll
