//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require materialize-sprockets
var stage_num = 0;

var init_selects = function($this) {
  var $selects = $this.find(".materialize-select");
  $selects.material_select();
  $selects.find("option:first").attr("disabled", "true");
};

$(document).ready(function() {

  init_selects($(".content"));

	$(".dropdown-button").dropdown();

  $(".application-new-modal-trigger").leanModal({
    in_duration: 200,
    out_duration: 200
  }).on("click", function() {
    var $this = $(this);
    $("#application-new-modal-title").text($this.data("stage"));
    $("#application_stage").val($this.data("stage_num"));

    $("#application-new-modal .datepicker").pickadate({
      selectMonths: true, // Creates a dropdown to control month
      selectYears: 15, // Creates a dropdown of 15 years to control year
      container: "body"
    });
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
      var $modal = $("#application-edit-modal");
      $modal.html(data);

      $modal.find(".datepicker").pickadate({
        selectMonths: true, // Creates a dropdown to control month
        selectYears: 15, // Creates a dropdown of 15 years to control year
        container: "body"
      });
      init_selects($modal);
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
      dataType: "html",
      url: "/applications/" + application_id + "/show_modal"
    })
    .done(function(data) {
      // have to do this because we can't replace the edit button because
      // it's bound to a js event on document load
      $("#application-show-modal .modal-content").html(data);
      $(".application-edit-modal-trigger").data("application_id", application_id);
      $(".application-delete-modal-trigger").attr("href", "/applications/" + application_id);

      $("#application-show-modal .datepicker").pickadate({
        selectMonths: true, // Creates a dropdown to control month
        selectYears: 15, // Creates a dropdown of 15 years to control year
        container: "body"
      });
    })
    .fail(function() {
      alert( "error" );
    });
  });


  $(".interaction-show-modal-trigger").leanModal({
    in_duration: 200,
    out_duration: 200
  }).on("click", function() {
    var $this = $(this);
    var interaction_id = $this.data("interaction_id");
    $.ajax({
      method: "GET",
      dataType: "html",
      url: "/interactions/" + interaction_id + "/show_modal"
    })
    .done(function(data) {
      // have to do this because we can't replace the edit button because
      // it's bound to a js event on document load
      $("#interaction-show-modal .modal-content").html(data);
      $(".interaction-edit-modal-trigger").data("interaction_id", interaction_id);
      $(".interaction-delete-modal-trigger").attr("href", "/interactions/" + interaction_id);

      $("#interaction-show-modal .datepicker").pickadate({
        selectMonths: true, // Creates a dropdown to control month
        selectYears: 15, // Creates a dropdown of 15 years to control year
        container: "body"
      });
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

    $("#interaction-new-modal .datepicker").pickadate({
      selectMonths: true, // Creates a dropdown to control month
      selectYears: 15, // Creates a dropdown of 15 years to control year
      container: "body"
    });
  });

  $(".interaction-new-contact-trigger").on("click", function() {
    $(".interaction-new-contact").show();
    $(".interaction-existing-contact").hide();
  });

  $(".interaction-existing-contact-trigger").on("click", function() {
    $(".interaction-new-contact").hide();
    $(".interaction-existing-contact").show();
  });

  $(".interaction-edit-modal-trigger").leanModal({
    in_duration: 200,
    out_duration: 200
  }).on("click", function(e) {
    var $this = $(this);
    $.ajax({
      method: "GET",
      url: "/interactions/" + $this.data("interaction_id") + "/edit_modal"
    })
    .done(function(data) {
      var $modal = $("#interaction-edit-modal");
      $modal.html(data);

      $modal.find(".datepicker").pickadate({
        selectMonths: true, // Creates a dropdown to control month
        selectYears: 15, // Creates a dropdown of 15 years to control year
        container: "body"
      });
      init_selects($modal);
    })
    .fail(function() {
      alert( "error" );
    });
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


$('.button').click(function(){
            $('.animate').toggleClass('slide');
            });