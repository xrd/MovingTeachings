@appmod.config ($routeProvider, $locationProvider) ->
        $routeProvider.when '/teach', templateUrl: '/teach'
        $routeProvider.when '/learn', templateUrl: '/learn'
        $routeProvider.when '/routes/:location_id/:route_id', templateUrl: '/learn'
        $routeProvider.when '/routes/:location_id', templateUrl: '/learn'
        $routeProvider.when "/users/auth/:provider",  controller: AuthCtrl, templateUrl: "/welcome/login"
        $routeProvider.when '/', templateUrl: '/welcome/intro'
        $locationProvider.html5Mode true
