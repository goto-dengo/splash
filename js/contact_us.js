(function() {
  var errors;

  $(document).on("submit", "#contact-form", function(e) {
    var email, message, name,
      _this = this;
    e.preventDefault();
    email = $(this).find('input[name=email]').val();
    name = $(this).find('input[name=name]').val();
    message = $(this).find('input[name=message]').val();
    if (!(email && name && message)) {
      return errors();
    }
    $(this).find('button').disable_button();
    return $(this).ajaxSubmit({
      success: function() {
        $(_this).find('button').disable_button();
        $(_this).resetForm();
        $('#contact-us-errors').hide();
        return $('#contact-us-success').fadeIn(300);
      }
    });
  });

  errors = function() {
    $('#contact-us-success').hide();
    return $('#contact-us-errors').fadeIn(300);
  };

}).call(this);