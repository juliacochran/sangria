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
    $("#application-new-modal-title").text($this.data("stage"));
    $("#application_stage").val($this.data("stage_num"));
  });

  $(".application-edit-modal-trigger").leanModal({
    in_duration: 200,
    out_duration: 200
  }).on("click", function(e) {
    var $this = $(this);
    $.ajax({
      method: "GET",
      url: "/applications/" + $this.data("application_id") + ".json"
    })
    .done(function(data) {
      // pretty hacky obviously but it works for now
      $("#application-edit-modal-title").text(data.company_id);
      $("#application_edit #application_application_id").val(data.id);
      $("#application_edit #application_board_id").val(data.board_id);
      $("#application_edit #application_stage").val(data.stage);
      $("#application_edit #application_applied_date").val(data.applied_date);
      $("#application_edit #application_company_id").val(data.company_id);
      $("#application_edit #application_job_id").val(data.job_id);
      $("#application_edit #application_category").val(data.category);
      $("#application_edit #application_settings").val(data.settings);
      $("#application_edit").attr("action", "/applications/" + data.id);
      console.log(data)
    })
    .fail(function() {
      alert( "error" );
    });
  });

  $(".interaction-edit-modal-trigger").leanModal({
    in_duration: 200,
    out_duration: 200
  }).on("click", function() {
    var $this = $(this);
    $("#interaction_application_id").val($this.data("application_id"));
  });
  $(".interaction-new-modal-trigger").leanModal({
    in_duration: 200,
    out_duration: 200
  }).on("click", function() {
    var $this = $(this);
    $("#interaction_application_id").val($this.data("application_id"));
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
