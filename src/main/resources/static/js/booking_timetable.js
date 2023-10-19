$(document).ready(function(){

	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");

	var movieSelectChk = false; // 영화가 선택되어 있는지
	var theaterSelectChk = false; // 극장이 선택되어 있는지
	
	var timetableDate = $('.timetable-date').eq(1).attr('data-date');
	var timetableMovie;
	var timetableTheater;

	var cnt;


	countTheaterAble(); // 지역별 활성화된 상영관 갯수
	
	//날짜
	$('.day-kr').each(function(){
		if($(this).text() == '토'){
			$(this).prev().css('color', 'blue');
			$(this).css('color', 'blue');
		}

		if($(this).text() == '일'){
			$(this).prev().css('color', 'red');
			$(this).css('color', 'red');
		}
	});

	//날짜 선택
	$('.timetable-date').click(function() {
		$('.timetable-date').removeClass('on');
		$(this).addClass('on');

		timetableDate = $(this).attr('data-date');
		movieSelectChk = false;
		theaterSelectChk = false;

		$('#playScheduleNonList').css('display', '');
		$('.booking-theater-li .btn').removeClass('on');
		$('.booking-theater-li .depth').removeClass('on');
		getOpenMovieListWithScheduleCnt(); // 영화 목록 불러오는 ajax
	})

	//화면 첫 진입 날짜 선택
	$('.timetable-date').eq(1).trigger('click');

	
	//극장 탭 ( 단순 메뉴 변경 )
	$('.booking-theater-li').click(function() {
		$('.booking-theater-li .btn').removeClass('on');
		$('.booking-theater-li .depth').removeClass('on');

		$(this).children().addClass('on');
		$(this).children().prev().addClass('on');
	})

	//화면 첫 진입 선호 극장 탭 선택
	$('#liFavorBrch').trigger('click');



	//영화 선택
	$('body').on('click', '.movie-timetable', function() {
		if($(this).find('.movie-select').prop('class').trim() == 'movie-select btn'){
			movieSelectChk = true;
	
			$('.movie-select').removeClass("on");
			$(this).find('button').attr('class','movie-select btn on'); // 메뉴 앞단 관련

			timetableMovie = $(this).attr('data-movieCode');

			if(!theaterSelectChk){ // 영화부터 선택한 경우

				getTheaterRoomListWithScheduleCnt();
		
				
			}else { // 극장 선택 이후 영화 선택한 경우
				getScheduleListByDateAndMovieCodeAndTheaterId();
			}
			$('#choiceMovieNone').empty().append($(this).find('.txt').text());
		}	
	})


	//극장 선택
	$('.theater-timetable').click(function() {
		if($(this).find('.theater-btn').prop('class').trim() != 'theater-btn disabled'){
			theaterSelectChk = true;

			$('.theater-btn').removeClass('on');
			$(this).find('.theater-btn').addClass('on');
			timetableTheater = $(this).attr('data-theaterId');

			if(movieSelectChk){ // 영화 선택 이후 극장 선택한 경우
							
				getScheduleListByDateAndMovieCodeAndTheaterId();
	
				
			}else { // 극장부터 선택한 경우	
				getScheduleListByTheaterIdAndDate();
			}
			$('#choiceBrchNone').empty().append($(this).text());
		}
	})
	// 스케줄 선택
	$('body').on('click', '#scheduleListResult li .btn', function() {
		var scheduleId = $(this).parent().attr('data-scheduleId');	
		
		location.href="/movieplus/booking/seat?scheduleId=" + scheduleId;
	});
	




	function countTheaterAble(){
		$('.theaterRoomCnt').each(function(){
				cnt = 0;
			$(this).parent().next().find('.theater-btn').each(function(){
				if($(this).prop('class')=='theater-btn'){
					
					cnt++;
	
				}
			})

			$(this).text('('+cnt+')');
		})
	}

	function getOpenMovieListWithScheduleCnt() {
		$.ajax({
            type: "POST",
            url: "/movieplus/booking/getOpenMovieListWithScheduleCnt",
            data: {
				date : timetableDate
            },
            cache: false,
            beforeSend : function(xhr){
                xhr.setRequestHeader(header, token);
            },
            success: function (data) {
				$('#movie-timetable-ul').empty();

				$(data).each(function(index, item) {
					var disable = '';
					if(item.movie_SCHEDULE_CNT == 0){
						disable = 'disabled';
					}

					var movie_output = '<li class="movie-timetable" data-movieCode="'+item.movie_Code+'">';
					movie_output += '<button type="button" class="movie-select btn '+disable+'">';
					movie_output += '<span class="movie-grade small age-'+item.grade_data+'">'+item.movie_Grade+'</span>';
					movie_output += '<i data-dib-index="'+item.movie_Code+'" class="iconset ico-heart-small">보고싶어 설정안함</i>';
					movie_output += '<span class="txt">'+item.movie_Title+'</span></button></li>';

					$('#movie-timetable-ul').append(movie_output);
	
					
				})

				getMovieDIBS() // 영화 목록 추가 이후 보고싶은 영화

				if($('#fast-movieCode').val() != 'none'){
					$('.movie-timetable').each(function(index, item){
						if($(item).attr('data-moviecode')==$('#fast-movieCode').val()){
							$(item).trigger('click');
						}
					})
				}

				

            },
            error: function() {	
                console.log('영화 불러오기 ajax 실패');
            } 
        });
	}

	function getTheaterRoomListWithScheduleCnt(){
        $.ajax({
            type: "POST",
            url: "/movieplus/booking/getTheaterRoomListWithScheduleCnt",
            data: {
                movieCode : timetableMovie,
				date : timetableDate
            },
            cache: false,
            beforeSend : function(xhr){
                xhr.setRequestHeader(header, token);
            },
            success: function (data) {
				$(data).each(function(index, room){
					$('.theater-btn').removeClass('disabled');
					$('.theater-timetable').each(function() {
						if($(this).attr('data-theaterId')!=room.theater_ID){
							$(this).find('.theater-btn').addClass('disabled');
						}
					})
				})

				countTheaterAble();
            },
            error: function() {	
                console.log('영화 ajax 실패');
            } 
        });
    }

	function getScheduleListByDateAndMovieCodeAndTheaterId(){
        $.ajax({
            type: "POST",
            url: "/movieplus/booking/getScheduleListByDateAndMovieCodeAndTheaterId",
            data: {
                movieCode : timetableMovie,
				date : timetableDate,
				theaterId : timetableTheater
            },
            cache: false,
            beforeSend : function(xhr){
                xhr.setRequestHeader(header, token);
            },
            success: function (data) {
				
				$('#scheduleListResult').empty();

				if(data.length > 0){
					$(data).each(function (index, item) {

						// if문으로 극장 먼저 선택된 상태일 시에 영화에 disabled 추가해주기
					
						var jojosimya = item.theater_SCHEDULE_TYPE
							var jojosimya_str;
							switch(jojosimya){
								case 'normal':
									jojosimya_str = '';
									break;
								case 'jojo':
									jojosimya_str = '<i class="iconset ico-sun" title="조조">조조</i>'
									break;
								case 'simya':
									jojosimya_str = '<i class="iconset ico-moon" title="심야">심야</i>'
									break;
							}
							var output = '<li data-scheduleId="'+item.theater_SCHEDULE_ID+'"><button type="button" class="btn">'; 
							output += '<div class="legend">'+jojosimya_str+'</div>'; 
							output += '<span class="time"><strong title="상영 시작">'+item.theater_SCHEDULE_START+'</strong><em title="상영 종료">~'+item.theater_SCHEDULE_END+'</em></span><span class="title">';
							output += '<strong title="'+item.movie_TITLE+'">'+item.movie_TITLE+'</strong></span>';
							output += '<div class="info"><span class="theater" title="극장">'+item.theater_NAME+'<br>'+item.theater_ROOM_NAME+'</span>';
							output += '<span class="seat"><strong class="now"title="잔여 좌석">0</strong><span>/</span><em class="all" title="전체 좌석">'+item.theater_ROOM_SEAT_CNT+'</em></span></div>';
							
							$('#scheduleListResult').append(output);
							$('#playScheduleNonList').css('display', 'none');
							$('#playScheduleNonList2').css('display', 'none');
					})
				}else {
					$('#playScheduleNonList2').css('display', 'block');
				}
				
            },
            error: function() {	
                console.log('영화 ajax 실패');
            } 
        });
    }
	
	function getScheduleListByTheaterIdAndDate(){
        $.ajax({
            type: "POST",
            url: "/movieplus/booking/getScheduleListByTheaterIdAndDate_ajax",
            data: {
                theaterId : timetableTheater,
				date : timetableDate
            },
            cache: false,
            beforeSend : function(xhr){
                xhr.setRequestHeader(header, token);
            },
            success: function (data) {
				$('#scheduleListResult').empty();
				if(data.length > 0){
					$(data).each(function (index, item) {
						
						var jojosimya = item.theater_SCHEDULE_TYPE
							var jojosimya_str;
							switch(jojosimya){
								case 'normal':
									jojosimya_str = '';
									break;
								case 'jojo':
									jojosimya_str = '<i class="iconset ico-sun" title="조조">조조</i>'
									break;
								case 'simya':
									jojosimya_str = '<i class="iconset ico-moon" title="심야">심야</i>'
									break;
							}
							var output = '<li data-scheduleId="'+item.theater_SCHEDULE_ID+'"><button type="button" class="btn">'; 
							output += '<div class="legend">'+jojosimya_str+'</div>'; 
							output += '<span class="time"><strong title="상영 시작">'+item.theater_SCHEDULE_START+'</strong><em title="상영 종료">~'+item.theater_SCHEDULE_END+'</em></span><span class="title">';
							output += '<strong title="'+item.movie_TITLE+'">'+item.movie_TITLE+'</strong></span>';
							output += '<div class="info"><span class="theater" title="극장">'+item.theater_NAME+'<br>'+item.theater_ROOM_NAME+'</span>';
							output += '<span class="seat"><strong class="now"title="잔여 좌석">1</strong><span>/</span><em class="all" title="전체 좌석">'+item.theater_ROOM_SEAT_CNT+'</em></span></div>';
							
							$('#scheduleListResult').append(output);
							$('#playScheduleNonList').css('display', 'none');
							$('#playScheduleNonList2').css('display', 'none');
					})
				}else {
					$('#playScheduleNonList2').css('display', 'block');
				}
            },
            error: function() {	
                console.log('영화 ajax 실패');
            } 
        });
    }

	function getMovieDIBS(){
        $.ajax({
            type: "POST",
            url: "/movieplus/booking/getMovieDIBS",
            cache: false,
            beforeSend : function(xhr){
                xhr.setRequestHeader(header, token);
            },
            success: function (data) {
				$(data).each(function(index, item){

					$('.ico-heart-small').each(function(index2, item2){
						if($(item2).attr('data-dib-index')==item.movie_Dibs_object){
							$(item2).attr('class', 'iconset ico-heart-on-small')
						}
					})

				})
            },
            error: function() {	
                console.log('영화dib ajax 실패');
            } 
        });
    }
});