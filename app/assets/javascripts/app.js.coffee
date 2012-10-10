appmod = angular.module 'movingteachings', [ 'ngResource', 'ngSanitize' ]

appmod.factory 'Breadcrumbs', () ->
        []

appmod.factory 'User', [ '$resource', ($resource) ->
        $resource "/users/:action", {},
                loggedIn: { method: 'GET', isArray: false, params: { action: 'loggedIn' } }
                ]

appmod.factory 'Route', [ '$resource', ($resource) ->
        $resource "/routes/:id/:action", { id: '@id' },
                index: { method: 'GET', isArray: true },
                stops: { method: 'GET', isArray: true, params: { action: 'stops' } }
                dialectics: { method: 'GET', isArray: true, params: { action: 'dialectics' } }
                samples: { method: 'GET', isArray: true, params: { action: 'samples' } }
                alternatives: { method: 'GET', isArray: true, params: { action: 'alternatives' } }
        ]

appmod.factory 'Dialectic', [ '$resource', ($resource) ->
        $resource "/dialectic/:id/:action", { id: '@id' },
                register: { method: 'POST', isArray: false, params: { action: 'register' } }
        ]


@appmod = appmod
