$(document).ready(function(){
	
	// 주말 색깔 칠해주기
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

	// csrf
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");

	var bigMenuChk = true; // true = 영화별, false = 극장별
	

	//첫 화면 메뉴바 on 설정
	$('#tab-theaterList li').eq(0).find('.btn').addClass('on');
	$('#tab-movieList li').eq(0).find('.btn').addClass('on');
	$('#tab-list-location li').eq(0).find('.location-tab').addClass('on');
	$('#tab-list-location-section div').eq(0).addClass('on');
	$('.location-select-tab').eq(0).addClass('on');
	$('#timetable-date-div button').eq(1).addClass('on');


	//입장 시 기본 값 설정
	var selected_movieCode = $('#tab-movieList li').eq(0).find('.btn').attr('data-moviecode');
	var selected_date = $('#timetable-date-div button').eq(1).attr('data-selectedDate');
	var selected_location = '서울';

	$('#selected-value-title').text($('#tab-movieList li').eq(0).find('.btn').text());

	getMovieScheduleWithMovie();

	//극장 타임 테이블 
	var selected_theater_id;
	//극장 타임 테이블


	//상영시간표 시작




	//극장 선택 버튼(영화쪽 작은 메뉴)
	$('#tab-left-area-theater').click(function() {
		$('div.movie-choice-area > div.tab-left-area > ul > li').removeClass('on');
		$(this).parent().addClass('on');
		$('#masterMovie').removeClass('on');
		$('#masterBrch').addClass('on');
		$('#tab10').addClass('on');
	})
	
	//극장 메뉴 큰 지역 선택
	$('.location-tab').click(function(e) {
		e.preventDefault();

		$('.location-tab').removeClass('on');
		$(this).addClass('on');

		$('.tab-layer-cont').removeClass('on');
		
		var selected_id = $(this).prop('id').substring(4,5);
		

		$('#tab-'+selected_id).addClass('on');
	})

	//극장 메뉴 극장 선택
	$('#tab-theaterList li .btn').click(function(e){
		e.preventDefault();
		$('#tab-theaterList li .btn').removeClass('on');
		$(this).addClass('on');

		selected_theater_id = $(this).attr('data-theaterid');
		$('#selected-value-title').text($(this).text());
		//ajax
		getMovieScheduleWithTheater();

		
	})

	//큰 메뉴(영화)
	$('#tab-left-area-movie').click(function(e) {
		e.preventDefault();

		$('#tab-movieList li .on').trigger('click');
		
		$('div.movie-choice-area > div.tab-left-area > ul > li').removeClass('on');
		$(this).parent().addClass('on');
		$('#masterBrch').removeClass('on');
		$('#masterMovie').addClass('on');
		$('.tab-layer-cont').removeClass('on');
		$('#masterMovie_AllMovie').addClass('on');

		$('#timeTable-location-select').css('display', 'block');
		bigMenuChk = true;

	})


	//큰 메뉴(극장)
	$('#tab-left-area-theater').click(function(e) {
		e.preventDefault();
	
		$('#tab-theaterList li .on').trigger('click');
		$('#tab-0').addClass('on');

		$('#timeTable-location-select').css('display', 'none');
		bigMenuChk = false;
	})
	
	//영화쪽 작은 지역 선택
	$('.location-select-tab').click(function(e) {
		e.preventDefault();
		$('.location-select-tab').removeClass('on');
		$(this).addClass('on');
		selected_location = $(this).attr('data-selected-loc');

		getMovieScheduleWithMovie();
	})

	//날짜 선택
	$('#timetable-date-div button').click(function(e){
		e.preventDefault();
		$('#timetable-date-div button').removeClass('on');
		$(this).addClass('on');
		selected_date = $(this).attr('data-selectedDate');

		if(bigMenuChk){
			getMovieScheduleWithMovie();
		}else{
			getMovieScheduleWithTheater();
		}
		
	})

	//메뉴---


	//영화 선택---

	$('#tab-movieList li button').click(function(){	
		$('#selected-value-title').text($(this).text());
		selected_movieCode = $(this).attr('data-movieCode');
		$('#tab-movieList li .btn').removeClass('on');
		$(this).addClass('on');
		
		getMovieScheduleWithMovie();
	})


	function getMovieScheduleWithMovie(){
        $.ajax({
            type: "POST",
            url: "getMovieScheduleWithMovie",
            data: {
                movieCode : selected_movieCode,
				date : selected_date,
				location : selected_location
            },
            cache: false,
            beforeSend : function(xhr){
                xhr.setRequestHeader(header, token);
            },
            success: function (data) {
				$('.timeTable-theater-list').remove();

				if(data.scheduleList.length == 0){
					$('#theater-list-box').append("<div class='timeTable-theater-list'><div>상영중인 영화가 없습니다.</div></div>");
				}

				$('#selected_movie_poster').prop('title', data.selected_movie.movie_Title+' 상세보기');

				if(data.selected_movie.movie_Poster != null) {
					var poster = data.selected_movie.movie_Poster;
					var poster_index = poster.indexOf('|');

					if(poster_index!=-1){
						poster = poster.substring(0, poster_index);	
					}

					$('#selected_movie_poster img').attr('src', poster);
				}else {
					$('#selected_movie_poster img').attr('src', '');
				}

				//극장, 상영관, 스케쥴 순서대로 값 가져와서 each
				$(data.theaterList).each(function(theater_index, theater){
					
					var theater_output = '<div class="theater-list timeTable-theater-list" data-theater-index="'+theater.theater_ID+'">';
					theater_output += '<div class="theater-area-click">';
					theater_output += '<a href="/movieplus/theater/detail?theaterId='+theater.theater_ID+'" title="'+theater.theater_NAME+' 상세보기">'+theater.theater_NAME+'</a></div></div>';
					
					$('#theater-list-box').append(theater_output);
				})					

				
					$(data.theaterRoomList).each(function(theaterRoom_index, theaterRoom) {
						var theaterRoom_output = '<div class="theater-type-box">';
						theaterRoom_output += '<div class="theater-type">';
						theaterRoom_output += '<p class="theater-name">' + theaterRoom.theater_ROOM_NAME + '</p>';
						theaterRoom_output += '<p class="chair">' + theaterRoom.theater_ROOM_SEAT_CNT + '석</p></div>';
						theaterRoom_output += '<div class="theater-time">';
						theaterRoom_output += '<div class="theater-time-box"><table class="time-list-table timeTable-table" data-room-index="'+theaterRoom.theater_ROOM_ID+'"><tbody><tr></tr></tbody></table></div></div></div>';
					
						var theaterIndex = theaterRoom.theater_ID;
						var $theaterList = $('.timeTable-theater-list[data-theater-index="' + theaterIndex + '"]');
					
						if ($theaterList.length > 0) {
							$theaterList.append(theaterRoom_output);
						}
					});
				
				

				$(data.scheduleList).each(function(schedule_index, schedule){
					var jojosimya = schedule.theater_SCHEDULE_TYPE
					var jojosimya_icon;
					switch(jojosimya){
						case 'normal':
							jojosimya_icon = 'off';
							break;
						case 'jojo':
							jojosimya_icon = 'sun';
							break;
						case 'simya':
							jojosimya_icon = 'moon';
							break;
					}


					var schedule_output = '<td class="">';
					schedule_output += '<div class="td-ab">';
					schedule_output += '<div class="txt-center">';
					schedule_output += '<a href="/movieplus/booking/seat?scheduleId='+schedule.theater_SCHEDULE_ID+'" title="영화예매하기"><div class="ico-box"><i class="iconset ico-'+jojosimya_icon+'"></i></div>';
					schedule_output += '<p class="time">'+schedule.theater_SCHEDULE_START+'</p><p class="chair">219석</p>';
					schedule_output += '<div class="play-time"><p>'+schedule.theater_SCHEDULE_START+'~'+schedule.theater_SCHEDULE_END+'</p><p>219석</p></div>';
					schedule_output += '</a></div></div></td>';

					var roomIndex = schedule.theater_ROOM_ID;
					var $roomList = $('.timeTable-table[data-room-index="' + roomIndex + '"]');

					$roomList.find('tr').append(schedule_output);
	
					
					
				})
			
			
				
            },
            error: function() {	
                console.log('영화 ajax 실패');
            } 
        });
    }


	function getMovieScheduleWithTheater(){
		$.ajax({
            type: "POST",
            url: "getMovieScheduleWithTheater",
            data: {
				date : selected_date,
				theaterId : selected_theater_id
            },
            cache: false,
            beforeSend : function(xhr){
                xhr.setRequestHeader(header, token);
            },
            success: function (data) {
				console.log(data);
				$('.timeTable-theater-list').remove();

				if(data.scheduleList.length == 0){
					$('#theater-list-box').append("<div class='timeTable-theater-list'><div>상영중인 영화가 없습니다.</div></div>");
				}

				$(data.movieList).each(function(movie_index, movie){
					var movie_grade;

					switch(movie.movie_Grade){
						case '청소년관람불가':
							movie_grade = '19';
							break;
						case '15세이상관람가':
							movie_grade = '15';
							break;
						case '12세이상관람가':
							movie_grade = '12';
							break;
						case '전체관람가':
							movie_grade = 'all';
							break;
						default:
							movie_grade = 'all';
							break;
					}

					
					var movie_output = '<div class="theater-list timeTable-theater-list" data-theater-index="'+movie.movie_Code+'">';
					movie_output += '<div class="theater-tit"><p class="movie-grade age-'+movie_grade+'"></p>';
					movie_output += '<p><a href="/movieplus/movie/movieDetail?movieCode='+movie.movie_Code+'" title="'+movie.movie_Title+' 상세보기">'+movie.movie_Title+'</a></p>';
					movie_output += '<p class="infomation"><span>'+movie.movie_Screen+'</span>/상영시간 '+movie.movie_Runtime+'분</p></div></div>';
					
					$('#theater-list-box').append(movie_output);
				})			

				const tempMap = new Map();

				

				$(data.scheduleList).each(function(index, schedule) {
					$(data.theaterRoomList).each(function(index2, theaterRoom){
						if(schedule.theater_ROOM_ID == theaterRoom.theater_ROOM_ID){
							if($('.theater-type-box[data-room-index="'+theaterRoom.theater_ROOM_ID+'"]').length>0){
								if($('.theater-type-box[data-room-index="'+theaterRoom.theater_ROOM_ID+'"]').parent().attr('data-theater-index') == schedule.movie_CODE){
									return;
								}
							}
							var theaterRoom_index_output = '<div class="theater-type-box" data-room-index="'+theaterRoom.theater_ROOM_ID+'">';

							
							var $theaterRoomHead = $('.timeTable-theater-list[data-theater-index="' + schedule.movie_CODE + '"]');
							$theaterRoomHead.append(theaterRoom_index_output);
							}
					})
					
				})


				$(data.theaterRoomList).each(function(theaterRoom_index, theaterRoom) {
					var theaterRoom_output = '<div class="theater-type">';
					theaterRoom_output += '<p class="theater-name">' + theaterRoom.theater_ROOM_NAME + '</p>';
					theaterRoom_output += '<p class="chair">' + theaterRoom.theater_ROOM_SEAT_CNT + '석</p></div>';
					theaterRoom_output += '<div class="theater-time">';
					theaterRoom_output += '<div class="theater-time-box"><table class="time-list-table timeTable-table" data-room-index="'+theaterRoom.theater_ROOM_ID+'"><tbody><tr></tr></tbody></table></div></div>';
				
					var $theaterRoomBody = $('.theater-type-box[data-room-index="'+theaterRoom.theater_ROOM_ID+'"]');
					$theaterRoomBody.append(theaterRoom_output);
					
				});

			
				$(data.scheduleList).each(function(schedule_index, schedule){
					var jojosimya = schedule.theater_SCHEDULE_TYPE
					var jojosimya_icon;
					switch(jojosimya){
						case 'normal':
							jojosimya_icon = 'off';
							break;
						case 'jojo':
							jojosimya_icon = 'sun';
							break;
						case 'simya':
							jojosimya_icon = 'moon';
							break;
					}


					var schedule_output = '<td class="">';
					schedule_output += '<div class="td-ab">';
					schedule_output += '<div class="txt-center">';
					schedule_output += '<a href="/movieplus/booking/seat?scheduleId='+schedule.theater_SCHEDULE_ID+'" title="영화예매하기"><div class="ico-box"><i class="iconset ico-'+jojosimya_icon+'"></i></div>';
					schedule_output += '<p class="time">'+schedule.theater_SCHEDULE_START+'</p><p class="chair">219석</p>';
					schedule_output += '<div class="play-time"><p>'+schedule.theater_SCHEDULE_START+'~'+schedule.theater_SCHEDULE_END+'</p><p>219석</p></div>';
					schedule_output += '</a></div></div></td>';


					var $roomIndex = $('.timeTable-theater-list[data-theater-index="' + schedule.movie_CODE + '"]').find('.timeTable-table[data-room-index="' + schedule.theater_ROOM_ID + '"]');

					$roomIndex.find('tr').append(schedule_output);
	
					
					
				})

				
				
            },
            error: function() {	
                console.log('극장 ajax 실패');
            } 
        });
	}
});