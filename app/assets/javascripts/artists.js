

$(document).ready(function() {
  var $artistCards = $('.artist_card');

  $('.search form').submit(function(e) {
    e.preventDefault();
  });

  // filtering results
  $('#search').keyup(function() {
    var val = $.trim(this.value).toUpperCase();

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