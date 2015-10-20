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
      url: "/applications/" + $this.data("application_id") + "/edit_modal"
    })
    .done(function(data) {
      $("#application-edit-modal").html(data);
    })
    .fail(function() {
      alert( "error" );
    });
  });

  $(".application-show-modal-trigger").leanModal({
    in_duration: 200,
    out_duration: 200
  }).on("click", function() {
    var $this = $(this);
    var application_id = $this.data("application_id");
    $.ajax({
      method: "GET",
      dataType: 'html',
      url: "/applications/" + application_id + "/show_modal"
    })
    .done(function(data) {
      // have to do this because we can't replace the edit button because
      // it's bound to a js event on document load
      $("#application-show-modal .modal-content").html(data);
      $(".application-edit-modal-trigger").data("application_id", application_id);
      $(".application-delete-modal-trigger").attr("href", "/applications/" + application_id);
    })
    .fail(function() {
      alert( "error" );
    });
  });


  $(".interaction-new-modal-trigger").leanModal({
    in_duration: 200,
    out_duration: 200
  }).on("click", function() {
    var $this = $(this);
    $("#interaction_application_id").val($this.data("application_id"));
  });

  $(".interaction-edit-modal-trigger").leanModal({
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
