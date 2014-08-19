// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui/effect-highlight
//= require turbolinks
//= require_tree .

jQuery(function($) {

  $(".btn-enable").on("ajax:success", function(xhr, data, status) {
      //console.log('ajax success');
      $(this).toggleClass('btn-success');
      $(this).toggleClass('btn-default');
      //console.log($(this).text());
      if ( $(this).text() == 'ON') {
      	$(this).html('OFF');
      } else {
      	$(this).html('ON');
      };
      //$(this).closest('tr').fadeIn(100).fadeOut(100).fadeIn(100).fadeOut(100).fadeIn(100);
      $(this).closest('tr').effect("highlight", {}, 1500);
  });

});