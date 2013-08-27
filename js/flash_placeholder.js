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
    }
  });

}).call(this);
