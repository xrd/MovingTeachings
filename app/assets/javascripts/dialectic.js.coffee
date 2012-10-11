class DialecticCtrl
        constructor: ( $scope, $timeout ) ->
                console.log "Inside dialectic ctrl"

                $scope.toggle = (dialectic) ->
                        dialectic.saved = !dialectic.saved

                $scope.save = (dialectic) ->
                        dialectic.message = "Saved to your favorites"
                        $timeout ( () -> dialectic.message = "" ), 3000
                        console.log "Saving..."

@DialecticCtrl = DialecticCtrl