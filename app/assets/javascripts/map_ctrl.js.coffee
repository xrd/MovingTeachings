class MapCtrl
        constructor: ($scope) ->

                $scope.myMarkers = []
                console.log "Inside map controller"

                callback = (results, status) ->
                        if status == google.maps.places.PlacesServiceStatus.OK
                                $scope.results = results
                                $scope.$digest()

                $scope.addMarker = () ->
                        console.log "Adding a marker!"
                        $scope.myMarkers.push( new google.maps.Marker( map: $scope.myMap, position: $event.latLng ) )

                $scope.searchPlaces = () ->

                        center = new google.maps.LatLng( $scope.stop.lat, $scope.stop.lng )

                        $scope.items = []
                        console.log "Searching for: #{$scope.mapSearch}"
                        map = new google.maps.Map document.getElementById('placesMap')
                        request =
                                location: center,
                                radius: '500',
                                types: ['store']

                        service = new google.maps.places.PlacesService(map);
                        service.textSearch(request, callback);


@MapCtrl = MapCtrl