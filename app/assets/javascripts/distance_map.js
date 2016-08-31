var latitude, longitude;


//======================== ONE MAIN BIG FUNCTION disMap  -google maps
function disMap() {

    var directionsDisplay = new google.maps.DirectionsRenderer;
    var directionsService = new google.maps.DirectionsService;



    //======================  MAP ON THE SHOW PAGE :)

    var mapDis = new google.maps.Map(document.getElementById('mapDis'), {
      zoom: 14,
      // zoomControl: false,
      // scaleControl: false,
      scrollwheel: false,
      center: {lat: -37.8136, lng: 144.9631}
    });



    directionsDisplay.setMap(mapDis);

    calculateAndDisplayRoute(directionsService, directionsDisplay);


    document.getElementById('mode').addEventListener('change', function() {
      calculateAndDisplayRoute(directionsService, directionsDisplay);
    });




    function calculateAndDisplayRoute(directionsService, directionsDisplay) {

      var selectedMode = document.getElementById('mode').value;


        navigator.geolocation.getCurrentPosition(function(position) {

           var geolocate = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);

           var infowindow = new google.maps.InfoWindow({
            //  map: mapDis,
            position: geolocate,
           });


          directionsService.route({

            origin: {lat: position.coords.latitude, lng: position.coords.longitude},  // melbourne Generel Assemb.ly HARDCODED  origin: {lat: -37.818535, lng: 144.958998},

            destination: {lat: -37.818535, lng: 144.958998},                  //{lat: parseFloat($('#map-lat').text(), 10), lng: parseFloat($('#map-lng').text(), 10)},  // Hair salon   // Hair salon HARDCODED > destination: {lat: -37.8156, lng: 144.9431},

            // Note that Javascript allows us to access the constant using square brackets and a string value as its "property."
            travelMode: google.maps.TravelMode[selectedMode]

          },

          function(response, status) {
            if (status == 'OK') {
              directionsDisplay.setDirections(response);
            } else {
              window.alert('Directions request failed due to ' + status);
            }
          });

        });

  }

}
