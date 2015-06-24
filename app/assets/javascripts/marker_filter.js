// all = document.getElementById('filter-all');
// one_mile = document.getElementById('filter-one-mile');
// three_mile = document.getElementById('filter-three-mile');
// five_mile = document.getElementById('filter-five-mile');=
//
// // If the user chooses not to allow their location
// // to be shared, display an error message.
// map.on('locationerror', function() {
//   $("#spinner").toggleClass("hidden");
//   geolocate.innerHTML = 'Position could not be found';
// });
//
// all.onclick = function() {
// food.className = '';
// this.className = 'active';
// map.featureLayer.setFilter(function(f) {
//     // Returning true for all markers shows everything.
//     return true;
// });
// return false;
// };
//
// one_mile.onclick = function(e) {
// all.className = '';
// this.className = 'active';
// // The setFilter function takes a GeoJSON feature object
// // and returns true to show it or false to hide it.
// map.featureLayer.setFilter(function(f) {
//
//     return (f.properties['distance'] <= 1);
// });
// return false;
// };
//
// three_mile.onclick = function(e) {
// all.className = '';
// this.className = 'active';
// // The setFilter function takes a GeoJSON feature object
// // and returns true to show it or false to hide it.
// map.featureLayer.setFilter(function(f) {
//
//     return ((f.properties['distance'] > 1) && ( f.properties['distance'] <= 3 ));
// });
// return false;
// };
//
// five_mile.onclick = function(e) {
// all.className = '';
// this.className = 'active';
// // The setFilter function takes a GeoJSON feature object
// // and returns true to show it or false to hide it.
// map.featureLayer.setFilter(function(f) {
//
//     return ((f.properties['distance'] > 3) && (f.properties['distance'] <= 5));
// });
// return false;
// };
