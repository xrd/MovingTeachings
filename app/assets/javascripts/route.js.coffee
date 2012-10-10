@appmod.config ($routeProvider, $locationProvider) ->
        $routeProvider.when '/teach', templateUrl: '/teach'
        $routeProvider.when '/learn', templateUrl: '/learn'
        $routeProvider.when '/', templateUrl: '/welcome/intro'
        $locationProvider.html5Mode true
