$(document).ready(function(){

	let token = $("meta[name='_csrf']").attr("content");
   	let header = $("meta[name='_csrf_header']").attr("content");
   	var reviewId = "";
   	
   	//관람평 삭제 process 
   	$(".main__table-btn--delete").click(function(e){
   		reviewId = $(this).find(".delete-movie-review").val();
        
        console.log("Movie Review ID: " + reviewId);
   		
   		 $("#delete_review_num").val(reviewId);
   			
   	});//$(".modal__btn--apply").click(function(e){
   	

	
	//관람평 삭제 action
	$("#delete-review-modal-btn").click(function(e){
		
		var delete_review_num = $("#delete_review_num").val();
		console.log(delete_review_num)
		
		$.ajax({
			type: 'POST',
			url: "../movie/adminDeleteMovieReview",
			data: {
				"review_num":delete_review_num
			},
			beforeSend: function(xhr) {
            // 데이터를 전송하기 전에 헤더에 csrf값을 설정
            xhr.setRequestHeader(header, token);
	        },
	        success: function() {
	          console.log("댓글 삭제 성공")
	          
	          location.reload();
	        },
	        error: function() {
	            // AJAX 요청 실패 시 처리
	            console.log("댓글 수정 실패");
	        }
	        
	    });//$.ajax({
		
	
	});//$("#delete-review-modal-btn").click(function(e){
	

});//$(document).ready(function(){