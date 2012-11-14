class RouteCtrl
        constructor: ( $scope, Location, Route, $window, $route, $routeParams, $location, Dialectic ) ->
                $scope.action = undefined

                $scope.watchRoutes = () ->
                        $scope.$watch 'route', (newVal, oldVal) ->
                                if $routeParams.second and $routeParams.first
                                        $location.path( "/locations/#{$routeParams.first}/#{$routeParams.second}" )
                        $scope.$watch 'location', (newVal, oldVal) ->
                                if $routeParams.first and !$routeParams.second
                                        $location.path( "/locations/#{$routeParams.first}" )

                $scope.watchRoutes()

                $scope.updateMap = () ->
                        console.log "Let's initialize the map"
                        # $scope.

                Location.index {}, (response) ->
                        $scope.locations = response
                        $scope.locations.push { name: "Your city not here?", requestIt: true }
                        if $routeParams.first
                                for location in response
                                        if location.id == parseInt($routeParams.first)
                                                $scope.location = location
                                                $scope.loadRoutes($scope.location)

                $scope.setAction = (action) ->
                        $scope.action = undefined
                        if action
                                $scope.action = {}
                                $scope.action[action] = true

                $scope.loadDialectics = () ->
                        $scope.setAction( 'mine' )
                        console.log "Loading dialectics"
                        Dialectic.mine {}, (response) ->
                                $scope.dialectics = response

                $scope.loadStops = (route) ->
                        Route.stops { id: route.id }, (response) ->
                                $scope.stops = response

                $scope.loadRoutes = (location) ->
                        if location.requestIt
                                location = prompt "Should we add your city? What city?"
                                if location
                                        # Add it...
                                        share = confirm "The best way to convince us to add your city is for others to say they want it too! Would you go to our sharing page now and share on Twitter and Facebook?"
                                        if share
                                                $location.path( "/share" )

                                $scope.location = undefined
                                $scope.route = undefined
                        else
                                Location.routes { id: location.id }, (response) ->
                                        $scope.routes = response
                                        if $routeParams.second
                                                for route in response
                                                        if route.id == parseInt($routeParams.second)
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