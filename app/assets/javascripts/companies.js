
var changing = 0;
function inputChanged(e){
	var text = document.getElementById('company_name').value;
	// console.log(document.getElementById('company_list').innerHTML);

	if(isOption(text)){
		return;
	}

	// console.log(changing);

	if(changing == 1) 
		return;
	else
		changing = 1;

	// console.log("searching");

	$.ajax({
	    url: "/search",
	    data: {"q": text},
	    success: function(response) {
	    	if(response["employers"].length > 0){
				//console.log(response);
				//var compname = response["employers"][0]["name"];
				var resplist = response["employers"];
				for (var index = 0; index < resplist.length; index++){
					var emp = resplist[index]["name"];
					if(!isOption(emp)){
						$('#company_list').append('<option value="'+ emp +'">' + emp + '</option>');
					}
				}
	    	}else{
	    		console.log(response);
	    	}
	    	changing = 0;
	    },
	    error: function(xhr) {
	        //Do Something to handle error
	        changing = 0;
	    }
	});	

}



function isOption(text1){
	matchString = text1.toLowerCase();

	var found = false;
	$( "option" ).each(function( index ) {

		var index = $( this ).text().toLowerCase().indexOf(matchString);
		if(index == 0){
			// console.log( "yup:" + index + " " + $( this ).text().toLowerCase() + "," + matchString);
			found = true;
		}else{
			//console.log( "nope:" + index + " " + $( this ).text().toLowerCase() + " " + matchString);
		}
	});

	return found;
}