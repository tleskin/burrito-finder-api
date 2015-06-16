$(document).ready(function(){
  L.mapbox.accessToken = 'pk.eyJ1IjoidGxlc2tpbiIsImEiOiI1MTIyOTVkYWIwODNlMjM3ZmI1NzNjOWYyNjM5OWIzOCJ9.jRUuyE7bubZRpeh2TEjreg'

  var map = L.mapbox.map('map', 'tleskin.mf90jh31')
  var start = [ 39.749964, -105.000012 ]

  map.setView(start, 15)



  // Set starting marker
  var marker = L.marker(start, {
    icon: L.mapbox.marker.icon({
      'marker-size': 'large',
      'marker-symbol': 'rocket',
      'marker-color': '#fa0'
    })
  }).addTo(map);

  // Add Search
  map.addControl(L.mapbox.geocoderControl('mapbox.places'));

  marker.bindPopup("<b>Turing</b>").closePopup();
});
