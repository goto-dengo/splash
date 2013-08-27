(function() {
  $(document).on("submit", ".subscribe-form", function(e) {
    var $input;
    e.preventDefault();
    $input = $(this).find("input[type=text]");
    if (!$input.val()) {
      return;
    }
    $.getJSON("http://dobt.us7.list-manage1.com/subscribe/post-json?u=9f7643525159ed54ae9670c8a" + ("&amp;id=9b82ed8ef1&c=?&EMAIL=" + ($input.val())), function(data) {
      if (data.result === "success") {
        return $input.flash_placeholder("Thanks!", 2000);
      } else {
        return $input.flash_placeholder((data.msg.match("already subscribed") ? "Already subscribed!" : "Error, please try again."), 2000);
      }
    });
    $input.flash_placeholder("Subscribing...");
    return $input.blur();
  });

}).call(this);
