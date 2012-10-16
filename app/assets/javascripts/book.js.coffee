class BookCtrl
        constructor: ( $scope, Book ) ->
                console.log "inside book ctrl"

                $scope.search = () ->
                        Book.search { text: $scope.searchText }, (results) ->
                                $scope.results = results

BookCtrl.$inject = [ '$scope', 'Book' ]
@BookCtrl = BookCtrl
