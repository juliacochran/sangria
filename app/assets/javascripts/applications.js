


//TODO: change the cancell logic. since new data could be matching but not


//make the emp_list the array of all companies
var GD_USER_ID = 0;
var comp_list = null;
var icTO = null;
var changing = 0;

function inputChanged(form_class, input_id) {
	if (icTO == null) {
		clearTimeout(icTO);
		icTO = window.setTimeout(function() {
			icTO = null;
			updateList(form_class, input_id);
		}, 200);
	} else {
	}
}

function updateList(form_class, input_id) {
	var text = $('.' + form_class + ' #' + input_id).val();

	if (isOption(text)) {
		updateInfo(text, form_class);
		return;
	}

	if (changing == 1) {
		inputChanged(form_class, input_id);
		return;
	} else {
		changing = 1;
	}

	$.ajax({
	    url: "/search",
	    data: {"q": text},
	    success: function(response) {
	    	if (response["employers"].length > 0) {
					//the employee list
					var emp_list = response["employers"];

					addCompanies(emp_list, true, form_class);

	    	} else {
	    		//found no employers
	    	}
	    	changing = 0;
	    },
	    error: function(xhr) {
	        //Do Something to handle error
	        changing = 0;
	    }
	});
}


function updateInfo(text, form_class) {
	if (comp_list == null) return;
	//commented out
	for (index in comp_list) {
		var comp = comp_list[index];
		var comp_name = comp["name"];
		if (compStr(text, comp_name)) {


			var $form = $('.' + form_class).first();
			var model = form_class.split('_')[1];

			$form.find('#' + model + '_company_id').val(getCompanyId(comp));
			$form.find('#company_logo_img').css("display", "").attr('src', comp["logo"]);
			$form.find('#company_logo').val(comp["logo"]);
			$form.find('#company_location').val(comp["location"]);
			$form.find('#company_website').val(comp["website"]);
			$form.find('#company_user_id').val(comp["user_id"]);

			// if (comp["id"] < 0) {
			// 	$("new_company").on("submit", function (e) {
			//     	e.preventDefault();
			//     });
			// 	document.getElementById("new_company").submit();
			// }
		}
	}
	// end of my commenting
	// document.getElementById('company_logo_img').setAttribute("display", "none");
	// document.getElementById('company_logo').setAttribute("display", "none");
	// document.getElementById('company_location').setAttribute("display", "none");
	// document.getElementById('company_website').setAttribute("display", "none");
}

function isOption(text1) {
	matchString = text1.toLowerCase();

	var found = false;
	$("option").each(function(index) {
		var index = $(this).text().toLowerCase().indexOf(matchString);
		if (index == 0) {
			found = true;
		} else{
			//no match
		}
	});

	return found;
}

function inCompList(comp) {
	var comp_name = comp["name"];
	var comp_logo = comp["logo"];
	var comp_website = comp["website"];
	var comp_location = comp["location"];

	for (comp1 in comp_list) {
		if (eqStr(comp_name, comp1["name"]) && eqStr(comp_logo, comp1["squareLogo"]) && eqStr(comp_website, comp["website"]) && eqStr(comp_location, comp["location"]) ) {
			return true;
		}
	}
	return false;
}

function eqStr(str1, str2) {
	if (str1 == null || str2 == null) return false;
	return str1.toLowerCase() == str2.toLowerCase();
}


function compStr(str1, str2) {
	if (str1 == undefined || str2 == undefined) return false;
	var index = str1.toLowerCase().indexOf(str2.toLowerCase());
	if (index == 0 && str1.length == str2.length) {
		return true;
	} else {
		return false;
	}
}


function createCompany(gdComp) {
	var comp = {
		"id" : null,
		"glassdoor_id" : gdComp["id"],
		"location" : gdComp["featuredReview"] != undefined ? gdComp["featuredReview"]["location"] : null,
		"logo" : gdComp["squareLogo"],
		"name" : gdComp["name"],
		"user_id" : GD_USER_ID,
		"website" : gdComp["website"],
	};

	return comp;
}

function addGDCompany(comp, form_class) {
	var index = comp_list.length;

	var emp_name = comp["name"];
	var emp_logo = comp["squareLogo"];
	var emp_id = comp["glassdoor_id"];

	$('.' + form_class + ' #company_list').append('<option value="' + emp_name + '" id="' + index + '">' + emp_name + '</option>');
	comp_list.push(createCompany(comp));

}

function addCompanies(companies, gd, form_class) {
	if (comp_list == null) {
		comp_list = new Array();
	}

	var $form = $('.' + form_class).first();

	for (var index = 0; index < companies.length; index++) {
		var company = companies[index];
		if (gd) {
			// why even have these variables?
			var emp_name = company["name"];
			var emp_logo = company["squareLogo"];

			if (!inCompList(company)) {
				addGDCompany(company, form_class);
			}
		} else {
			$form.find('#company_list').append('<option value="' + company["name"] + '" id="' + comp_list.length + '">' + company["name"] + '</option>');
			comp_list.push(company);
		}
	}
}

function getCompanyId(comp) {
	for (index in comp_list) {
		var comp1 = comp_list[index];
		if (eqStr(comp["name"], comp1["name"]) && eqStr(comp["logo"], comp1["logo"]) && eqStr(comp["website"], comp1["website"]) && eqStr(comp["location"], comp1["location"]) ) {
			if (comp1["id"] > 0)
				return comp1["id"];
		}
	}
	//createt new company
	var comp_id = null;
	return comp_id;
}


// for (var key in emp_list) {
//     if (key === 'length' || !widthRange.hasOwnProperty(key)) continue;
//     var value = widthRange[key];
// }


        // <div class="input-field" display ="none">
        //   <%= f.label :location, :class => "active" %>
        //   <%= f.text_field :location %>
        // </div>
        // <div class="input-field" display ="none">
        //   <%= f.label :website, :class => "active" %>
        //   <%= f.text_field :website %>
        // </div>
        // <div class="field" display ="none">
        //   <%= f.label :logo %><br>
        //   <%= f.text_field :logo %>
        //   <%= image_tag("https://media.glassdoor.com/sqll/9079/google-squarelogo-1441130773284.png", :alt => "company_logo", :id => "company_logo_img") %>
        // </div>






