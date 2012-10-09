class RouteCtrl
        constructor: ($scope, Route ) ->
                $scope.breadcrumbs.push "Route"

                Route.index {}, (response) ->
                        $scope.routes = response

                $scope.mkdwn = (text) ->
                        out = ""
                        if text
                                console.log "formatting: #{text}"
                                out = markdown.toHTML( text )
                                console.log "out: #{out}"
                        out

                $scope.loadStops = (route) ->
                        console.log "Got route, loading stops"
                        Route.classes {id: route.id}, (response) ->
                                $scope.classes = response

                                unless $scope.classes and $scope.classes.length > 1
                                        # Load alternatives
                                        Route.alternatives {}, (response) ->
                                                $scope.alternatives = response

                        Route.stops {id: route.id}, (response) ->
                                $scope.stops = response
                                $scope.breadcrumbs.push route.route_description

                                for stop in $scope.stops
                                        if Math.random() > 0.5
                                                stop.classes = []
                                                for x in [0..parseInt(Math.random()*10)]
                                                        stop.classes.push x


@RouteCtrl = RouteCtrl