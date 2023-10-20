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
	var selected_theater_id = $('#ajax-theaterId').val();
	var selected_date = $('#timetable-date-div button').eq(1).attr('data-selectedDate');


	$('#selected-value-title').text($('#tab-movieList li').eq(0).find('.btn').text());

	getMovieScheduleWithTheater();

	
	//날짜 선택
	$('#timetable-date-div button').click(function(e){
		e.preventDefault();
		$('#timetable-date-div button').removeClass('on');
		$(this).addClass('on');
		selected_date = $(this).attr('data-selectedDate');

		
		getMovieScheduleWithTheater();
	})

	//메뉴---

	function getMovieScheduleWithTheater(){
		$.ajax({
            type: "POST",
            url: "/movieplus/booking/getMovieScheduleWithTheater",
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
					schedule_output += '<a href="/movieplus/booking/" title="영화예매하기"><div class="ico-box"><i class="iconset ico-'+jojosimya_icon+'"></i></div>';
					schedule_output += '<p class="time">'+schedule.theater_SCHEDULE_START+'</p><p class="chair">'+(Number(schedule.theater_ROOM_SEAT_CNT)-Number(schedule.theater_SCHEDULE_BOOKED_CNT))+'석</p>';
					schedule_output += '<div class="play-time"><p>'+schedule.theater_SCHEDULE_START+'~'+schedule.theater_SCHEDULE_END+'</p><p>'+(Number(schedule.theater_ROOM_SEAT_CNT)-Number(schedule.theater_SCHEDULE_BOOKED_CNT))+'석</p></div>';
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