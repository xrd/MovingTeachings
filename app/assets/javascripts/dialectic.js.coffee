class DialecticCtrl
        constructor: ( $scope, $timeout, Favorite, Dialectic ) ->
                console.log "Inside dialectic ctrl"

                $scope.dialectic = {}

                $scope.toggle = (dialectic) ->
                        dialectic.saved = !dialectic.saved

                $scope.useTemplate = () ->
                        $scope.dialectic.description = "# A special class #\n\nTell us all about it\n\n>This is a quote about the class"

                $scope.create = () ->
                        console.log "Creating a class"
                        Dialectic.save {},
                                dialectic:
                                        title: $scope.dialectic.title,
                                        description: $scope.dialectic.description,
                                        route_id: $scope.route.id,
                                (response) ->
                                        console.log "Created it!"
                                        $scope.dialectic = {}
                                        $scope.doCreate = false


                $scope.save = (dialectic) ->
                        Favorite.save {}, { dialectic_id: dialectic.id }, (response) ->
                                dialectic.message = "Saved to your favorites"
                                $timeout ( () -> dialectic.message = "" ), 3000

@DialecticCtrl = DialecticCtrl