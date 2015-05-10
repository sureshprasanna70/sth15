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
//= require jquery.turbolinks
//= require turbolinks
//= require_tree .
$(document).ready(function(){


	$('.feed').click(function(){

		$(this).toggleClass('normal');
		var pos=$(this).offset().top;
		$(document).scrollTop(pos);

	})

	$('.starRatings a').click(function(event){


		event.stopPropagation();


		$(this).find('span').removeClass('glyphicon-star-empty').end();
		$(this).find('span').addClass('glyphicon-star blueStar').end();      
		$(this).prevAll('a').find('span').removeClass('glyphicon-star-empty').end().end();

		$(this).prevAll('a').find('span').addClass('glyphicon-star blueStar').end().end();





	})

	$('.feed textarea').click(function(event){

		event.stopPropagation();

	})

var starCount=Number($('.starRatingsGot').find("div:not(.not_rated)").attr('class').split('.')[0]);
	for(var i=0;i<2;i++){$('.starRatingsGot').find("div:not(.not_rated)").append('<img src="/assets/star-on.png"></img>	');}
for(var i=0;i<=4;i++){$('.starRatingsGot').find("div.not_rated").append('<img class="spaced" src="/assets/star-off.png"></img>');}
});

