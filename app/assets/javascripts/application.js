//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require materialize-sprockets

$(document).ready(function() {
	$(".dropdown-button").dropdown();
	$(".board-modal-trigger").leanModal();
	$(".modal-trigger").leanModal();
	$(".title-board").hover(function() {
		var $this = $(this);
		$this.find("span").show();
	}, function() {
		var $this = $(this);
		$this.find("span").hide();
		$(".board-change-modal-trigger").leanModal({
			in_duration: 200,
			out_duration: 200
		});
		$(".board-new-modal-trigger").leanModal({
			in_duration: 200,
			out_duration: 200
		});
	});
});
