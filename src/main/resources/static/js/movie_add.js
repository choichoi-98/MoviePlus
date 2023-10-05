$(document).ready(function() {
    // movie db 최신화
    $("#updateDBButton").click(function(e) {
        $.ajax({
            url: 'http://localhost:9000/movieplus/movie',
            type: 'GET',
            success: function() {
                $.ajax({
                    url: 'http://localhost:9000/movieplus/movie/updateActors',
                    type: 'GET',
                    success: function(response) {
                        console.log("두 번째: updateActors 성공!");
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
    }); // $("#updateDBButton").click(function(e) {
    
    //전체 영화 목록 가져오기
    $.ajax({
    	url: 'movie/movieListAll';
    	type: 'GET',
    	success: function (data) {
            // 데이터를 테이블에 삽입
            var table = $('#movieListAllTable');
            data.forEach(function (movie) {
                var row = $('<tr>');
                row.append($('<td>').text(movie.movieCode));
                row.append($('<td>').html('<a href="#">' + movie.movieTitle + '</a>'));
                row.append($('<td>').text(movie.movieScreen));
                row.append($('<td>').html('<i class="icon ion-ios-star"></i> 9.2'));
                table.append(row);
            });
        },
        error: function(){
        	console.log("영화 목록 가져오기 실패");
    	}
    )};// $.ajax({
}); // $(document).ready
