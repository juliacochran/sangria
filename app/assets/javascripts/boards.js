/* js for the draggable cards */
$(function() {
    var oldList, newList, item;
    $('.sortable').sortable({
        start: function(event, ui) {
            item = ui.item;
        },
        stop: function(event, ui) {
            //alert("Moved " + item.text() + " from " + oldList.attr('id') + " to " + newList.attr('id'));
        },
        change: function(event, ui) {
            if(ui.sender) newList = ui.placeholder.parent().parent();

        },
        update: function(event, ui){
    	    var stage = ui.item.parent().data('stage_num');
    	    var application_id = ui.item.data('application_id');

            /* even though the server thinks it failed, it succeeds and updates
             * with the new stage correctly */
            $.ajax({
                method: "PATCH",
                url: "/applications/" + application_id,
                data: {
                    id: application_id,
                    application : { stage: stage },
                    company: {}
                }
            });
        },
        connectWith: ".sortable"

        ,placeholder: "ui-state-highlight"

    }).disableSelection();
});

/* initialize the draggable cards */
$(".drag").mousedown(function() {
    $(this).toggleClass("z-depth-4");
}).mouseup(function() {
    $(this).toggleClass("z-depth-4");
});
