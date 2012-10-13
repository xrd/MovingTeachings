// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require angular
//= require angular-resource
//= require angular-sanitize
//= require angular-ui
//= require app
//= require_tree .

// Strip the location hash if '#_=_' is included
//console.log( "Looking at hash: " + window.location.hash );
if (window.location.hash == '#_=_') {
  //console.log( "Stripping location hash, doh!" );
  window.location.hash = '';
}

