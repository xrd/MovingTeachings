class FavoriteCtrl
        constructor: ( $scope, Favorite ) ->
                Favorite.query {}, (response) ->
                        $scope.favorites = response

@FavoriteCtrl = FavoriteCtrl