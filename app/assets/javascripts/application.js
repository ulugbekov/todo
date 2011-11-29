// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require_tree .

$(function(){
	
	$("#error_explanation").remove();
	
	$("a[href='/todolists/new']").click(function(e) {
		
		if ($("div#remote form").length > 0 ) { return false; }
	})
	
	
	
	
	

	
	$(document).live("click", function(){ 
	$("div#alert").animate({opacity:0}, 2000) 
		
		}); 
	
	$("ul#todolist").sortable({ axis: 'y', handle:'span.handle', opacity: 0.5,  update: function() {
		$.post($(this).data('update-url'), $(this).sortable("serialize"))
	}});
	
	
	$(document).ajaxSuccess(function(event, request) {
	  var msg = request.getResponseHeader('X-Message');
	  if (msg) alert(msg);
	});
	
	
	
})
  