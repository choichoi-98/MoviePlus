$(document).ready(function(){



	let todayDate = $('#todayDateId').val();
	let theaterName = $('#selected-room-id').val();

	getScheduleList();

		
	$('#todayDateId').change(function() {
		getScheduleList();
	})
	

	$('.filter-li-room').click(function() {
		$('.room-container').css('display', 'none');
		var selected_room = $('#selected-room-id').val();

		if(selected_room == theaterName){
			$('.room-container').css('display', 'block');
			return true;
		}

		$('#theaterRoom-' + selected_room).parent().css('display', 'block');

		
	})


});


function getScheduleList() {
	todayDate = $('#todayDateId').val();
	$('.no-schedule').remove();
	$('.tbody-schedule').empty();

	const ajax_data = { todayDate: todayDate }
	let token = $("meta[name='_csrf']").attr("content");
	let header = $("meta[name='_csrf_header']").attr("content");

	$.ajax({
		type : "POST",
		url: "getScheduleList",
		data: ajax_data,
		cache: false,
		beforeSend : function(xhr){
			xhr.setRequestHeader(header, token);
		},
		success: function(data) {
			if(data.length != 0){
				$('.room-container').each(function(){
					var $container = $(this);
					let id = $(this).prop('id').substr(12);
					
					$(data).each(function(index, item){
						if(id==item.theater_ROOM_ID){
							var output = '<tr class="table-schedule-item"><td><div class="main__table-text">1</div></td>';
							output += '<td><div class="main__table-text"><a href="#">'+item.movie_CODE+'</a></div></td>';
							output += '<td><div class="main__table-text main__table-text--rate">1/250</div></td>';
							output += '<td><div class="main__table-text">'+item.theater_SCHEDULE_STARTTIME+'</div></td>';
							output += '<td><div class="main__table-btns"><a href="#" class="main__table-btn main__table-btn--edit"> <i class="icon ion-ios-create"></i></a>';
							output += '<a href="#modal-delete" class="main__table-btn main__table-btn--delete open-modal"><i class="icon ion-ios-trash"></i></a>';
							output += '</div></td></tr>'

							
							$container.find('.main__table > tbody').append(output);
							$container.find('table').css("display", "table");
							output = '';
						}
					})
								
				})
			}

			$('.room-container').each(function (){
				if($(this).find('.table-schedule-item').length <= 0){
					$(this).find('table').css("display", "none");
					$(this).find('table tbody').empty();
					$(this).append('<div class="main__table-text no-schedule">상영 등록된 영화가 없습니다.</div>');
				}
			})

				//모달 바인딩
			$('.open-modal').magnificPopup({
				fixedContentPos: true,
				fixedBgPos: true,
				overflowY: 'auto',
				type: 'inline',
				preloader: false,
				focus: '#username',
				modal: false,
				removalDelay: 300,
				mainClass: 'my-mfp-zoom-in',
			});
			
		},
		error: function() {
			console.log('ajax 실패');
		} 
	})
}