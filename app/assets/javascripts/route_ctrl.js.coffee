class RouteCtrl
        constructor: ( $scope, Location, Route, $window, $route, $routeParams, $location ) ->


                $scope.watchRoutes = () ->
                        $scope.$watch 'route', (newVal, oldVal) ->
                                if $routeParams.route_id and $routeParams.location_id
                                        $location.path( "/locations/#{$scope.location.id}/#{$scope.route.id}" )
                        $scope.$watch 'location', (newVal, oldVal) ->
                                if $routeParams.location_id and !$routeParams.route_id
                                        $location.path( "/locations/#{$scope.location.id}" )

                $scope.watchRoutes()

                Location.index {}, (response) ->
                        $scope.locations = response
                        if $routeParams.location_id
                                for location in response
                                        if location.id == parseInt($routeParams.location_id)
                                                $scope.location = location
                                                $scope.loadRoutes($scope.location)

                $scope.loadRoutes = (location) ->
                        Location.routes { id: location.id }, (response) ->
                                $scope.routes = response
                                if $routeParams.route_id

                                        for route in response
                                                if route.id == parseInt($routeParams.route_id)
                                                        $scope.route = route
                                                        $scope.loadStops($scope.route)

                $scope.shareRoute = (method) ->
                        text = "Moving teachings, little classes on the bus. This route looks fun: "
                        url = "http://movingteachings.com/routes/#{$scope.routeId}"
                        if method == "facebook"
                                $window.open( "http://facebook.com/sharer.php?u=#{url}", method )
                        else if method = "twitter"
                                $window.open( "http://twitter.com/share?text=#{text}&url=#{url}", method )
                        end

                $scope.loadStops = (route) ->
                        $scope.routeId = route.id
                        console.log "Got route, loading stops"
                        Route.dialectics {id: route.id}, (response) ->
                                $scope.dialectics = response

                                unless $scope.dialectics and $scope.dialectics.length > 1
                                        # Load alternatives
                                        Route.alternatives {}, (response) ->
                                                $scope.alternatives = response

                        Route.stops {id: route.id}, (response) ->
                                $scope.stops = response

                                for stop in $scope.stops
                                        if Math.random() > 0.5
                                                stop.dialectics = []
                                                for x in [0..parseInt(Math.random()*10)]
                                                        stop.dialectics.push x





@RouteCtrl = RouteCtrl