window.fbAsyncInit = function() {
FB.init({
	appId      : '720093374787431',
	cookie     : true,  // enable cookies to allow the server to access 
	xfbml      : true,  // parse social plugins on this page
	version    : 'v2.2' // use version 2.2
});

// Load the SDK asynchronously
(function(d, s, id) {
var js, fjs = d.getElementsByTagName(s)[0];
if (d.getElementById(id)) return;
js = d.createElement(s); js.id = id;
js.src = "//connect.facebook.net/en_US/sdk.js";
fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));


function onSignIn(googleUser) {
	  var profile = googleUser.getBasicProfile();
	  console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
	  console.log('Name: ' + profile.getName());
	  console.log('Image URL: ' + profile.getImageUrl());
	  console.log('Email: ' + profile.getEmail());
	}
	
  // This is called with the results from from FB.getLoginStatus().
function statusChangeCallback(response) {
	console.log('statusChangeCallback');
	console.log(response);
	// The response object is returned with a status field that lets the
	// app know the current login status of the person.
	// Full docs on the response object can be found in the documentation
	// for FB.getLoginStatus().
	if (response.status === 'connected') {
	  // Logged into your app and Facebook.
	  testAPI(response);

	} else if (response.status === 'not_authorized') {
	  // The person is logged into Facebook, but not your app.
	  document.getElementById('status').innerHTML = 'Please log ' +
	    'into this app.';
	} else {
	  // The person is not logged into Facebook, so we're not sure if
	  // they are logged into this app or not.
	  document.getElementById('status').innerHTML = 'Please log ' +
	    'into Facebook.';
	}
}

// This function is called when someone finishes with the Login
// Button.  See the onlogin handler attached to it in the sample
// code below.
function checkLoginState() {
	FB.getLoginStatus(function(response) {
	  statusChangeCallback(response);
	});
}

FB.getLoginStatus(function(response) {
		statusChangeCallback(response);
	});
};

//this is a test API to test communication with the API endpoint of users/1 to get validation
function testAPI(response) {
	var jsondata = {"accessToken": response.authResponse.accessToken};
	var resourceUrl = "/users/1";
	$.getJSON(resourceUrl, jsondata, function(data){
		//console.log("got" + data);
		FB.api('/me', function(response) {
		  	document.getElementById('status').innerHTML = 'Thanks for logging in, ' + response.name + " with validated id:" + data;
		});
	});
}
