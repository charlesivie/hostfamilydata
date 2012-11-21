function usePointFromPostcode(postcode, callbackFunction) {
    localSearch.setSearchCompleteCallback(null, function() {
        if (localSearch.results[0]) {
            var resultLat = localSearch.results[0].lat;
            var resultLng = localSearch.results[0].lng;
            var point = new GLatLng(resultLat,resultLng);
            callbackFunction(point);
        } else {
            alert("Postcode not found!");
        }
    });

    localSearch.execute(postcode + ", UK");
}

$("#mapModalLink").click(function() {
    alert("Handler for .click() called.");
    var mapOptions = {
        center: new google.maps.LatLng(-34.397, 150.644),
        zoom: 8,
        mapTypeId: google.maps.MapTypeId.ROADMAP
    };
    var map = new google.maps.Map(document.getElementById("map_canvas"),
        mapOptions);
});
