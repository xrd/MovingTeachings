appmod = angular.module 'movingteachings', [ 'ngResource', 'ngSanitize' ]

appmod.factory 'User', [ '$resource', ($resource) ->
        $resource "/users/:action", {},
                loggedIn: { method: 'GET', isArray: false, params: { action: 'loggedIn' } }
                logout: { method: 'DELETE', isArray: false, params: { action: 'sign_out' } }
                ]


appmod.factory 'Favorite', [ '$resource', ($resource) ->
        $resource "/favorites/:id/:action", {},
                star: { method: 'POST', isArray: false, params: { action: 'star' } }
                ]

appmod.factory 'Location', [ '$resource', ($resource) ->
        $resource "/locations/:id/:action", { id: '@id' },
                index: { method: 'GET', isArray: true },
                routes: { method: 'GET', isArray: true, params: { action: 'routes' } }
                ]

appmod.factory 'Route', [ '$resource', ($resource) ->
        $resource "/routes/:id/:action", { id: '@id' },
                routes: { method: 'GET', isArray: true },
                stops: { method: 'GET', isArray: true, params: { action: 'stops' } }
                dialectics: { method: 'GET', isArray: true, params: { action: 'dialectics' } }
                samples: { method: 'GET', isArray: true, params: { action: 'samples' } }
                alternatives: { method: 'GET', isArray: true, params: { action: 'alternatives' } }
        ]

appmod.factory 'Dialectic', [ '$resource', ($resource) ->
        $resource "/dialectic/:id/:action", { id: '@id' },
                register: { method: 'POST', isArray: false, params: { action: 'register' } }
        ]

appmod.config [ '$httpProvider', ($httpProvider) ->
        authToken = $('meta[name="csrf-token"]').attr('content')
        console.log "token: #{authToken}"
        $httpProvider.defaults.headers.common[ 'X-CSRF-TOKEN' ] = authToken
        ]

@appmod = appmod
