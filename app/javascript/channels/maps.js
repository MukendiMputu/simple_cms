function jsRoar(name) {
    alert('I am ' + name  + '. Hear me roar!');
}

handler = Gmaps.build('Google');
handler.buildMap({ provider: {}, internal: { id: 'googleMap' } }, function () {
    markers = handler.addMarkers([
        {
            "lat": 50.419279,
            "lng": -104.591305,
            "picture": {
                "width": 32,
                "height": 32
            },
            "infowindow": "SJSU"
        }
    ]);
    handler.bounds.extendWith(markers);
    handler.fitMapToBounds();
});  