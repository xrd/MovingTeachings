module = angular.module 'movingteachings', [ 'ngResource' ]

module.factory 'Route', [ '$resource', ($resource) ->
        $resource "/routes/:id/:action", { id: '@id' },
                index: { method: 'GET', isArray: true },
                stops: { method: 'GET', isArray: true, params: { action: 'stops' } }
        ]

class Main
        constructor: ($scope, Route) ->
                console.log "Got inside"

                Route.index {}, (response) ->
                        $scope.routes = response

@Main = Main
