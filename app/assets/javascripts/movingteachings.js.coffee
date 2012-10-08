
class Main
        constructor: ($scope, Route) ->
                console.log "Got inside"
                $scope.get_on = undefined
                $scope.get_off= undefined
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

@Main = Main
