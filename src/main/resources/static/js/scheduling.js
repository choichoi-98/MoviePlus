$(document).ready(function(){
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");

	let theaterId = $('#input-theater-id').val();
	let roomId;
	let todayDate = $('#todayDateId').val();
	let theaterName = $('#selected-room-id').val();
	let theater_room_name;
	let movie_title;
	let movie_code;

	let selected_schedule_id;

	

	getScheduleList(); // 리스트 불러오기
		
	$('#todayDateId').change(function() {
		getScheduleList();
	}) // 날짜 변경시마다 불러오기
	

	$('.filter-li-room').click(function() {
		$('.room-container').css('display', 'none');
		var selected_room = $('#selected-room-id').val();

		if(selected_room == theaterName){
			$('.room-container').css('display', 'block');
			return true;
		}

		$('#theaterRoom-' + selected_room).parent().css('display', 'block');

		
	})

	$('.main__table-btn--banned').click(function(){ // 추가 모달 클릭
		getOpenMoiveList();

		roomId = $(this).next().next().val();
		theater_room_name = $(this).next().val();
		$('#modal-room-name').val(theater_room_name);
	
	})

	$('body').on('click', '.modal-movie-select', function() { // 영화 선택
		movie_title = $(this).text();
		movie_code = $(this).prev().text();

		$('.modal-movie-code').val(movie_code);

		$('#modal-movie-title').val(movie_title);
		$('#update-modal-movie-title').val(movie_title);
	})

	$('.modal-keyword').keypress(function (){ 
		getOpenMoiveList();
	});

	$('#change-status-modal-btn').click(function() { // 추가 모달 확인 버튼
		addSchedule();
			
	})

	$('.main__table').on('click', '.main__table-btn--edit', function() { // 모달 수정 시작 버튼
		selected_schedule_id = $(this).parent().find('#selected-schedule-id').val();
		getOpenMoiveList();

		getSchedule();
	})

	$('#update-schedule-modal-btn').click(function() { // 모달 수정 확인 버튼
		updateSchedule();
	})

	$('.main__table').on('click', '.main__table-btn--delete', function() { // 삭제 시작 버튼
		selected_schedule_id = $(this).parent().find('#selected-schedule-id').val();
	})

	$('#delete-schedule-modal-btn').click(function() { // 모달 삭제 확인 버튼
		deleteSchedule();	
	})





function getScheduleList() { // 스케줄 전체 목록
	todayDate = $('#todayDateId').val();
	$('.no-schedule').remove();
	$('.tbody-schedule').empty();

	const getSchedule_data = { todayDate: todayDate }

	$.ajax({
		type : "POST",
		url: "getScheduleList",
		data: getSchedule_data,
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
							var output = '<tr class="table-schedule-item">';
							output += '<td><div class="main__table-text"><a href="#">'+item.movie_TITLE+'</a></div></td>';
							output += '<td><div class="main__table-text main__table-text--rate">1/250</div></td>';
							output += '<td><div class="main__table-text">'+item.theater_SCHEDULE_START+' ~ '+item.theater_SCHEDULE_END +'</div></td>';
							output += '<td><div class="main__table-btns"><input type="hidden" id="selected-schedule-id" value='+item.theater_SCHEDULE_ID+'><input type="hidden" id="selected-schedule-id" value='+item.theater_R+'><a href="#modal-update" class="main__table-btn main__table-btn--edit open-modal"> <i class="icon ion-ios-create"></i></a>';
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


function getOpenMoiveList() {
	$('.movieListAllTable').empty();


	var keyword = $('.modal-keyword').val();
	const getMovie_data = {
		keyword: keyword
	}

	$.ajax({
		type : "POST",
		url: "getOpenMovieList",
		data: getMovie_data,
		cache: false,
		beforeSend : function(xhr){
			xhr.setRequestHeader(header, token);
		},
		success: function(data) {
			if(data.length > 0){
				$(data).each(function(index, item) {
					movieItem = '<tr style="color: white;"><td>'+item.movie_Code+'</td><td class="modal-movie-select"><a href="#">'+item.movie_Title+'</a></td></tr>';
					$('.movieListAllTable').append(movieItem);
				})
			}
			
		},
		error: function() {
			console.log('영화실패');
		} 
	})
}


function addSchedule() {
	const schedule_data = {
		THEATER_ID : Number(theaterId),
		THEATER_SCHEDULE_DATE : todayDate,
		THEATER_ROOM_NAME : theater_room_name,
		THEATER_ROOM_ID : Number(roomId),
		MOVIE_CODE : $('#modal-movie-code').val(),
		MOVIE_TITLE : movie_title,
		THEATER_SCHEDULE_START : $('#movie-start').val(),
		THEATER_SCHEDULE_TYPE : $('input[name=jojosimya]:checked').val()
	}


	$.ajax({
		type : "POST",
		url: "addSchedule",
		data: schedule_data,
		cache: false,
		beforeSend : function(xhr){
			xhr.setRequestHeader(header, token);
		},
		success: function(data) {
			if(data > 0) {
				getScheduleList();
				$('.modal__btn--dismiss').click();
			}else {
				$('#text-container').empty().append("<span style='color:red'>중복된 시간 설정입니다.</span>");
			}
			
		},
		error: function() {
			$('#text-container').empty().append("<span style='color:red'>빈 칸을 입력해주세요.</span>");
		} 
	})	

}


function deleteSchedule() {

	$.ajax({
		type : "POST",
		url: "deleteSchedule",
		data: {
			scheduleId : selected_schedule_id
		},
		cache: false,
		beforeSend : function(xhr){
			xhr.setRequestHeader(header, token);
		},
		success: function(data) {
			getScheduleList();
			$('.modal__btn--dismiss').click();
			
		},
		error: function() {
			console.log('스케줄 삭제 실패');
		} 
	})
}


function getSchedule(){

	$.ajax({
		type : "POST",
		url : "getSchedule",
		data : { 
			scheduleId : selected_schedule_id
		},
		cache: false,
		beforeSend : function(xhr){
			xhr.setRequestHeader(header, token);
		},
		success: function(data) {
			$('#update-modal-room-name').val(data.theater_ROOM_NAME);
			$('#update-modal-movie-title').val(data.movie_TITLE);
			$('#update-movie-start').val(data.theater_SCHEDULE_START);
			$('#update-modal-movie-code').val(data.movie_CODE);

			$('.update-time-sale-btn').prop('checked', false);

			$('.update-time-sale-btn').each(function() {
				if($(this).val() == data.theater_SCHEDULE_TYPE){
					$(this).prop('checked', true);
				}

			})
		},
		error: function() {
			console.log('스케줄 얻어오기 실패');
		} 

		
	})
}

function updateSchedule(){

	$.ajax({
		type : "POST",
		url : "updateSchedule",
		data : { 
			THEATER_SCHEDULE_ID : selected_schedule_id,
			MOVIE_CODE : $('#update-modal-movie-code').val(),
			THEATER_SCHEDULE_START : $('#update-movie-start').val(),
			THEATER_SCHEDULE_TYPE : $('input[name=update-jojosimya]:checked').val()
		},
		cache: false,
		beforeSend : function(xhr){
			xhr.setRequestHeader(header, token);
		},
		success: function(data) {
			getScheduleList();
			$('.modal__btn--dismiss').click();
		},
		error: function() {
			console.log('스케줄 수정 실패');
		} 

		
	})
}

});
