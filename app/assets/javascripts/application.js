//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require turbolinks
//= require_tree .
//= require materialize-sprockets

/* datepicker stuff: http://amsul.ca/pickadate.js/date/ */

var init_selects = function($this) {
  var $selects = $this.find(".materialize-select");
  $selects.material_select();
  $selects.find("option:first").attr("disabled", "true");
};

$(document).ready(function() {

  prepInteractionModalTriggers();

  init_selects($(".content"));

	$(".dropdown-button").dropdown();
  $(".button-collapse").sideNav({
    edge: 'right', // Choose the horizontal origin
  });

  $(".application-new-modal-trigger").leanModal({
    in_duration: 200,
    out_duration: 200
  }).on("click", function() {
    var $this = $(this);
    $.ajax({
      method: "GET",
      url: "/applications/new_modal",
      data: { stage: $this.data("stage_num"), board_id: $this.data("board_id") }
    })
    .done(function(data) {
      var $modal = $("#application-new-modal");
      $modal.html(data);
      $("#datepicker_container").html("");

      $modal.find(".datepicker").pickadate({
        format: 'mmmm d, yyyy',
        container: "#datepicker_container"
      });
      init_selects($modal);
    })
    .fail(function() {
      alert("Failed to load New Application Modal");
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
      $("#datepicker_container").html("");

      $modal.find(".datepicker").pickadate({
        format: 'mmmm d, yyyy',
        container: "#datepicker_container"
      });
      init_selects($modal);
    })
    .fail(function() {
      alert("Failed to load Edit Application Modal");
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
      prepInteractionModalTriggers();
    })
    .fail(function() {
      alert("Failed to load Show Application Modal");
    });
  });




  /**
   * All of this runs on document ready (page load basically) and binds all of these
   * listeners then, so when we replace html with ajax we have to rebind our listeners
   */
  function prepInteractionModalTriggers() {
    $(".interaction-new-modal-trigger").leanModal({
      in_duration: 200,
      out_duration: 200
    }).on("click", function() {
      var $this = $(this);
      $.ajax({
        method: "GET",
        url: "/interactions/new_modal",
        data: { application_id: $this.data("application_id") }
      })
      .done(function(data) {
        var $modal = $("#interaction-new-modal");
        $modal.html(data);
        $("#datepicker_container").html("");

        $modal.find(".datepicker").pickadate({
          format: 'mmmm d, yyyy',
          container: "#datepicker_container"
        });
        init_selects($modal);

        $(".interaction-new-contact-trigger").on("click", function() {
          $(".interaction-new-contact").show();
          $(".interaction-existing-contact").hide();
        });

        $(".interaction-existing-contact-trigger").on("click", function() {
          $(".interaction-new-contact").hide();
          $(".interaction-existing-contact").show();
        });

        $(".interaction-new-company-trigger").on("click", function() {
          $(".interaction-new-company").show();
          $(".interaction-existing-company").hide();
        });

        $(".interaction-existing-company-trigger").on("click", function() {
          $(".interaction-new-company").hide();
          $(".interaction-existing-company").show();
        });
      })
      .fail(function() {
        alert("Failed to load New Interaction Modal");
      });
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
        $("#datepicker_container").html("");

        $modal.find(".datepicker").pickadate({
          format: 'mmmm d, yyyy',
          container: "#datepicker_container"
        });
        init_selects($modal);

        $(".interaction-new-contact-trigger").on("click", function() {
          $(".interaction-new-contact").show();
          $(".interaction-existing-contact").hide();
        });

        $(".interaction-existing-contact-trigger").on("click", function() {
          $(".interaction-new-contact").hide();
          $(".interaction-existing-contact").show();
        });

        $(".interaction-new-company-trigger").on("click", function() {
          $(".interaction-new-company").show();
          $(".interaction-existing-company").hide();
        });

        $(".interaction-existing-company-trigger").on("click", function() {
          $(".interaction-new-company").hide();
          $(".interaction-existing-company").show();
        });
      })
      .fail(function() {
        alert("Failed to load Edit Interaction Modal");
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
        prepContactModalTriggers();
      })
      .fail(function() {
        alert("Failed to load Show Interaction Modal");
      });
    });
  }


  function prepContactModalTriggers() {
    $(".contact-new-modal-trigger").leanModal({
      in_duration: 200,
      out_duration: 200
    }).on("click", function() {
      $(".interaction-edit-modal-trigger").click();
    });

    $(".contact-edit-modal-trigger").leanModal({
      in_duration: 200,
      out_duration: 200
    }).on("click", function(e) {
      $(".interaction-edit-modal-trigger").click();
    });
  }



	$(".board-change-modal-trigger").leanModal({
		in_duration: 200,
		out_duration: 200
	});

	$(".board-new-modal-trigger").leanModal({
		in_duration: 200,
		out_duration: 200
	}).on("click", function() {
    var $this = $(this);
    $.ajax({
      method: "GET",
      url: "/boards/new_modal"
    })
    .done(function(data) {
      var $modal = $("#board-new-modal");
      $modal.html(data);
    })
    .fail(function() {
      alert("Failed to load New Board Modal");
    });
  });

  $(".note-new-modal-trigger").leanModal({
    in_duration: 200,
    out_duration: 200
  }).on("click", function() {
    var $this = $(this);
    $.ajax({
      method: "GET",
      url: "/notes/new_modal",
      data: { board_id: $this.data("board_id") }
    })
    .done(function(data) {
      var $modal = $("#note-new-modal");
      $modal.html(data);
      $("#datepicker_container").html("");

      $modal.find(".datepicker").pickadate({
        format: 'mmmm d, yyyy',
        container: "#datepicker_container"
      });
      init_selects($modal);
    })
    .fail(function() {
      alert("Failed to load New Note Modal");
    });
  });

  $(".note-edit-modal-trigger").leanModal({
    in_duration: 200,
    out_duration: 200
  }).on("click", function(e) {
    var $this = $(this);
    $.ajax({
      method: "GET",
      url: "/notes/" + $this.data("note_id") + "/edit_modal"
    })
    .done(function(data) {
      var $modal = $("#note-edit-modal");
      $modal.html(data);
      $("#datepicker_container").html("");

      $modal.find(".datepicker").pickadate({
        format: 'mmmm d, yyyy',
        container: "#datepicker_container"
      });
    })
    .fail(function() {
      alert("Failed to load Edit Note Modal");
    });
  });


});
