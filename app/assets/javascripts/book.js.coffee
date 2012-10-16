class BookCtrl
        constructor: ( $scope, Book ) ->
                console.log "inside book ctrl"

                $scope.search = () ->
                        Book.search { text: $scope.searchText }, (results) ->
                                $scope.results = []
                                for item in results.ItemSearchResponse.Items.Item
                                        $scope.results.push { url: item.DetailPageURL, attributes: item.ItemAttributes, asin: item.ASIN, links: item.links }

BookCtrl.$inject = [ '$scope', 'Book' ]
@BookCtrl = BookCtrl
