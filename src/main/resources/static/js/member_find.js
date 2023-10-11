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
	
	
	$("#test").click(function(){
		openAlertPopup();
	})
	
	
	//아이디 찾기
	$('#findIdform').on("submit", function(event){
	    event.preventDefault();
		const name = $('#findIdName').val();
			console.log(name);
		const birth = $('#findIdBirth').val();
		const phoneNo = $('#findIdPhoneno').val();
		
		let token = $("meta[name='_csrf']").attr("content");
   		let header = $("meta[name='_csrf_header']").attr("content");	
			$.ajax({	
				url : "findidProcess",
				type : "POST",
				data : {"name" : name, "birth" : birth, "phoneNo" : phoneNo},
				 beforeSend : function(xhr)
			      {      //데이터를 전송하기 전에 헤더에 csrf값을 설정합니다.
			         xhr.setRequestHeader(header, token);
			      },
				success : function(resp){
					if(resp == ''){		//db에 해당 아이디가 없는 경우 (resp == 0)
						alert('회원정보를 확인해주세요.');
						 $('#findIdName').val('');
		                 $('#findIdBirth').val('');
		                 $('#findIdPhoneno').val('');
					} else {		    //db에 해당 아이디가 있는 경우
						$('#findIdresult').text(resp.member_ID);
						openAlertPopup();
					}		
				}//success end
			});//ajax end
	})
		
	





});

