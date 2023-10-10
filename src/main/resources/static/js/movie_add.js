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
                 .html('<a class="playBtn" href="#"><img src=' + playImagePath + ' style="width:25px"></a>'
                   + ' <a class="endBtn" ref="#"><img src=' + pauseImagePath + ' style="width:25px"></a>'));
                table.append(row);
            });
            console.log("영화 목록 가져오기 성공");
        },
        error: function() {
            console.log("영화 목록 가져오기 실패");
        }
    });//$.ajax({
	
	//상영 중인 영화
	$.ajax({
        type: 'POST',
        url: 'now-playing',
        dataType: 'json', // JSON 데이터로 응답을 기대합니다.
        beforeSend : function(xhr)
        { //데이터를 전송하기 전에 헤더에 csrf값을 설정
         xhr.setRequestHeader(header, token);
        },
        success: function(movielist) {
            // 데이터를 테이블에 삽입
            var table = $('#movieListNowPlaying');
            var first10Movies = movielist.slice(0,10);
            first10Movies.forEach(function(movie) {
                var row = $('<tr>');
                row.css('color','white');
                row.append($('<td>').text(movie.movie_Code));
                 row.append($('<td>').text(movie.movie_Title));
                 row.append($('<td>').text(movie.movie_Screen));
                 row.append($('<td>')
                 .html('<a class="playBtn" href="#"><img src=' + playImagePath + ' style="width:25px"></a>'
                   + ' <a class="endBtn" href="#"><img src=' + pauseImagePath + ' style="width:25px"></a>'));
                table.append(row);
                
            });
            console.log("영화 목록 가져오기 성공");
        },
        error: function() {
            console.log("영화 목록 가져오기 실패");
        }
    });//$.ajax({
    
    //상영 종료 영화
    //상영 중인 영화
	$.ajax({
        type: 'POST',
        url: 'ended',
        dataType: 'json', // JSON 데이터로 응답을 기대합니다.
        beforeSend : function(xhr)
        { //데이터를 전송하기 전에 헤더에 csrf값을 설정
         xhr.setRequestHeader(header, token);
        },
        success: function(movielist) {
            // 데이터를 테이블에 삽입
            var table = $('#movieListEnded');
            var first10Movies = movielist.slice(0,10);
            first10Movies.forEach(function(movie) {
                var row = $('<tr>');
                row.css('color','white');
                row.append($('<td>').text(movie.movie_Code));
                 row.append($('<td>').text(movie.movie_Title));
                 row.append($('<td>').text(movie.movie_Screen));
                 row.append($('<td>')
                 .html('<a class="playBtn" href="#"><img src=' + playImagePath + ' style="width:25px"></a>'
                   + ' <a class="endBtn" href="#"><img src=' + playImagePath + ' style="width:25px"></a>'));
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
                 .html('<a class="playBtn" href="#"><img src=' + playImagePath + ' style="width:25px"></a>'
                   + ' <a class="endBtn" href="#"><img src=' + pauseImagePath + ' style="width:25px"></a>'));
                 table.append(row);
        		});
        		console.log("전체 영화 목록 가져오기 성공");
        	},
        	error: function(){
        		console.log("전체 영화 목록 가져오기 실패");
        	}
		
		});//$.ajax({
	};//function loadPageData(page){
	
	//상영중으로 update
	$("body").on("click", ".playBtn", function(e) {
    e.preventDefault(); // 기본 링크 동작 방지

    var movieCode = $(this).closest("tr").find("td:first").text().trim();

    console.log("playBtn");
    console.log(movieCode);
	
    $.ajax({
        type: 'POST',
        url: 'moviePlayUpdate', 
        data: { movieCode: movieCode }, 
        dataType: 'json',
        beforeSend: function(xhr) {
            // 데이터를 전송하기 전에 헤더에 csrf값을 설정
            xhr.setRequestHeader(header, token);
        },
        success: function(response) {
            // AJAX 요청 성공 시 처리
            console.log("movieUpdate 성공");
            // response에서 서버로부터 받은 데이터를 처리
        },
        error: function() {
            // AJAX 요청 실패 시 처리
            console.log("movieUpdate 실패");
        }
     });//$.ajax({
	});//$("playBtn").click(function(){
	
	//상영종료로 update
	$(".endBtn").click(function(e) {
    e.preventDefault(); // 기본 링크 동작 방지

    var movieCode = $(this).closest("tr").find("td:first").text().trim();

    console.log("endBtn");
    console.log(movieCode);
	
    $.ajax({
        type: 'POST',
        url: 'movieEndedUpdate', 
        data: { movieCode: movieCode }, 
        dataType: 'json',
        beforeSend: function(xhr) {
            // 데이터를 전송하기 전에 헤더에 csrf값을 설정
            xhr.setRequestHeader(header, token);
        },
        success: function(response) {
            // AJAX 요청 성공 시 처리
            console.log("movieEndedUpdate 성공");
            // response에서 서버로부터 받은 데이터를 처리
        },
        error: function() {
            // AJAX 요청 실패 시 처리
            console.log("movieEndedUpdate 실패");
        }
     });//$.ajax({
	});//$("playBtn").click(function(){
	
    // movie db 최신화
    $("#updateDBButton").click(function(e) {
        $.ajax({
            url: '../movie',
            type: 'GET',
            async: false,
            success: function() {
                $.ajax({
                    url: 'updateActors',
                    type: 'GET',
                    async: false,
                    success: function(response) {
                        console.log("두 번째: updateActors 성공!");
                        $.ajax({
                        url: '../testView',
                    	type: 'GET',
                   		async: false,
                   		success: function(testViewresponse){
                   			console.log(testViewresponse);
                   			$(testViewresponse).each(function(index, item){
                   				getApiUpdate(item.movie_Title,item.movie_Director, item.movie_Code)
                   			})
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

function getApiUpdate(title, director, movieCode){
console.log("director: " + director);
console.log(movieCode);
	
$.ajax({
    url: '../apitest',
    type: 'GET',
    dataType: 'json', // JSON 데이터로 응답을 기대합니다.
    data: {"movieTitle":title, "movieDirector":director, "movieCode":movieCode},
    async: false,
    success: function(movieList) {
        // 데이터를 테이블에 삽입
        console.log(movieList.Data[0].Result[0].plots.plot[0].plotText)
        var result = movieList.Data[0].Result[0];
        var plotText = result.plots.plot[0].plotText
        var posterUrl = result.posters;
        var stillUrl = result.stlls;
        var title = result.title;
        var codeNo = result.CommCodes.CommCode[0].CodeNo;
        
        if(codeNo === ""){
        	codeNo = movieCode;
        }
        
        console.log(title);
        console.log(plotText);
        console.log(posterUrl);
        console.log(stillUrl);
        console.log(codeNo);
        console.log("영화 목록 가져오기 성공");
        
        $.ajax({
        	url:'../updatePosters',
        	data:{
        		'codeNo':codeNo,
        		posterUrl:posterUrl,
        		stillUrl:stillUrl,
        		plotText:plotText,
        		title:title
        	},
        	async: false,
        	success:function(data){
        		console.log(data);
        	}
        })
        
    },
    error: function() {
        console.log("영화 목록 가져오기 실패");
    }
});//$.ajax({
}
	
}); // $(document).ready
