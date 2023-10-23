$(document).ready(function(){

	let token = $("meta[name='_csrf']").attr("content");
   	let header = $("meta[name='_csrf_header']").attr("content");


	$('#reopen-admit-btn').click(function() {
		if($('#header-pinfo-memberId').val() == null){
			$('#login-alert-modal').css('display', 'block');
			$('.bg-modal').css('opacity', '1');
			$('body').addClass('no-scroll');
			
			return;
		}
		admitReopen($(this).attr('data-movieCode'));
	})

	function admitReopen(movieCode){

		$.ajax({
			type: 'POST',
			url: "admitReopen",
			data: {
				MOVIE_CODE : movieCode
			},
			beforeSend: function(xhr) {
            xhr.setRequestHeader(header, token);
	        },
	        success: function(data) {
				if(data == 'success'){
					alert('재개봉에 동의하셨습니다.');
				}else if(data == 'fail'){
					alert('이미 동의하신 영화입니다.');
				}
	            
	        },
	        error: function() {
	            console.log("재개봉 요청 실패");
	        }
	        
	    });
	
	}
	
});
