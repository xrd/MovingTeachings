
Learn and teach mini-classes on the bus.  [http://movingteachings.com](http://movingteachings.com) [Video introduction](http://www.youtube.com/watch?v=JALJ5PSXPvc) 

Entered into the Google Places API competition in November of 2012.

Hightlights:
* Jasmine testing
* angular-ui
* Uses Google Places API
* Testacular
* AngularJS 1.1
* Rails asset pipeline (not sure if this works in production/minimized)
* Bootstrap

To run JS tests:

* Start guard to regenerate JS files from coffeescript
        bundle exec guard
* Start testacular
        testacular config/testacular.conf.js start --auto-watch --log-level debug
* Open a browser on localhost:8085
* Make code changes in either spec/coffee/*.coffee (spec files) or in the app/assets/javascript/*.coffee files


