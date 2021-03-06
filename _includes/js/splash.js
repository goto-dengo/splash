// Generated by CoffeeScript 1.6.2
(function() {
  var getListItemForSection, getNavItems, handleScroll, highlightNavSection, syncFirstPageHeight;

  syncFirstPageHeight = function() {
    var newHeight;

    newHeight = Math.min($(window).height(), 700);
    $('#first-page').height(newHeight);
    return $('#what-we-do').css('margin-top', newHeight);
  };

  getNavItems = function() {
    return $('.top-bar-section [data-scroll-to]').map(function() {
      return $(this).data('scroll-to');
    }).get();
  };

  getListItemForSection = function(section) {
    return $("[data-scroll-to=\"" + section + "\"]").closest('li');
  };

  highlightNavSection = function(scrollTop) {
    var currentSection, halfOfWindowHeight, i, _i, _len, _ref;

    if ($('body').data('is-smooth-scrolling')) {
      return;
    }
    halfOfWindowHeight = $(window).height() / 2;
    currentSection = void 0;
    _ref = getNavItems().reverse();
    for (_i = 0, _len = _ref.length; _i < _len; _i++) {
      i = _ref[_i];
      if (($(i).position().top + halfOfWindowHeight) < scrollTop) {
        currentSection = i;
        break;
      }
    }
    if (currentSection) {
      return getListItemForSection(currentSection).addClass('active').siblings().removeClass('active');
    } else {
      return $(".top-bar-section li").removeClass('active');
    }
  };

  handleScroll = function() {
    var scrollTop;

    scrollTop = $(window).scrollTop();
    $('body')[scrollTop > 0 ? 'addClass' : 'removeClass']('scrolled');
    return highlightNavSection(scrollTop);
  };

  $(function() {
    if (!$('#first-page')[0]) {
      return;
    }
    syncFirstPageHeight();
    $(window).on('resize', syncFirstPageHeight);
    $(window).on('scroll', handleScroll);
    return $.scrollDepth({
      elements: ['#first-page', '#what-we-do', '#our-apps', '#our-services', '#team', '#press', '#contact']
    });
  });

}).call(this);
