class AuthCtrl
        constructor: ($scope, $route, $routeParams, $window) ->
                $window.location.href = "/users/auth/#{$routeParams.provider}"

@AuthCtrl = AuthCtrl