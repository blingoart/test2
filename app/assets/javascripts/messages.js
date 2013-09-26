$(document).ready(function () {
  $(".message").slideDown();
  $(".message .close_button").click(function(){
    $(this).parent().slideUp();
  });
});
