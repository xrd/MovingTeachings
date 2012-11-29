

class MainCtrl
        constructor: ( $scope, Route, User, $window ) ->

                $scope.domain = "movingteachings.com"

                User.loggedIn {}, (response) ->
                        $scope.loggedIn = parseInt( response.loggedIn )

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
                        $scope.loading = true
                        Route.samples {}, (response) ->
                                $scope.samples = response

MainCtrl.$inject = [ "$scope", "Route", "User", "$window" ]
@MainCtrl = MainCtrl
