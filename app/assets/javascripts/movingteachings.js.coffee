

class MainCtrl
        constructor: ( $scope, Route, User, Dialectic, $window ) ->

                User.loggedIn {}, (response) ->
                        $scope.loggedIn = response.loggedIn

                $scope.register = (dialectic) ->
                        unless $scope.loggedIn
                                $('.login .btn').tooltip("toggle")
                        else
                                Dialectic.register { dialectic: dialectic.id }, (response) ->
                                        console.log "Registered!"

                $scope.mkdwn = (text) ->
                        out = ""
                        out = markdown.toHTML( text ) if text
                        out

                $scope.logout = () ->
                        alert "Logging off"
                        User.logout {}, (response) ->
                                alert "Logged off, redirecting"
                                $window.location.href = "/reload"

                $scope.loadSampleDialectics = () ->
                        Route.samples {}, (response) ->
                                $scope.samples = response

@MainCtrl = MainCtrl
