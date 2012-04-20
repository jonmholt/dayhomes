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
//= require bootstrap
//= require fullcalendar
//= require_tree ./gmaps4rails
//= require jquery.ui
//= require jquery.ui.timepicker
//= require jquery.add_more
//= require jquery.colorbox
//= require jquery.slider
//= require jquery.modal
//= require jquery.rest
//= require rails.validations
//= require jquery-star-rating
//= require externals/modernizr
//= require externals/html5support/jquery.html5support

$.ajaxSetup({
    beforeSend: function(xhr) {
        xhr.setRequestHeader("Accept", "text/javascript");
    }
});

function log(text) {
  if(window && window.console) console.log(text);
}