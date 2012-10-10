

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
                        if text
                                console.log "formatting: #{text}"
                                out = markdown.toHTML( text )
                                console.log "out: #{out}"
                        out

                $scope.loadSampleDialectics = () ->
                        Route.samples {}, (response) ->
                                $scope.samples = response

@MainCtrl = MainCtrl
