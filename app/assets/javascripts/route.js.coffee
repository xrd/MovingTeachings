@appmod.config ($routeProvider, $locationProvider) ->
        LEARN = '/tmpl/dialectics/learn'
        TEACH = "/tmpl/dialectics/teach"
        $routeProvider.when '/learn/:dialectic_id', templateUrl: LEARN
        $routeProvider.when "/learn", templateUrl: LEARN
        $routeProvider.when '/locations/:location_id/:route_id', templateUrl: LEARN
        $routeProvider.when '/locations/:location_id', templateUrl: LEARN
        $routeProvider.when "/teach", templateUrl: TEACH
        $routeProvider.when '/favorites', templateUrl: '/tmpl/favorites/starred'
        $routeProvider.when '/share', templateUrl: '/tmpl/favorites/share'

        $routeProvider.when "/users/auth/:provider",  controller: AuthCtrl, templateUrl: "/welcome/login"
        $routeProvider.when '/', templateUrl: '/welcome/intro'
        $locationProvider.html5Mode true
