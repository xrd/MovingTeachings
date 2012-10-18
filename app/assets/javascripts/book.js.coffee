class BookCtrl
        constructor: ( $scope, Book ) ->
                console.log "inside book ctrl"

                $scope.initialize = () ->
                        console.log "Initializing book ctrl"

                $scope.search = () ->
                        Book.search { text: $scope.searchText }, (results) ->
                                $scope.results = []
                                for item in results.ItemSearchResponse.Items.Item
                                        $scope.results.push { url: item.DetailPageURL, attributes: item.ItemAttributes, asin: item.ASIN, links: item.links }

                $scope.addBookAsPrerequisite = (book) ->
                        console.log "Adding book prereq, in book ctrl"
                        $scope.addPrerequisite { comment: book.attributes.Title, type: "book", link: book.url }
                        $scope.bookModal = false

BookCtrl.$inject = [ '$scope', 'Book' ]
@BookCtrl = BookCtrl
