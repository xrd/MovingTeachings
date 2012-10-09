appmod = angular.module 'movingteachings', [ 'ngResource' ]

appmod.factory 'Route', [ '$resource', ($resource) ->
        $resource "/routes/:id/:action", { id: '@id' },
                index: { method: 'GET', isArray: true },
                stops: { method: 'GET', isArray: true, params: { action: 'stops' } }
                classes: { method: 'GET', isArray: true, params: { action: 'classes' } }
                alternatives: { method: 'GET', isArray: true, params: { action: 'alternatives' } }
        ]


@appmod = appmod
