$(document).ready(function() {
  initialize_file_upload_hover("onboarding_image_file_name", "choose-file-button");
  initialize_file_upload_hover("onboarding_artist_photo", "choose-photo-button");
//  initialize_bio_upload_hover();
  initialize_password_entry();
  initialize_file_image_hover();
  initialize_license_text();
  check_for_flash_message();
});

var is_ie = navigator.userAgent.indexOf("MSIE") != -1;

function initialize_file_upload_hover(real_button_obj, visible_button_obj) {
  var real_button_obj = real_button_obj;
  var visible_button_obj = visible_button_obj;
  var real_button_obj = $("#" + real_button_obj);
  var visible_button_obj = $("#" + visible_button_obj);

  if (real_button_obj.doesExist()) {
    real_button_obj.mouseover (function() {
      visible_button_obj.toggleClass("button-hover");
    });
    real_button_obj.mouseout (function(e) {
      visible_button_obj.toggleClass("button-hover");
      show_file_names(e.target.id);
    });
    real_button_obj.click (function(e) {
      start_fix_for_showing_file_upload(e.target.id);
    });
  }
}

function initialize_password_entry() {
  if ($("#password").doesExist()) {
    $("#password").focus();
  }
}

function initialize_file_image_hover() {
  if ($(".onboarding-image").doesExist()) {
    $(".onboarding-image").mouseover (function() {
      $(this).parent().parent().find('.onboarding-image-hover-container').show();
    });
    $(".onboarding-image").mouseout (function() {
      $(this).parent().parent().find('.onboarding-image-hover-container').hide();
    });
  }
  if ($(".onboarding-image-hover-container").doesExist()) {
    $(".onboarding-image-hover-container").mouseover (function() {
      $(this).parent().find('.onboarding-image').toggleClass("onboarding-image-hover");
      $(this).show();
    });
    $(".onboarding-image-hover-container").mouseout (function() {
      $(this).parent().find('.onboarding-image').toggleClass("onboarding-image-hover");
      $(this).hide();
    });
  }
}

function initialize_close_button() {
  if ($(".onboarding-close").doesExist()) {
    $(".onboarding-close").click (function() {
      window.location.href = close_path;
    });
  }
}

var license_contracted_height = "";
function initialize_license_text() {
  if ($("#license-read-more").doesExist()) {
    $("#license-read-more").click(function() {
      license_contracted_height = $("#license").height() + "px";
      license_expanded_height = $(".legal-container").height() + "px";
      $("#license").animate({height: license_expanded_height}, 1500, function() {
        $("#license").css("height", "auto");
        $("#license").css("overflow", "visible");
        $("#license-read-more").hide();
        $("#license-read-less").fadeIn("fast");
      });
    });
  }
  if ($("#license-read-less").doesExist()) {
    $("#license-read-less").click(function() {
      $("#license").animate({height: license_contracted_height}, 1500, function() {
        $("#license").css("overflow", "hidden");
        $("#license-read-less").hide();
        $("#license-read-more").fadeIn("fast");
      });
    });
  }
}

function check_for_flash_message() {
  if ($(".message").doesExist()) {
    setTimeout('$(".message").slideUp(400)', 3000);
  }
}

function show_file_names(file_list_id) {
  var file_list_id = file_list_id;
  var file_list_obj = $("#" + file_list_id);
  var show_files_id = $("body").find(".show-file-names").attr("id");
  var show_files_obj = $("#" + show_files_id);
  var file_list_display = "";
//  console.log(show_files_obj.width());
  var trim_string = false;
  if (show_files_obj.width() < 300) {
    trim_string = true;
    max_length = 20;
    trailer = "...";
  }
  if (is_ie) {
    var file_list = file_list_obj.val();
    file_list_display = file_list.split('\\').pop();
    if (trim_string && file_list_display.length > max_length) {
      file_list_display = truncate_string(file_list_display, max_length, trailer);
    }
  }
  else {
    var file_list = $("#" + file_list_id).get(0).files || [];
    var file_list_length = file_list.length;
    for (var i = 0; i < file_list_length; i++) {
      if (trim_string && file_list[i].name.length > max_length) {
        file_list_name = truncate_string(file_list[i].name, max_length, trailer);
      }
      else {
        file_list_name = file_list[i].name;
      }
      if (file_list_display != "") {
        file_list_display = file_list_display + "<br />" + file_list_name;
      }
      else {
        file_list_display = file_list_name;
      }
    }
  }
  if (file_list_display != "") {
    show_files_obj.html(file_list_display);
    show_files_obj.css("display", "inline-block");
  }
  else {
    show_files_obj.html("");
    show_files_obj.css("display", "none");
  }
}

var show_upload_timer = null;
var show_upload_count = 0;
function start_fix_for_showing_file_upload(file_list_id) {
  var file_list_id = file_list_id;
  if (show_upload_timer != null) clearTimeout(show_upload_timer);
  show_file_names(file_list_id);
  // run for 5 minutes (30 per minute (at 2 second intervals) x 5 minutes = 150)
  if (show_upload_count <= 150) {
    show_upload_timer = setTimeout(function() {
      start_fix_for_showing_file_upload(file_list_id)
    }, 2000);
    show_upload_count += 1;
  }
  else {
    show_upload_count = 0;
  }
}