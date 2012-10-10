class RouteCtrl
        constructor: ($scope, Route, Breadcrumbs ) ->
                Breadcrumbs = []

                Route.index {}, (response) ->
                        $scope.routes = response

                $scope.loadStops = (route) ->
                        console.log "Got route, loading stops"
                        Route.dialectics {id: route.id}, (response) ->
                                $scope.dialectics = response

                                unless $scope.dialectics and $scope.dialectics.length > 1
                                        # Load alternatives
                                        Route.alternatives {}, (response) ->
                                                $scope.alternatives = response

                        Route.stops {id: route.id}, (response) ->
                                $scope.stops = response
                                Breadcrumbs.push route.route_description

                                for stop in $scope.stops
                                        if Math.random() > 0.5
                                                stop.dialectics = []
                                                for x in [0..parseInt(Math.random()*10)]
                                                        stop.dialectics.push x


@RouteCtrl = RouteCtrl