class DialecticCtrl
        constructor: ( $scope, $timeout, Favorite, Dialectic ) ->
                console.log "Inside dialectic ctrl"

                $scope.resetDialectic = () ->
                        $scope.dialectic = {}
                        $scope.dialectic.days = {}

                $scope.resetDialectic()
                $scope.days = [
                        { name: "Su" },
                        { name: "M" },
                        { name: "Tu" },
                        { name: "W" },
                        { name: "Th" },
                        { name: "F" },
                        { name: "Sa" } ]

                $scope.minOptions = [ 0...5 ]
                $scope.maxOptions = [ 2...10 ]

                times = () ->
                        rv = []
                        for x in [0..24]
                                for y in [ 0, 15, 30, 45 ]
                                        out = sprintf( "%02d:%02d", x, y )
                                        console.log out
                                        rv.push out
                        rv

                $scope.times = times()

                $scope.toggle = (dialectic) ->
                        dialectic.saved = !dialectic.saved

                $scope.useTemplate = () ->
                        confirmed = true
                        if $scope.dialectic.description
                                confirmed = confirm "You have something in the description. Using the template will over write what you have there now. Continue?"
                        if confirmed
                                $scope.dialectic.description = "# A special class #\n\nTell us all about it\n\n>This is a quote about the class"

                $scope.create = () ->
                        console.log "Creating a class"
                        $scope.dialectic.route_id = $scope.route.id
                        $scope.dialectic.days = $scope.days
                        Dialectic.save {}, dialectic: $scope.dialectic, (response) ->
                                $scope.created = true
                                $scope.message = "Created your new class. New classes require approval, and we will notify you when your class has been approved"
                                $scope.resetDialectic()
                                $timeout ( () -> $scope.doCreate = false; $scope.created = false ), 3000

                $scope.save = (dialectic) ->
                        Favorite.save {}, { dialectic_id: dialectic.id }, (response) ->
                                dialectic.message = "Saved to your favorites"
                                $timeout ( () -> dialectic.message = "" ), 3000

@DialecticCtrl = DialecticCtrl