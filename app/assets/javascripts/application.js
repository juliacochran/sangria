//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require materialize-sprockets
var stage_num = 0;
$(document).ready(function() {
	$(".dropdown-button").dropdown();
	$(".application-new-modal-trigger").leanModal({
    in_duration: 200,
    out_duration: 200
  }).on("click", function() {
    var $this = $(this);
    $("#application-stage-modal-title").text($this.data("stage"));
    $("#application_stage").val($this.data("stage_num"));
  });
  $(".interaction-new-modal-trigger").leanModal({
    in_duration: 200,
    out_duration: 200
  });
	$(".board-change-modal-trigger").leanModal({
		in_duration: 200,
		out_duration: 200
	});
	$(".board-new-modal-trigger").leanModal({
		in_duration: 200,
		out_duration: 200
	});
});
