var localSearch;
var map;
var icon;
var addressMarkerOptions;
google.load("search", "1");
google.load("maps", "2");

function initialize(address)
{
alert('got here');
    localSearch = new GlocalSearch();
    icon = new GIcon(G_DEFAULT_ICON);
    addressMarkerOptions = { icon:icon , draggable: false};
    map = new GMap2(document.getElementById("map"));
    map.addControl(new GLargeMapControl());
    map.addControl(new GMapTypeControl());
    plotAddress(address)
}

/**
 * This takes either a postcode or an address string
 *
 */
function plotAddress(address)
{
    alert('got here too' + address);
    localSearch.setSearchCompleteCallback(null,
        function() {

            if (localSearch.results[0])
            {
                var resultLat = localSearch.results[0].lat;
                var resultLng = localSearch.results[0].lng;
                var point = new GLatLng(resultLat,resultLng);
                var marker = new GMarker(point, addressMarkerOptions);
                map.addOverlay(marker);
                map.setCenter(point, 5, G_NORMAL_MAP);
            }
            else
            {
                alert('address not found');
            }
        });

    localSearch.execute(address + ", UK");
}

google.maps.event.addDomListener(window, 'load', initialize);