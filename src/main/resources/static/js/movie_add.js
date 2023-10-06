$(document).ready(function() {

	//영화 목록 10개 가져오기
	let token = $("meta[name='_csrf']").attr("content");
   	let header = $("meta[name='_csrf_header']").attr("content");
   	console.log(token);
   	console.log(header);
   
   	
    $.ajax({
        type: 'POST',
        url: 'movieListAll',
        dataType: 'json', // JSON 데이터로 응답을 기대합니다.
        beforeSend : function(xhr)
        { //데이터를 전송하기 전에 헤더에 csrf값을 설정
         xhr.setRequestHeader(header, token);
        },
        success: function(movielist) {
            // 데이터를 테이블에 삽입
            var table = $('#movieListAllTable');
            var first10Movies = movielist.slice(0,10);
            first10Movies.forEach(function(movie) {
                var row = $('<tr>');
                row.css('color','white');
                row.append($('<td>').text(movie.movie_Code));
                 row.append($('<td>').text(movie.movie_Title));
                 row.append($('<td>').text(movie.movie_Screen));
                 row.append($('<td>')
                 .html('<a href="#"><i id="playing" class="icon ion-ios-eye"></i></a>'
                   + ' <a href="#"><i id="eneded" class="icon ion-ios-eye"></i></a>'));
                table.append(row);
                
            });
            console.log("영화 목록 가져오기 성공");
        },
        error: function() {
            console.log("영화 목록 가져오기 실패");
        }
    });//$.ajax({
	
	//전체 영화목록 가져오기 
	var currentPage = 1; //초기 페이지 설정
	
	//모달 열기 이벤트
	$("#movieListAllModal").on('click', function(){
		loadPageData(currentPage);
	});
	
	 // 이전 페이지로 이동
    $('#prevPage').click(function() {
        if (currentPage > 1) {
            currentPage--;
            loadPageData(currentPage);
        }
    });

    // 다음 페이지로 이동
    $('#nextPage').click(function() {
        currentPage++;
        loadPageData(currentPage);
    });
	
	// 페이지 데이터를 불러오고 모달에 표시하는 함수
	function loadPageData(page){
		$.ajax({
			type: 'POST',
			url: 'movieListAllModal',
			dataType: 'json',
			beforeSend : function(xhr)
        	{ //데이터를 전송하기 전에 헤더에 csrf값을 설정
        	 xhr.setRequestHeader(header, token);
        	},
        	success: function(response){
        		//데이터 테이블에 삽입
        		var table = $('#movieListAllTableModal');
        		$(response.movieList).each(function(index, movie){
        		 var row = $('<tr>');
        		 row.css('color','white');
                 row.append($('<td>').text(movie.movie_Code));
                 row.append($('<td>').text(movie.movie_Title));
                 row.append($('<td>').text(movie.movie_Screen));
                 row.append($('<td>')
                 .html('<a href="#"><i id="playing" class="icon ion-ios-eye"></i></a>'
                   + ' <a href="#"><i id="eneded" class="icon ion-ios-eye"></i></a>'));
                 table.append(row);
        		});
        		console.log("전체 영화 목록 가져오기 성공");
        	},
        	error: function(){
        		console.log("전체 영화 목록 가져오기 실패");
        	}
		
		});//$.ajax({
	};//function loadPageData(page){
	
	
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
