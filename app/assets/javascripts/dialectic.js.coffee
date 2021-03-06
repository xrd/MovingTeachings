class DialecticCtrl
        constructor: ( $scope, $timeout, Favorite, Dialectic, Route ) ->
                $scope.modals = {}
                $scope.focused = {}
                $scope.resetDialectic = () ->
                        $scope.dialectic = {}
                        $scope.dialectic.days = {}

                $scope.prereq = {}
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

                $scope.iconFromType = (type) ->
                        switch type
                                when "map" then 'icon-map-marker'
                                when "book" then 'icon-book'
                                when "link" then 'icon-bookmark'

                $scope.openPrereq = (prereq) ->
                        switch prereq.ptype
                                when "map"
                                        $scope.focused.map = $scope.center = prereq
                                        $scope.openMapDialog()

                $scope.register = (dialectic) ->
                        unless $scope.loggedIn
                                $scope.openDialog( "login" )
                        else
                                $scope.openRegistrationDialog(dialectic)

                $scope.openDialog = (type) ->
                        $scope.modals = {}
                        $scope.modals.includes = {}
                        $scope.modals[type] = true
                        $scope.modals.includes[type] = "/tmpl/modals/#{type}"

                $scope.openRegistrationDialog = (dialectic) ->
                        $scope.registered = false
                        Route.stops {id: dialectic.route_id}, (response) ->
                                $scope.stops = response
                        $scope.openDialog( 'registration' )
                        $scope.registering = dialectic

                $scope.confirmRegistration = () ->
                        Dialectic.register { id: $scope.registering.id }, {}, (response) ->
                                $scope.registered = true
                                $scope.registering = undefined
                                $timeout ( () -> $scope.modals = {} ), 5000

                $scope.openMapDialog = () ->
                        $scope.openDialog( 'map' )
                        $scope.$broadcast 'clearMap'

                $scope.openMapDialogForPrereq = () ->
                        $scope.center = $scope.stop
                        $scope.openDialog( 'map' )

                $scope.openBooksDialog = () ->
                        $scope.openDialog( 'book' )
                        $scope.prereq.type == "book"
                        $scope.$broadcast 'clearBooks'

                times = () ->
                        rv = []
                        for x in [0..24]
                                for y in [ 0, 15, 30, 45 ]
                                        out = sprintf( "%02d:%02d", x, y )
                                        rv.push out
                        rv

                $scope.times = times()

                $scope.removePrereq = (item) ->
                        if -1 != ( toRemove = $scope.dialectic.prereqs.indexOf( item ) )
                                $scope.dialectic.prereqs.splice toRemove, 1

                $scope.addMapPrerequisite = (item) ->
                        item.lat = item.geometry.location.$a
                        item.lng = item.geometry.location.ab
                        item.name = item.name
                        item.ptype = "map"
                        $scope.addPrerequisite( item )

                $scope.addPrerequisite = ( item ) ->
                        $scope.dialectic.prereqs ||= []
                        $scope.dialectic.prereqs.push item
                        console.log "Adding item as prerequisite (#{$scope.dialectic.prereqs.length})"
                        $scope.prereq = {}
                        $scope.modals = {}

                $scope.toggle = (dialectic) ->
                        dialectic.saved = !dialectic.saved

                $scope.useTemplate = () ->
                        confirmed = true
                        if $scope.dialectic.description
                                confirmed = confirm "You have something in the description. Using the template will over write what you have there now. Continue?"
                        if confirmed
                                $scope.dialectic.description = "# A special class #\n\nTell us all about it\n\n>This is a quote about the class"

                $scope.create = () ->
                        if $scope.dialectic.title and $scope.dialectic.description and $scope.route
                                console.log "Creating a class"
                                $scope.dialectic.route_id = $scope.route.id
                                $scope.dialectic.days = $scope.days
                                Dialectic.save {}, dialectic: $scope.dialectic, (response) ->
                                        $scope.created = true
                                        $scope.message = "Created your new class. New classes require approval, and we will notify you when your class has been approved"
                                        $scope.resetDialectic()
                                        $timeout ( () -> $scope.action = {}; $scope.created = false ), 3000
                        else
                                $scope.errors = "You must provide at least a title, description and choose a stop on a route"
                                $timeout ( () -> $scope.errors = "" ), 10000

                $scope.save = (dialectic) ->
                        console.log "Inside save"
                        Favorite.save {}, { dialectic_id: dialectic.id }, (response) ->
                                dialectic.message = "Saved to your favorites"
                                $timeout ( () -> dialectic.message = "" ), 3000

DialecticCtrl.$inject = [ "$scope", "$timeout", "Favorite", "Dialectic", "Route" ]
@DialecticCtrl = DialecticCtrl