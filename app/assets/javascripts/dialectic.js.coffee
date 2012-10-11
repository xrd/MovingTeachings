class DialecticCtrl
        constructor: ($scope) ->
                $scope.toggle = (dialectic) ->
                        dialectic.saved = !dialectic.saved

                $scope.save = (dialectic) ->
                        console.log "Saving..."