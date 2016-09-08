// 
// mapboxgl.accessToken = 'pk.eyJ1IjoibWFnZGFsZW5hYmlhbG9uIiwiYSI6ImNpc2p3cnUwczAycXcyem9jYXpzZWZ6eW4ifQ.RWDUb9U9vdUlNuKcPGJDhg';
//
// var map = new mapboxgl.Map({
//   container: 'map-jordan',
//   style: 'mapbox://styles/mapbox/dark-v9',
//   center: [144.958998, -37.818535],
//   pitch: 60,
//   // bearing: -60,
//   zoom: 13
// });
//
// // map.addControl(new mapboxgl.Directions());
// //
// // var directions = new mapboxgl.Directions({
// //   unit: 'metric',
// //   profile: 'driving',
// //   container: 'directions',
// //   proximity: [144.96, -37.82]
// // });
//
//
// // ========================= Map Movement on Scroll
// var chapters = {
//
//   'event-location': {
//       duration: 6000,
//       center: [144.958998, -37.818535],
//       pitch: 0,
//       bearing: -20,
//       zoom: 17
//   },
//   'route': {
//       duration: 6000,
//       center: [144.958998, -37.818535],
//       bearing: 180,
//       zoom: 12,
//       pitch: 0
//   },
//   'parking': {
//       bearing: 0,
//       center: [144.958998, -37.818535],
//       zoom: 15,
//       speed: 0.6,
//       pitch: 35
//   },
//   'default': {
//     center: [144.958998, -37.818535],
//     pitch: 60,
//     zoom: 13
//   },
//
// };
//
// function isOnScreen(element){
//
//   var element = $(element);
//   var win = $(window);
//   var viewport = {
//
//     top : win.scrollTop(),
//     left : win.scrollLeft()
//
//   };
//
//   viewport.bottom = viewport.top + (win.height()/2);
//   var bounds = element.offset();
//   bounds.bottom = bounds.top + element.outerHeight();
//   return !(viewport.bottom < bounds.top || viewport.top > bounds.bottom - (win.height()/2));
//
// }
//
// map.on('load', function() {
//
// // var showParking = false;
//
// // ========================= Map View on Scroll :)
//
//   $(window).scroll(function() {
//     var mapStates = ['event-location', 'route', 'parking', 'default'];
//
//     for(var g = 0; g < mapStates.length; g++) {
//
//       var currentState = mapStates[g]
//       if ( isOnScreen( $('#' + currentState) ) === true) {
//
//         map.flyTo( chapters[currentState] );
//
//         if ( mapStates[g] === 'parking' ) {
//           showParkingToggle();
//         }
//
//       }
//
//     }
//
//   });

// ========================= GA-cong logo
  // var gaConf =
  //
  //   {
  //     type: "FeatureCollection",
  //     features: [
  //       {
  //         "type": "Feature",
  //         "geometry": {
  //           "type": "Point",
  //           "coordinates": [
  //             144.958998,
  //             -37.818535
  //           ]
  //         },
  //         properties: {
  //           "website": "https://generalassemb.ly/",
  //           "address": "12A/Williams St CBD",
  //           "city": "Melbourne Vic",
  //           "country": "Australia",
  //           "date_of_conf": "19 Feb 2017",
  //           "time": "10am - 6pm"
  //         }
  //       },
  //     ]
  //   }
  //
  //   map.addSource("places", {
  //     "type": "geojson",
  //     "data": gaConf
  //   });
  //
  //   gaConf.features.forEach(function(marker_ga) {
  //
  //     var ga_logo = document.createElement('div');
  //     ga_logo.className = 'ga_icon';
  //     ga_logo.style.left='-28px';
  //     ga_logo.style.top='-46px';
  //
  //     ga_logo.addEventListener('click', function() {
  //         window.alert("Website: " + marker_ga.properties.website + " | Conference date: " + marker_ga.properties.date_of_conf);
  //     });
  //
  //     new mapboxgl.Marker(ga_logo)
  //         .setLngLat(marker_ga.geometry.coordinates)
  //         .addTo(map);
  //   });

// =========================  parking locations

    // Only loads parking locations once the person has scrolled down
    // to the parking section :)
    // commented out because it uses a lot of computer juice!
    // but I got it working
    // function showParkingToggle() {

      // $.ajax({
      //   url: "https://data.melbourne.vic.gov.au/resource/9xmh-yeh2.json",
      //   type: "GET",
      //   data: {
      //     "$limit" : 800,
      //     "$$app_token" : "q0QvItQ7Te62kF5Yr2ebfoeNs"
      //   }
      // }).done(function(data) {
      //
      //
      //   var geojson = {
      //     type: 'FeatureCollection',
      //     features: []
      //   };
      //
      //   data.forEach(function(e) {
      //     geojson.features.push({
      //       type: 'Feature',
      //       properties: {
      //         "parking_type": e.parking_type,
      //         "number_of_spaces": e.parking_spaces,
      //         "iconSize": [10, 10]
      //       },
      //       geometry: {
      //         "type": "Point",
      //         "coordinates": [
      //           e.x_coordinate.coordinates[0],
      //           e.x_coordinate.coordinates[1],
      //         ]
      //       }
      //     });
      //     // console.log(e.x_coordinate.coordinates)
      //   });
      //
      //   geojson.features.forEach(function(marker) {
      //
      //     // create a DOM element for the marker
      //     var el = document.createElement('div');
      //     el.className = 'parking-icon icon-dc';
      //
      //     var t = document.createTextNode("p");
      //     el.appendChild(t);
      //
      //
      //     el.addEventListener('click', function() {
      //       window.alert("Parking type: " + marker.properties.parking_type + " | Number of spaces: " + marker.properties.number_of_spaces);
      //     });
      //
      //     // add marker to map
      //     new mapboxgl.Marker(el, {offset: [-marker.properties.iconSize[0] / 2, -marker.properties.iconSize[1] / 2]})
      //     .setLngLat(marker.geometry.coordinates)
      //     .addTo(map);
      //   });
      // })

    }

// // ===========================  autolocation
//        navigator.geolocation.getCurrentPosition(function(geo) {
//         $('#map').css({
//           'opacity': '1'
//         });
//         $('#mapbox-directions-origin-input , #mapbox-directions-destination-input, .mapbox-form-label, .js-reverse-inputs').css({
//           'display': 'none'
//         });
//          directions.setOrigin([ geo.coords.longitude, geo.coords.latitude ]);
//          directions.setDestination([144.958998, -37.818535]);
//        });

});

// map.scrollZoom.disable();


// =========================  directions
//  directions.on('route', function(e) {
//    map.scrollZoom.disable();
 //
//    function flyToLocation(currentFeature) {
//       map.flyTo({
//         center: currentFeature.geometry.coordinates,
//         zoom: 15
//       });
//     }
//  });
 //
//  map.addControl(new mapboxgl.Navigation());
