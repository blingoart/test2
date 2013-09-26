// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

jQuery.fn.doesExist = function() {
  return jQuery(this).length > 0;
};

function set_centered(obj) {
  var h_start = (($(window).width() - obj.width()) / 2) + $(window).scrollLeft();
  var v_start = (($(window).height() - obj.height()) / 2) + $(window).scrollTop();
  obj.css({top: v_start, left:h_start});
}

function truncate_string(str, max_length, trailer) {
  return str.substring(0, max_length) + trailer;
}

