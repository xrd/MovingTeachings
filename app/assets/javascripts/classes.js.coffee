class ClassCtrl
        constructor: ($scope, Route) ->
                console.log "Got inside"

                $scope.breadcrumbs = []

                Route.index {}, (response) ->
                        $scope.routes = response

                $scope.loadClasses = (route) ->
                        console.log "Got route"
                        route.$classes {}, (response) ->
                                $scope.classes = response

                $scope.loadStops = (route) ->
                        console.log "Got route, loading stops"
                        Route.stops {id: route.id}, (response) ->
                                $scope.stops = response
                                $scope.breadcrumbs = []
                                $scope.breadcrumbs.push "Stops"
