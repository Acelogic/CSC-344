$( document ).ready(function() {
    new TypeIt('#typeit', {
	}).go();
	
	new TypeIt('#typeit2', {
		speed: 10,
	  }).go(); 

});
	
$(window).on('load',function(){
var $win = $(window),
    w = 0,h = 0,
    top = [],
    bottom = [],
    getWidth = function() {
        w = $win.width();
        h = $win.height();
    };

$win.resize(getWidth).mousemove(function(e) {
    // Reduced Range from 255 to 100 to make the page more easier to read
    top = [
        Math.round(e.pageX/w * 100),
        Math.round(e.pageY/h * 100),
        150
    ];

     bottom = [
        Math.round(e.pageX/h * 100),
        Math.round(e.pageY/w * 100),
        150
    ];
   $(document.body).css('background', '-moz-linear-gradient(top, rgb('+top.join(',')+'), rgb('+bottom.join(',')+'))');
}).resize();

});
