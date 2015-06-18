$(document).ready(function(){

  L.mapbox.accessToken = 'pk.eyJ1IjoidGxlc2tpbiIsImEiOiI1MTIyOTVkYWIwODNlMjM3ZmI1NzNjOWYyNjM5OWIzOCJ9.jRUuyE7bubZRpeh2TEjreg'

  // Setup modules
  var geolocate = document.getElementById('geolocate'),
      map       = L.mapbox.map('map', 'tleskin.mf90jh31'),
      start     = [ 39.749964, -105.000012 ],
      myLayer   = L.mapbox.featureLayer().addTo(map);

  // Set starting marker
  var marker = L.marker(start, {
    icon: L.mapbox.marker.icon({
      'marker-size': 'large',
      "marker-symbol": "star",
      'marker-color': '#ffff00'
    })
  }).addTo(map);

  // Add Tag to Starting Point
  marker.bindPopup("<b>BurritoFinder HQ</b>").closePopup();

  // Set Starting Point on Map
  map.setView(start, 15)

  // When Geolocate div is hit, activate spinner
  $("#geolocate").click(function(){
     $("#spinner").toggleClass("hidden");
   })

  // If no location found, tell you, otherwise, put that point on map
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

      //
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

          //  $("#map").removeClass("big-map").addClass("small-map");
             var burritoLayer = map.featureLayer.setGeoJSON(myBurritos);
             map.fitBounds(burritoLayer.getBounds());

             // Create Div For Burrito Layer
             var $burritoDiv = $("#burritos");

             $("#burritos").addClass("burritos")
             $burritoDiv.empty();
             $burritoDiv.append(burritos.map(function(burrito){
               return $( "<h3>" + burrito.table.name + "</h3>" +
               "<p>" + burrito.table.address + "</p>" +
               "<p>" + burrito.table.city + "</p>"+
               "<p>" + burrito.table.state + "</p>" +
               "<p>" + burrito.table.zip + "</p>" +
               "<p>" + burrito.table.country + "</p>" +
               "<p> -------------</p>");
                }));

        });
      });
  });


  // If the user chooses not to allow their location
  // to be shared, display an error message.
  map.on('locationerror', function() {
    $("#spinner").toggleClass("hidden");
    geolocate.innerHTML = 'Position could not be found';
  });

});
