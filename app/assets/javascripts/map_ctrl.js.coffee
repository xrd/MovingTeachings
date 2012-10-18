class MapCtrl
        constructor: ( $scope ) ->

                $scope.map ||= {}
                console.log "Inside map controller"

                $scope.$on 'clearMap', () ->
                        $scope.map.results = undefined
                        $scope.map.query = undefined

                console.log "Setting center to: #{$scope.stop.lat} #{$scope.stop.lng}"
                $scope.myMarkers = {};
                $scope.map.center = new google.maps.LatLng( $scope.stop.lat, $scope.stop.lng )

                $scope.map.options =
                        center: $scope.map.center
                        zoom: 12,
                        mapTypeId: google.maps.MapTypeId.ROADMAP

                $scope.map.mine = new google.maps.Map( document.getElementById('map_canvas'), $scope.map.options)

                $scope.foo = () ->
                        alert "Um, hi"

                callback = (results, status) ->
                        if status == google.maps.places.PlacesServiceStatus.OK
                                $scope.map.results = results
                                $scope.$digest()

                $scope.searchPlaces = () ->
                        request =
                                location: $scope.map.center,
                                radius: '500',
                                types: []
                        request.query = $scope.map.query
                        service = new google.maps.places.PlacesService($scope.map.mine);
                        service.textSearch(request, callback);


@MapCtrl = MapCtrl