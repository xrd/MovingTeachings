

class MainCtrl
        constructor: ( $scope, Route, User, Breadcrumbs, Dialectic ) ->
                $scope.breadcrumbs = Breadcrumbs

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

                $scope.loadSampleClasses = () ->
                        Route.samples {}, (response) ->
                                $scope.samples = response

@MainCtrl = MainCtrl
