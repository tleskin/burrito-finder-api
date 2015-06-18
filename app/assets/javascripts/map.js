$(document).ready(function(){

  L.mapbox.accessToken = 'pk.eyJ1IjoidGxlc2tpbiIsImEiOiI1MTIyOTVkYWIwODNlMjM3ZmI1NzNjOWYyNjM5OWIzOCJ9.jRUuyE7bubZRpeh2TEjreg'

  var geolocate = document.getElementById('geolocate');
  var map = L.mapbox.map('map', 'tleskin.mf90jh31')
  var start = [ 39.749964, -105.000012 ]
  var myLayer = L.mapbox.featureLayer().addTo(map);

  // Set starting marker
  var marker = L.marker(start, {
    icon: L.mapbox.marker.icon({
      'marker-size': 'large',
      "marker-symbol": "star",
      'marker-color': '#ffff00'
    })
  }).addTo(map);

  marker.bindPopup("<b>BurritoFinder HQ</b>").closePopup();

  map.setView(start, 15)

  $("#geolocate").click(function(){
     $("#spinner").toggleClass("hidden");
   })

  if (!navigator.geolocation) {
      geolocate.innerHTML = 'Geolocation is not available';
  } else {
      geolocate.onclick = function (e) {
          e.preventDefault();
          e.stopPropagation();
          map.locate();
      };
  }


  // Once we've got a position, zoom and center the map
  // on it, and add a single marker.
  map.on('locationfound', function(e) {
      map.fitBounds(e.bounds);

      myLayer.setGeoJSON({
          type: 'Feature',
          geometry: {
              type: 'Point',
              coordinates: [e.latlng.lng, e.latlng.lat]
          },
          properties: {
              'title': 'You are here!',
              'marker-color': '#ff8888',
              'marker-symbol': 'star',
              "marker-size": "large"
          }
      });

      $.post("/burritos", {lat: e.latitude, lon: e.longitude}).then(function(burritos){

        $("#spinner").toggleClass("hidden");

        var myBurritos = [];

        burritos.map(function(burrito) {
          myBurritos.push({
            type: "Feature",
            geometry: {
              type: "Point",
              coordinates: [burrito.table.longitude,burrito.table.latitude]
            },
            properties: {
              "title": burrito.table.name,
              "description": burrito.table.address,
              "marker-color": "#47ABED",
              "marker-size": "medium",
              "marker-symbol": "fast-food"
            }



          });

          $("#burritos").addClass("parks")
           $("#map").removeClass("big-map").addClass("small-map");
             var burritoLayer = map.featureLayer.setGeoJSON(myBurritos);
             map.fitBounds(burritoLayer.getBounds());

        });
      });
      // And hide the geolocation button
      geolocate.parentNode.removeChild(geolocate);
  });


  // If the user chooses not to allow their location
  // to be shared, display an error message.
  map.on('locationerror', function() {
    $("#spinner").toggleClass("hidden");
    geolocate.innerHTML = 'Position could not be found';
  });

});
