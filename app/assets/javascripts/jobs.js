(function($) {
  $(function() {
    $('a.apply-button').on('ajax:success', function(data) {
      $(this).replaceWith('Interested');
    });
  });
})(jQuery);
