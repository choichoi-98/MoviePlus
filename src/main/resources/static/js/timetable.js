$(document).ready(function(){
	
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	
	$('#tab-theaterList li').eq(0).find('.btn').addClass('on');
	$('#tab-movieList li').eq(0).find('.btn').addClass('on');
	$('#tab-list-location li').eq(0).find('.location-tab').addClass('on');
	$('#tab-list-location-section div').eq(0).addClass('on');
	$('.location-select-tab').eq(0).addClass('on');
	$('#timetable-date-div button').eq(1).addClass('on');

	var selected_movieCode = $('#tab-movieList li').eq(0).find('.btn').attr('data-moviecode');
	var selected_date = $('#timetable-date-div button').eq(1).attr('data-selectedDate');
	var selected_location = '서울';
	$('#selected-value-title').text($('#tab-movieList li').eq(0).find('.btn').text());

	getMovieScheduleWithMovie();

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
	

	$('.location-tab').click(function() {
		$('.tab-layer-cont').removeClass('on');
		var selected_id = $(this).prop('id').substring(4,5);
		

		$('#tab-'+selected_id).addClass('on');
	})

	$('#tab-left-area-movie').click(function() {
		$('.tab-layer-cont').removeClass('on');
		$('#masterMovie_AllMovie').addClass('on');
	})

	$('#tab-left-area-theater').click(function() {
		$('#tab-0').addClass('on');
	})

	$('.location-select-tab').click(function(e) {
		e.preventDefault();
		$('.location-select-tab').removeClass('on');
		$(this).addClass('on');
		selected_location = $(this).attr('data-selected-loc');

		getMovieScheduleWithMovie();
	})

	$('#timetable-date-div button').click(function(){
		$('#timetable-date-div button').removeClass('on');
		$(this).addClass('on');
		selected_date = $(this).attr('data-selectedDate');

		getMovieScheduleWithMovie();
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

				console.log(data);

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
					theater_output += '<a href="#" title="'+theater.theater_NAME+' 상세보기">'+theater.theater_NAME+'</a></div></div>';
					
					$('#theater-list-box').append(theater_output);
				})					

				$(data.theaterRoomList).each(function(theaterRoom_index, theaterRoom) {
					var theaterRoom_output = '<div class="theater-type-box">';
					theaterRoom_output += '<div class="theater-type">';
					theaterRoom_output += '<p class="theater-name">' + theaterRoom.theater_ROOM_NAME + '</p>';
					theaterRoom_output += '<p class="chair">' + theaterRoom.theater_ROOM_SEAT_TYPE + '</p></div>';
					theaterRoom_output += '<div class="theater-time">';
					theaterRoom_output += '<div class="theater-time-box"><table class="time-list-table timeTable-table" data-room-index="'+theaterRoom.theater_ROOM_ID+'"><tbody><tr></tr></tbody></table></div></div></div>';
				
					var theaterIndex = theaterRoom.theater_ID;
					var $theaterList = $('.timeTable-theater-list[data-theater-index="' + theaterIndex + '"]');
				
					if ($theaterList.length > 0) {
						$theaterList.append(theaterRoom_output);
					}
				});

				$(data.scheduleList).each(function(schedule_index, schedule){
					var schedule_output = '<td class="">';
					schedule_output += '<div class="td-ab">';
					schedule_output += '<div class="txt-center">';
					schedule_output += '<a href="" title="영화예매하기"><div class="ico-box"><i class="iconset ico-sun"></i></div>';
					schedule_output += '<p class="time">09:50</p><p class="chair">219석</p>';
					schedule_output += '<div class="play-time"><p>09:50~11:38</p><p>1회차</p></div>';
					schedule_output += '</a></div></div></td>';

					var roomIndex = schedule.theater_ROOM_ID;
					var $roomList = $('.timeTable-table[data-room-index="' + roomIndex + '"]');

					$roomList.find('tr').append(schedule_output);
	
					
					
				})
			
			
				
            },
            error: function() {	
                console.log('ajax 실패');
            } 
        });
    }


	//영화 선택---

	//날짜선택

	//상영시간표 끝
});