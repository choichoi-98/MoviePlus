$(document).ready(function() {

	// 전체 영화 목록 가져오기
	
	let token = $("meta[name='_csrf']").attr("content");
   	let header = $("meta[name='_csrf_header']").attr("content");
   	console.log(token);
   	console.log(header);
   	
    $.ajax({
        url: 'movieListAll',
        type: 'POST',
        dataType: 'json', // JSON 데이터로 응답을 기대합니다.
        beforeSend : function(xhr)
        { //데이터를 전송하기 전에 헤더에 csrf값을 설정
         xhr.setRequestHeader(header, token);
        },
        success: function(movieList) {
            // 데이터를 테이블에 삽입
            var table = $('#movieListAllTable');
            var first10Movies = movieList.slice(0,10);
            first10Movies.forEach(function(movie) {
                var row = $('<tr>');
                row.css('color','white');
                row.append($('<td>').text(movie.movie_Code));
                row.append($('<td>').html('<a href="#">' + movie.movie_Title + '</a>'));
                row.append($('<td>').text(movie.movie_Screen));
                row.append($('<td>').html('<i class="icon ion-ios-star"></i> 9.2'));
                table.append(row);
            });
            console.log("영화 목록 가져오기 성공");
        },
        error: function() {
            console.log("영화 목록 가져오기 실패");
        }
    });//$.ajax({
	
	
	
    // movie db 최신화
    $("#updateDBButton").click(function(e) {
        $.ajax({
            url: 'http://localhost:9000/movieplus/movie',
            type: 'GET',
            async: false,
            success: function() {
                $.ajax({
                    url: 'http://localhost:9000/movieplus/movie/updateActors',
                    type: 'GET',
                    async: false,
                    success: function(response) {
                        console.log("두 번째: updateActors 성공!");
                        $.ajax({
                        url: 'http://localhost:9000/movieplus/testView',
                    	type: 'GET',
                   		async: false,
                   		success: function(response){
                   			
                   		},
                   		error: function() {
                            console.log("세 번째: testView 실패!");
                        }
                    });
                    },
                    error: function() {
                        console.log("두 번째: updateActors 실패!");
                    }
                }); // $.ajax({
            },
            error: function() {
                console.log("첫 번째 호출 실패");
            }
        }); //$.ajax({
    }); // $("#updateDBButton").click(function(e) );


}); // $(document).ready
