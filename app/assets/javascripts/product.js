$(document).ready(function () {
  $('.js-tab').click(function() {
    $('.js-tab').parent().parent().find('.is-active').removeClass('is-active');
    $(this).addClass('is-active');
  });
});
