

class MainCtrl
        constructor: ( $scope, Route, User, Dialectic ) ->

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

                $scope.loadSampleDialectics = () ->
                        Route.samples {}, (response) ->
                                $scope.samples = response

@MainCtrl = MainCtrl
