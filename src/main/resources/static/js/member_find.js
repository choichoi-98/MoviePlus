$(document).ready(function(){

	
	//모달
	function openAlertPopup(){
		$('.alert-popup').css('opacity', '1');
		$('.alertStyle').css('display', 'block');
	    $('body').addClass('no-scroll');
	}
	
	function closeAlertPopup(){
	    $('.alert-popup').css('opacity', '1');
	    $('.alert-popup').css('display', 'none');
	    $('.alertStyle').css('display', 'none');
	    $('.alertStyle').css('opacity', '0');
	    $('body').removeClass('no-scroll');
	}
	
	
	$("#alertclose").click(function(){
		closeAlertPopup();
	})
	
	
	//아이디 찾기
	$('#findIdform').on("submit", function(){
		const name = $('#findIdName').val();
		const birth = $('#findIdBirth').val();
		const phoneNo = $('#findIdPhoneno').val();
			
			$.ajax({	
				url : "findidProcess",
				type : "POST",
				data : {"name" : name, "birth" : birth, "phoneNo" : phoneNo},
				dataType: 'json',
				success : function(resp){
					if(resp == 0){		//db에 해당 아이디가 없는 경우 (resp == 0)
						alert('회원정보를 확인해주세요.');
						 $('#findIdName').val('');
		                 $('#findIdBirth').val('');
		                 $('#findIdPhoneno').val('');
					} else {		    //db에 해당 아이디가 있는 경우
						alert('회원정보가 있습니다.');
						$('#findIdresult').val(resp);
						openAlertPopup();
					}		
				}//success end
			});//ajax end
	})
		
	





});

