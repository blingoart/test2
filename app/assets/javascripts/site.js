var prelaunch_open = false;

$(document).ready(function() {
  initialize_prelaunch();
})

function initialize_prelaunch() {
  $("#stay-tuned").click (function() {
      set_centered($("#prelaunch"));
      show_prelaunch();
  });
  $("#prelaunch-close").click (function() {
      hide_prelaunch();
  });
}

$(window).resize(function() {
  if (prelaunch_open === true) {
    set_centered($("#prelaunch"));
  }
});

function show_prelaunch(){
  $("body").css({"overflow" : "hidden"});
  $("#overlay").fadeIn(400);
  $("#prelaunch").fadeIn(400);
  $("#email").focus();
  prelaunch_open = true;
}

function hide_prelaunch() {
  $("body").css({"overflow" : "visible"});
  $("#prelaunch").fadeOut(400);
  $("#overlay").fadeOut(400);
  prelaunch_open = false;
}
