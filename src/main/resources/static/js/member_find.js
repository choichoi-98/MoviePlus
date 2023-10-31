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
		
	
	/****** 비밀번호 찾기 ******/
	let verifyemailcheck = false;
	
	//비밀번호 찾기 - 이메일 인증번호 요청
	$('#findVerifyNoSend').click(function(){	
		var email = $('#findpassEmail').val();
		const pattern =  /^\w+@\w+[.]\w{3}$/;
		
		if(!pattern.test(email)){	//형식에 맞는 이메일 주소를 입력하지 않고 인증요청 버튼을 클릭하였을 때
			alert('형식에 맞게 이메일 주소를 입력하세요.');
			$('#findpassEmail').focus();
			verifyemailcheck = false;
		} else {	//형식에 맞는 이메일 주소를 입력하였을 때
		
			$.ajax({
				url:"findpassEmail",
				data : {"email" : email},
				success : function(data){
						$("#verifycode").val(data);
						alert('인증번호가 발송되었습니다.');
						$('#findpassVerifyNo').removeAttr("disabled");	//인증번호 입력창 활성화
						$('#btnCheckVerify').removeAttr("disabled");	//인증번호 입력창 활성화
						$('#btnCheckVerify').removeClass("disabled");	//인증번호 입력창 활성화
						$("#schPwdtimer").css('background-color','#FFFFFF');
					}, 
				error : function(){
	           	 	console.log();
	            }
			 });//ajax end
		}
	})//$('#findVerifyNoSend').click end


	//이메일 인증번호 확인
	$('#btnCheckVerify').on("click", function(){
		var checkinput = $('#findpassVerifyNo').val(); //입력한 인증번호
		
		if(checkinput == ''){
			alert('인증번호를 입력하세요.');
			$('#findpassVerifyNo').focus();
			verifyemailcheck = false;
		} else {
			if(checkinput == $("#verifycode").val()){
				alert('인증에 성공하였습니다.');
				verifyemailcheck = true;
			  } else {
				alert('인증에 실패하였습니다.');
				console.log();
				verifyemailcheck = false;
			  }	
		} 
	})//인증번호 확인 end
	
	
	//비밀번호 찾기 폼 제출
	$('#findpassform').submit(function(){
		var id = $('#findpassId').val();
		var name = $('#findpassName').val();
		var email = $('#findpassEmail').val();
		
		if(id == ''){
			alert('아이디를 입력하세요.');
			$('#findpassId').focus();
			return false;
		}
		
		if(name == ''){
			alert('이름을 입력하세요.');
			$('#findpassName').focus();
			return false;
		}
		
		if(email == ''){
			alert('이메일을 입력하세요.');
			$('#findpassEmail').focus();
			return false;
		}

		if(!verifyemailcheck){
			alert('이메일 인증을 완료해주세요.');
			return false;
		}	
	})
	
	
	
	
	/*****비밀번호 재설정****/
	//비밀번호 재설정 폼 제출
	$('#findPassResetform').submit(function(){
		var pass = $('#ResetLoginPass').val();
		var passcheck = $('#ResetLoginPassConfirm').val();
		
		if(pass == ''){
			alert('비밀번호를 입력하세요.');
			$('#ResetLoginPass').focus();
			return false;
		}
		
		if(passcheck == ''){
			alert('비밀번호 확인을 입력하세요.');
			$('#ResetLoginPassConfirm').focus();
			return false;
		}
		
		if(pass != passcheck){
			alert('비밀번호를 확인해주세요.');
			$('#ResetLoginPassConfirm').focus();
			return false;
		}
		
		
		alert('비밀번호가 재설정되었습니다.');	
	
	})
		


});

