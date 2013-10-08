

$(document).ready(function() {

  $('.search form, .footer form').submit(function(e) {
    e.preventDefault();
  });

  // filtering results
  $('#search').keyup(function() {
    var val = $.trim(this.value).toUpperCase(),
    $artistCards = $('.artist_card');


    if ( val === '')
      $artistCards.show();

    else {
      $artistCards.hide();
      $artistCards.filter(function() {
        return -1 != $(this).text().toUpperCase().indexOf(val);
      }).show();
    }
  });
});