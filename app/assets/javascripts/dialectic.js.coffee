class DialecticCtrl
        constructor: ( $scope, $timeout, Favorite ) ->
                console.log "Inside dialectic ctrl"

                $scope.toggle = (dialectic) ->
                        dialectic.saved = !dialectic.saved

                $scope.save = (dialectic) ->
                        Favorite.save {}, { dialectic_id: dialectic.id }, (response) ->
                                dialectic.message = "Saved to your favorites"
                                $timeout ( () -> dialectic.message = "" ), 3000

@DialecticCtrl = DialecticCtrl