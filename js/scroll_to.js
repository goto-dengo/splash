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
    $('body').animate({
      scrollTop: getTargetOffset($el)
    }, 400, function() {
      $('body').removeData('is-smooth-scrolling');
      return $(window).trigger('scroll');
    });
    if ($el.data('scroll-to') === '#contact') {
      return $('#contact-form :input').first().focus();
    }
  };

  $(document).on('click', '[data-scroll-to]', function(e) {
    var $el;
    $el = $(this);
    e.preventDefault();
    return scrollTo($el);
  });

}).call(this);
