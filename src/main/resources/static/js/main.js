$(document).ready(function(){

	let token = $("meta[name='_csrf']").attr("content");
   	let header = $("meta[name='_csrf_header']").attr("content");
   	
	//hover 이벤트 발생시 줄거리 노출
	$("body").on("mouseover", ".poster", function(e) {
		e.preventDefault();
		
		$(this).closest('.first').find('.wrap').css('display', 'block');
		
	});//$("body").on("click", ".playBtn", function(e) {

   $("body").on("mouseleave", ".poster", function(e) {
		e.preventDefault();
		
		$(this).closest('.first').find('.wrap').css('display', 'none');
		
	});

//보고싶어요 추가 및 삭제
	$("body").on("click", ".btn-like", function(e){
		e.preventDefault();
		
		var imgsrc = $(this).find('.dibs_img').attr('src');
		var movieCode = $(this).attr('rpst-movie-no');
		var memberId = 'choichoi';
		
		console.log("imgsrc = " + imgsrc);
		console.log("movieCode = " + movieCode);
		
		var ajaxURL;
		
		if(imgsrc.includes('heart_full.png')){
			ajaxURL = 'movie/addMovieDibs';		
		} else {
			ajaxURL = 'movie/deleteMovieDibs';		
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
	            console.log("AJAX 요청 성공");
	            if(response.memberId !== null){
	            	console.log("addMovieDibs 실행")
	            } else{
	            	alter("로그인이 필요한 서비스입니다.");
	            }
	            
	        },
	        error: function() {
	            // AJAX 요청 실패 시 처리
	            console.log("AJAX 요청 실패");
	        }
	        
	    });//$.ajax({
	
	});//$("body").on("click", ".btn-like", function(e){
	

});//$(document).ready(function(){
