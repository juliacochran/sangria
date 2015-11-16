
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
    	    var num_stage = ui.item.parent().data('stage_num');
    	    var application_id = ui.item.data('application_id');

    	    console.log(num_stage);
    	    console.log(application_id);

    	    //TODO: update the stage
        },
        connectWith: ".sortable"

        ,placeholder: "ui-state-highlight"

    	//#,items: "li:not(:last-child)"

    }).disableSelection();
});