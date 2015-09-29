//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require materialize-sprockets

$(document).ready(function() {
  $(".dropdown-button").dropdown();
  $(".board-change-modal-trigger").leanModal({
    in_duration: 200,
    out_duration: 200
  });
  $(".board-new-modal-trigger").leanModal({
    in_duration: 200,
    out_duration: 200
  });
});
