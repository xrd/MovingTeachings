@appmod.config ($routeProvider, $locationProvider) ->

        for route in [ 'teach', 'learn', 'favorites' ]
                $routeProvider.when "/#{route}/:first/:second", templateUrl: "/tmpl/dialectics/#{route}"
                $routeProvider.when "/#{route}/:first", templateUrl: "/tmpl/dialectics/#{route}"
                $routeProvider.when "/#{route}", templateUrl: "/tmpl/dialectics/#{route}"

        # $routeProvider.when '/favorites', templateUrl: '/favorites/starred'
        # $routeProvider.when '/share', templateUrl: '/favorites/share'
        # $routeProvider.when '/locations/:location_id/:route_id', templateUrl: '/learn'
        # $routeProvider.when '/locations/:location_id', templateUrl: '/learn'
        # $routeProvider.when '/learn/:dialectic_id', templateUrl: '/learn'
        # $routeProvider.when '/learn', templateUrl: '/learn'

        $routeProvider.when "/users/auth/:provider",  controller: AuthCtrl, templateUrl: "/welcome/login"
        $routeProvider.when '/', templateUrl: '/welcome/intro'
        $locationProvider.html5Mode true
