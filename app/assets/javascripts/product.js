$(document).ready(function () {
  $('.js-tab').click(function() {
    console.log(1);
    $('.js-tab').parent().parent().find('.is-active').removeClass('is-active');
    $(this).addClass('is-active');
  });
});
