(function() {
  $.fn.extend({
    flash_placeholder: function(text, timeout) {
      return this.each(function() {
        var existingPlaceholder,
          _this = this;
        existingPlaceholder = $(this).attr("placeholder");
        $(this).val("");
        $(this).attr("placeholder", text);
        if (!$(this).data('original-placeholder')) {
          $(this).data("original-placeholder", existingPlaceholder);
        }
        if (timeout) {
          return setTimeout(function() {
            $(_this).attr("placeholder", $(_this).data("original-placeholder"));
            return $(_this).data('original-placeholder', "");
          }, timeout);
        }
      });
    },
    disable_button: function() {
      return this.each(function() {
        if ($(this).attr('disabled')) {
          $(this).removeAttr('disabled');
          return $(this).text($(this).data('original-text'));
        } else {
          $(this).attr('disabled', true);
          $(this).data('original-text', $(this).text());
          return $(this).text($(this).data('disabled-text'));
        }
      });
    }
  });

}).call(this);
