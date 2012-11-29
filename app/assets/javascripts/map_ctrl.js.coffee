class MapCtrl
        constructor: ( $scope ) ->
                $scope.map ||= {}
                console.log "Inside map controller"

                $scope.$on 'clearMap', () ->
                        $scope.map.results = undefined
                        $scope.map.query = undefined
                        console.log "Setting center to: #{$scope.center.lat} #{$scope.center.lng}"
                        $scope.myMarkers = {};
                        $scope.initMap( $scope.center )

                $scope.initMap = ( center ) ->
                        console.log "Initializing map canvas"
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

                $scope.removeHoverItem = () ->
                        $scope.hoveredItem.setMap(null)

                $scope.centerToItem = (location) ->
                        center = new google.maps.LatLng( location.lat(), location.lng() )
                        $scope.map.mine.setCenter center
                        $scope.hoveredItem = new google.maps.Marker map: $scope.map.mine, position: center, visible: true

                $scope.initialize = () ->
                        console.log "Inside initialize"
                        if $scope.action?.create
                                $scope.initMap $scope.stop
                                center = new google.maps.LatLng( $scope.stop.lat, $scope.stop.lng )
                        else
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