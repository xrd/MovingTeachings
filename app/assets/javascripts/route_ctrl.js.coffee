class RouteCtrl
        constructor: ( $scope, Location, Route, $window, $route, $routeParams, $location, Dialectic ) ->
                $scope.watchRoutes = () ->
                        $scope.$watch 'route', (newVal, oldVal) ->
                                if $routeParams.route_id and $routeParams.location_id
                                        $location.path( "/locations/#{$routeParams.location_id}/#{$routeParams.route_id}" )
                        $scope.$watch 'location', (newVal, oldVal) ->
                                if $routeParams.location_id and !$routeParams.route_id
                                        $location.path( "/locations/#{$routeParams.location_id}" )

                $scope.watchRoutes()

                $scope.updateMap = () ->
                        console.log "Let's initialize the map"
                        # $scope.

                Location.index {}, (response) ->
                        $scope.locations = response
                        if $routeParams.location_id
                                for location in response
                                        if location.id == parseInt($routeParams.location_id)
                                                $scope.location = location
                                                $scope.loadRoutes($scope.location)

                $scope.loadDialectics = () ->
                        console.log "Loading dialectics"
                        Dialectic.mine {}, (response) ->
                                $scope.dialectics = response

                $scope.loadStops = (route) ->
                        Route.stops { id: route.id }, (response) ->
                                $scope.stops = response

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

                $scope.loadClasses = (route) ->
                        $scope.routeId = route.id
                        console.log "Got route, loading stops"
                        Route.dialectics {id: route.id}, (response) ->
                                $scope.dialectics = response

                                unless $scope.dialectics and $scope.dialectics.length > 1
                                        # Load alternatives
                                        Route.alternatives {}, (response) ->
                                                $scope.alternatives = response

                                                if 0 == $scope.alternatives.length
                                                        $scope.noAlternatives = "Sorry, there are no classes offered in your city right now."

                        Route.stops {id: route.id}, (response) ->
                                $scope.stops = response

                                for stop in $scope.stops
                                        if Math.random() > 0.5
                                                stop.dialectics = []
                                                for x in [0..parseInt(Math.random()*10)]
                                                        stop.dialectics.push x





RouteCtrl.$inject =  [ "$scope", "Location", "Route", "$window", "$route", "$routeParams", "$location", "Dialectic" ]
@RouteCtrl = RouteCtrl