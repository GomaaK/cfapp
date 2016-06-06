// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= jquery.turbolinks
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(document).on('ready page:load', function () {
	// Equalize product box title heights
    var titleHeight = 0;           
    $(".product-title").each(function(){
      if ($(this).height() > titleHeight) { titleHeight = $(this).height(); }
    });         
    $(".product-title").height(titleHeight);
    // Equalize product box author heights
    var authorHeight = 0;           
    $(".product-author").each(function(){
      if ($(this).height() > authorHeight) { authorHeight = $(this).height(); }
    });         
    $(".product-author").height(authorHeight);
});