@appmod.config ($routeProvider, $locationProvider) ->
        $routeProvider.when '/classes/teach', templateUrl: '/classes/teach'
        $routeProvider.when '/classes/learn', templateUrl: '/classes/learn'
        $routeProvider.when '/route/:id/classes', templateUrl: '/classes/classes'
        $routeProvider.when '/route/:id/stops', templateUrl: '/classes/stops'
        $routeProvider.when '/', templateUrl: '/home.html'
        $locationProvider.html5Mode true
