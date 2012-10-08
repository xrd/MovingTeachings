module = angular.module 'movingteachings', [ 'ngResource' ]

module.factory 'stuff', [ '$resource', ($resource) ->
        $resource "/stuff", {}, {}
        ]

class Main
        constructor: ($scope, stuff) ->
                console.log "Got inside"

                $scope.routes = [ 14, 24, 15, 17, 19 ]

@Main = Main
