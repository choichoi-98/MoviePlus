$(document).ready(function(){
	let todayDate = $('#todayDateId').val();
	let selectedRoom = $('#selected-room-id').val();

	const ajax_data = { todayDate: todayDate, selectedRoom: selectedRoom }
	getScheduleList(ajax_data);
});

function getScheduleList(ajax_data) {
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
			console.log(data);

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
							output = '';
						}
					})
								
				})
			}

			$('.room-container').each(function (){
				if($(this).find('.table-schedule-item').length <= 0){
					$(this).find('table').remove();
					$(this).append('<div class="main__table-text">상영 등록된 영화가 없습니다.</div>');
				}
			})

			
		},
		error: function() {
			console.log('ajax 실패');
		} 
	})
}