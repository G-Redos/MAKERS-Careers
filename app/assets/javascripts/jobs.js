(function($) {
  $(function() {
    $('a.apply-button').on('ajax:success', function(data) {
      $(this).text('Interested');
    });
  });
})(jQuery);
