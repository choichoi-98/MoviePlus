$(document).ready(function(){

	$('.booking-theater-li').click(function() {
		$('.booking-theater-li .btn').removeClass('on');
		$('.booking-theater-li .depth').removeClass('on');



		$(this).children().addClass('on');
		$(this).children().prev().addClass('on');
	})

	$('#liFavorBrch').trigger('click');

});