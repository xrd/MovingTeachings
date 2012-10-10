@appmod.config ($routeProvider, $locationProvider) ->
        $routeProvider.when '/dialectics/teach', templateUrl: '/dialectics/teach.tmpl'
        $routeProvider.when '/dialectics/learn', templateUrl: '/dialectics/learn.tmpl'
        $routeProvider.when '/', templateUrl: '/home.html'
        $locationProvider.html5Mode true
