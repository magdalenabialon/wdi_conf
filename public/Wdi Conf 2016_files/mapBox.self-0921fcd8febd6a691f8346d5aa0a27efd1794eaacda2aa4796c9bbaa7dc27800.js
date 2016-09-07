// go and see the script on the actual map.html.erb file  :)
//
//
//
// mapboxgl.accessToken = 'pk.eyJ1IjoibWFnZGFsZW5hYmlhbG9uIiwiYSI6ImNpc2p3cnUwczAycXcyem9jYXpzZWZ6eW4ifQ.RWDUb9U9vdUlNuKcPGJDhg';
// L.mapbox.accessToken = 'pk.eyJ1IjoibWFnZGFsZW5hYmlhbG9uIiwiYSI6ImNpc2p3cnUwczAycXcyem9jYXpzZWZ6eW4ifQ.RWDUb9U9vdUlNuKcPGJDhg';
//
//
//  var map = new mapboxgl.Map({
//      container: 'map',
//      style: 'mapbox://styles/mapbox/streets-v9',
//      center: [144.958998, -37.818535],
//      zoom: 13
//  });
//
//  map.addControl(new mapboxgl.Directions());
//
//  var directions = new mapboxgl.Directions({
//    unit: 'metric', // Use the metric system to display distances.
//    profile: 'driving', // Set the initial profile to walking.
//    container: 'directions', // Specify an element thats not the map container.
//    proximity: [144.96, -37.82] // Give search results closer to these coordinates higher priority.
//  });
//
//
//
//  map.on('load', function() {
//    navigator.geolocation.getCurrentPosition(function(geo) {
//     console.log(geo)
//     $('#map').css({
//       'opacity': '1'
//     });
//     // $('.mapbox-directions-component mapbox-directions-inputs').hide();
//      directions.setOrigin([ geo.coords.longitude, geo.coords.latitude ]);
//      directions.setDestination([144.95842859999993, -37.81884560000003]);    // On load, set the origin to GA Melbourne
//    });
//
//
//  });
//
//
//  directions.on('route', function(e) {
//    console.log(e.route); // Logs the current route shown in the interface.
//  });
