function myMap() {
    var map;
    var mapProp = {
        center: new google.maps.LatLng(50.419279, -104.591305),
        zoom: 17,
    };
    map = new google.maps.Map(document.getElementById("googleMap"), mapProp);
}