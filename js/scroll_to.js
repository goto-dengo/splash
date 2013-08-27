(function() {
  var filterPath, getTargetOffset, scrollTo;

  filterPath = function(string) {
    return string.replace(/\/$/, "");
  };

  getTargetOffset = function($el) {
    return $($el.data('scroll-to')).offset().top - 45;
  };

  scrollTo = function($el) {
    $('body').data('is-smooth-scrolling', true);
    if ($el.closest('li')[0]) {
      $el.closest('li').addClass('active').siblings().removeClass('active');
    }
    $('html, body').animate({
      scrollTop: getTargetOffset($el)
    }, 400, function() {
      $('body').removeData('is-smooth-scrolling');
      return $(window).trigger('scroll');
    });
    if ($el.data('scroll-to') === '#contact') {
      $('#contact-form :input').first().focus();
    }
    return ga('send', 'event', 'scrollTo', 'scrollTo', $el.data('scroll-to'));
  };

  $(document).on('click', '[data-scroll-to]', function(e) {
    var $el;
    $el = $(this);
    e.preventDefault();
    return scrollTo($el);
  });

}).call(this);
