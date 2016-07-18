// General JavaScript and jQuery

$(document).on("turbolinks:load", function(){

	// Fade in page headers
	$("#static-header").delay(600).fadeIn(600);

  // Equalize index page icon box heights
  var iconboxHeight = 0;           
  $(".icon-box").each(function(){
    if ($(this).height() > iconboxHeight) { iconboxHeight = $(this).height(); }
  });         
  $(".icon-box").height(iconboxHeight);

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

  // elevateZoom jQuery plugin for product image
  $('#show-product-image').elevateZoom({
      responsive: true,
      scrollZoom: true,
      easing: true,
      zoomType: "lens",
      lensSize: 100,
      lensFadeIn: 300,
      lensFadeOut: 300,
      lensShape: "round"
  });

	// Raty jQuery Star Rating Plugin
	$('.rating').raty( { path: '/assets', scoreName: 'comment[rating]' });
	$('.rated').raty({ path: '/assets',
		readOnly: true,
	  score: function() {
	    return $(this).attr('data-score');
	  }
	});

  // Fade out alerts
  $(".alert").delay(2000).fadeOut(800);

});