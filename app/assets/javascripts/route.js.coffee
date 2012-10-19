@appmod.config ($routeProvider, $locationProvider) ->
        $routeProvider.when '/teach', templateUrl: '/teach'
        $routeProvider.when '/favorites', templateUrl: '/favorites/starred'
        $routeProvider.when '/share', templateUrl: '/favorites/share'
        $routeProvider.when '/locations/:location_id/:route_id', templateUrl: '/learn'
        $routeProvider.when '/locations/:location_id', templateUrl: '/learn'
        $routeProvider.when '/learn/:dialectic_id', templateUrl: '/learn'
        $routeProvider.when '/learn', templateUrl: '/learn'
        $routeProvider.when "/users/auth/:provider",  controller: AuthCtrl, templateUrl: "/welcome/login"
        $routeProvider.when '/', templateUrl: '/welcome/intro'
        $locationProvider.html5Mode true
