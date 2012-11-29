class BookCtrl
        constructor: ( $scope, Book ) ->
                console.log "inside book ctrl"
                $scope.loading = false

                $scope.initialize = () ->
                        console.log "Initializing book ctrl"
                        $scope.loading = false

                $scope.search = () ->
                        $scope.loading = true
                        $scope.none = false
                        Book.search { text: $scope.searchText }, (results) ->
                                $scope.results = []
                                for item in results.ItemSearchResponse.Items.Item
                                        $scope.results.push { url: item.DetailPageURL, attributes: item.ItemAttributes, asin: item.ASIN, links: item.links }
                                $scope.loading = false
                                $scope.none = true unless $scope.results.length

                $scope.addBookAsPrerequisite = (book) ->
                        console.log "Adding book prereq, in book ctrl"
                        $scope.addPrerequisite { comment: book.attributes.Title, ptype: "book", link: book.url, name: book.attributes.Title }
                        $scope.bookModal = false

BookCtrl.$inject = [ '$scope', 'Book' ]
@BookCtrl = BookCtrl
