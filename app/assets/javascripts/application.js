//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require materialize-sprockets

$(document).ready(function() {
  $(".dropdown-button").dropdown();
  $(".board-modal-trigger").leanModal();

  $(".title-board").hover(function() {
    var $this = $(this);
    $this.find("span").show();
  }, function() {
    var $this = $(this);
    $this.find("span").hide();
  });
});

