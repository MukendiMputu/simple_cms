// Quick summary of the steps to do for implementing a
// basic AJAX-Request.

// Variable to hold the object
var data;

// 1. 
var request = new XMLHttpRequest();

// 2. 
request.open('GET', '/root/path/to/document.json');

// 3.
request.onreadystatechange = function () {
    // check wether the request status is ok
    if (request.status === 200 && request.readyState === 4) {
        // Parse the responce text into a json-object
        data = JSON.parse(request.responseText);
    }
}

// 4.
request.send();