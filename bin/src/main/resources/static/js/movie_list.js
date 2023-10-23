$(document).ready(function(){

	let token = $("meta[name='_csrf']").attr("content");
   	let header = $("meta[name='_csrf_header']").attr("content");
   	
	//hover 이벤트 발생시 줄거리 노출
	$("body").on("mouseover", ".poster", function(e) {
		e.preventDefault();
		
		 $(this).parent().find('.wrap1').css('display', 'block');
		
	});//$("body").on("mouseover", ".poster", function(e) {

   $("body").on("mouseleave", ".poster", function(e) {
		e.preventDefault();
		
		$(this).find('.my-score').css('display', 'none');
		
	});
	
	//영화 겁색
	 $("#btnSearch").click(function() {
        $("#searchForm").submit();
    });// $("#btnSearch").click(function() {


	

//보고싶어요 추가 및 삭제
	$("body").on("click", ".btn-like", function(e){
		e.preventDefault();
		
		var imgsrc = $(this).find('.dibs_img').attr('src');
		var movieCode = $(this).attr('rpst-movie-no');
		
		
		console.log("imgsrc = " + imgsrc);
		console.log("movieCode = " + movieCode);
		
		var ajaxURL;
		
		if(imgsrc.includes('heart_full.png')){
			ajaxURL = '../movie/deleteMovieDibs';		
		} else {
			ajaxURL = '../movie/addMovieDibs';		
		}
		
		$.ajax({
			type: 'POST',
			url: ajaxURL,
			data: {
				//movie_code값 넘겨주기
				"movieCode":movieCode
			},
			dataType: 'json',
			beforeSend: function(xhr) {
            // 데이터를 전송하기 전에 헤더에 csrf값을 설정
            xhr.setRequestHeader(header, token);
	        },
	        success: function(response) {
	            // AJAX 요청 성공 시 처리
	            var responseAlert = response.alert;
	            if(responseAlert){
	            	alert("로그인이 필요한 서비스입니다.");
	            } else{
	            	console.log("보고싶어요 기능 성공");
	            }
	            console.log("AJAX 요청 성공");
	            
	            location.reload();
	            
	        },
	        error: function() {
	            // AJAX 요청 실패 시 처리
	            console.log("AJAX 요청 실패");
	        }
	        
	    });//$.ajax({
	
	});//$("body").on("click", ".btn-like", function(e){
	

});//$(document).ready(function(){
