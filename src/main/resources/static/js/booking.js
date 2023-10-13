$(document).ready(function(){
	var checkCnt=0;
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

		if(checkCnt >= 8){
			return;
		}
		if(currentValue >= 8) {
			return;
		}

		currentValue++;	
		checkCnt++;
		$count.text(currentValue);
	})

	$('.count > button.down').click(function() {
		var $count = $(this).next().find('button');
		var currentValue = $count.text();

		if(currentValue <= 0) {
			return;
		}

		currentValue--;
		checkCnt--;
		$count.text(currentValue);
	})
	//빠른 예매 끝
});