
$(function() {
    var oldList, newList, item;
    $('.sortable').sortable({
        start: function(event, ui) {
            item = ui.item;
	        //console.log(newList);
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

    	    console.log(stage);
    	    console.log(application_id);

            $.ajax({
                method: "PATCH",
                url: "/applications/" + application_id,
                data: {
                    id: application_id,
                    application : { stage: stage },
                    company: {}
                }
            });

    	    //TODO: update the stage
        },
        connectWith: ".sortable"

        ,placeholder: "ui-state-highlight"

    	//#,items: "li:not(:last-child)"

    }).disableSelection();
});

$('.drag').mousedown(function(){
    $(this).toggleClass("z-depth-4");
}).mouseup(function(){
    $(this).toggleClass("z-depth-4");
});