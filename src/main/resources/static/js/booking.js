$(document).ready(function(){

	// 빠른 예매 시작
	function seat_alert() {
		$('.seat-count-before').css('display', 'none');
	}

	$('.seat-count').click(function() {
		seat_alert();
	})

	$('.seat-count-before').click(function() {
		seat_alert();	
	})

	$('.count > button.up').click(function() {
		var $count = $(this).prev().find('button');
		var currentValue = $count.text();

		if(currentValue >= 8) {
			return;
		}

		currentValue++;	
		$count.text(currentValue);
	})

	$('.count > button.down').click(function() {
		var $count = $(this).next().find('button');
		var currentValue = $count.text();

		if(currentValue <= 0) {
			return;
		}

		currentValue--;
		$count.text(currentValue);
	})
	//빠른 예매 끝

	//상영시간표 시작
    $('#tab-left-area-movie').click(function() {
		$('div.movie-choice-area > div.tab-left-area > ul > li').removeClass('on');
		$(this).parent().addClass('on');
		$('#masterBrch').removeClass('on');
		$('#masterMovie').addClass('on');
	})

	$('#tab-left-area-theater').click(function() {
		$('div.movie-choice-area > div.tab-left-area > ul > li').removeClass('on');
		$(this).parent().addClass('on');
		$('#masterMovie').removeClass('on');
		$('#masterBrch').addClass('on');
		$('#tab10').addClass('on');
	})
	



	//상영시간표 끝
});