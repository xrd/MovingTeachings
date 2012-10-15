

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
                        User.logout {}, (response) ->
                                $window.location.href = "/reload"

                $scope.popDialog = () ->
                        $scope.dialog = true
                        $scope.dialogContents = "Hi there!"
                        # $('#overlay').css( 'visibility', "visible" )

                $scope.faq = () ->
                        $scope.popDialog()

                $scope.loadSampleDialectics = () ->
                        Route.samples {}, (response) ->
                                $scope.samples = response

MainCtrl.$inject = [ "$scope", "Route", "User", "Dialectic", "$window" ]
@MainCtrl = MainCtrl
