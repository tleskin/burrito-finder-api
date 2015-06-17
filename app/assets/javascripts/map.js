$(document).ready(function(){

  L.mapbox.accessToken = 'pk.eyJ1IjoidGxlc2tpbiIsImEiOiI1MTIyOTVkYWIwODNlMjM3ZmI1NzNjOWYyNjM5OWIzOCJ9.jRUuyE7bubZRpeh2TEjreg'

  var geolocate = document.getElementById('geolocate');
  var map = L.mapbox.map('map', 'tleskin.mf90jh31')
  var start = [ 39.749964, -105.000012 ]
  var myLayer = L.mapbox.featureLayer().addTo(map);

  map.setView(start, 15)


  // This uses the HTML5 geolocation API, which is available on
  // most mobile browsers and modern browsers, but not in Internet Explorer
  //
  // See this chart of compatibility for details:
  // http://caniuse.com/#feat=geolocation
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
              'title': 'Here I am!',
              'marker-color': '#ff8888',
              'marker-symbol': 'star'
          }
      });

      // And hide the geolocation button
      // geolocate.parentNode.removeChild(geolocate);
  });

  // If the user chooses not to allow their location
  // to be shared, display an error message.
  map.on('locationerror', function() {
      geolocate.innerHTML = 'Position could not be found';
  });



















  // Set starting marker
  // var marker = L.marker(start, {
  //   icon: L.mapbox.marker.icon({
  //     'marker-size': 'large',
  //     'marker-symbol': 'rocket',
  //     'marker-color': '#fa0'
  //   })
  // }).addTo(map);

  // Add Search
//   map.addControl(L.mapbox.geocoderControl('mapbox.places'));
//
//   marker.bindPopup("<b>Turing</b>").closePopup();
});
