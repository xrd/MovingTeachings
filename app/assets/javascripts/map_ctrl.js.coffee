class MapCtrl
        constructor: ( $scope ) ->
                $scope.map ||= {}
                console.log "Inside map controller"

                $scope.$on 'clearMap', () ->
                        $scope.map.results = undefined
                        $scope.map.query = undefined

                        console.log "Setting center to: #{$scope.stop.lat} #{$scope.stop.lng}"
                        $scope.myMarkers = {};

                        $scope.initMap( $scope.stop )


                $scope.initMap = ( center ) ->
                        $scope.map.center = new google.maps.LatLng( center.lat, center.lng )
                        $scope.map.options =
                                center: $scope.map.center
                                zoom: 12,
                                mapTypeId: google.maps.MapTypeId.ROADMAP
                        $scope.map.mine = new google.maps.Map( document.getElementById('map_canvas'), $scope.map.options)


                callback = (results, status) ->
                        if status == google.maps.places.PlacesServiceStatus.OK
                                $scope.map.results = results
                                $scope.$digest()

                $scope.initialize = () ->
                        unless $scope.action?.editing
                                # load up the items for the dialectic
                                console.log "Loading items"
                                $scope.initMap $scope.focused.map
                                center = new google.maps.LatLng( $scope.focused.map.lat, $scope.focused.map.lng )
                                $scope.marker = new google.maps.Marker map: $scope.map.mine, position: center, visible: true
                                $scope.map.mine.setCenter center

                $scope.searchPlaces = () ->
                        request =
                                location: $scope.map.center,
                                radius: '500',
                                types: []
                        request.query = $scope.map.query
                        service = new google.maps.places.PlacesService($scope.map.mine);
                        service.textSearch(request, callback);


@MapCtrl = MapCtrl
MapCtrl.$inject = ['$scope']