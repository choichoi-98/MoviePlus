$(document).ready(function(){
	
	/*** 회원가입 step1 ***/
	let verifyemailcheck = false;	//step1 인증번호 확인
	
	//회원가입 step1 : 1)이메일 인증
	$('#btnSendverify').on("click", function(){
		var email = $('#JoinEmail').val();
		const pattern = /^\w+@\w+[.]\w{3}$/;
		
		if(!pattern.test(email)){		//형식에 맞는 이메일 주소를 입력하지 않고 인증요청 버튼을 클릭하였을 때
			alert('형식에 맞게 이메일 주소를 입력하세요');
			$('#JoinEmail').focus();
			verifyemailcheck = false;
		} else { 	//이메일 주소를 입력하였을 때
		
			$.ajax({
				url : "sendEmail",
				data : {"email" : email},
				success : function(data){
					$("#verifycode").val(data);
					alert('인증번호가 발송되었습니다.');
					$("#JoinVerifyNo").removeAttr("disabled");  //인증번호 입력칸 disabled 해제
					$("#schPwdtimer").css('background-color','#FFFFFF');  //인증번호 입력칸 disabled 해제
					$("#MEMBER_EMAIL").val(email);
				  }, 
				error : function(){
	           	 	console.log();
	            }
			}); //ajax end
	   }//else end	
	}) //이메일 인증 end
	
	
	//회원가입 step1 : 2)인증번호 확인
	$('#btnCheckNo').on("click", function(){
		var checkinput = $('#JoinVerifyNo').val(); //입력한 인증번호
		
		if(checkinput === ''){
			alert('인증번호를 입력하세요.');
			$('#JoinVerifyNo').focus();
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
		} //checkinput === '' else end
	}) //인증번호 확인 end



	//회원가입 step1 : 폼 제출
	$('#joinstep1form').submit(function(){	
		if(verifyemailcheck){	//verifyemailcheck가 true일 경우 폼 제출
			return true;
		} else {
			alert('이메일 인증을 완료해주세요.');
			return false;
		}
	})//step1 form end

	
	
	/*** step3 회원정보 입력 ****/
	let checkid = false;	//아이디 중복검사 확인여부
	
	$('#MEMBER_ID').keyup(function(){  //id keyup시 중복확인 버튼 클래스의 disabled 해제 
		$("#btnIdCheck").removeClass("disabled");
	})//#MEMBER_ID keyup end
	
	
	//step3 아이디 중복검사
	$('#btnIdCheck').on("click",function(){
		const pattern = /^\w{5,12}$/;
		const id = $("#MEMBER_ID").val();
		
		if(!pattern.test(id)){		//아이디 pattern 검사
			$('#JoinInfoRegLoginId-error-text').html("영문자 숫자로 5~12자까지 가능합니다.");
			checkid = false;
			return;
		}
		
		$.ajax({	//아이디 중복 검사
			url : "idcheck",
			data : {"id" : id },
			success : function(resp){
				if(resp == -1){		//db에 해당 아이디가 없는 경우
					alert('사용 가능한 아이디입니다.');
					$("#JoinInfoRegLoginId-error-text").hide();
					checkid = true;
				} else {		    //db에 해당 아이디가 있는 경우(resp == 0)
					$("#JoinInfoRegLoginId-error-text").html("사용중인 아이디 입니다.");
					chekid = false;
				}		
			}//success end
		});//ajax end
	})//아이디 중복검사 end
	
		
	//step3 생년월일 pattern 검사
	let checkbirth = false;		//생년월일 pattern 확인여부
		
	$('#MEMBER_BIRTH').keyup(function(){
		const pattern = /^(19|20)\d{2}(0[1-9]|1[0-2])(0[1-9]|[12][0-9]|3[01])$/;
		const phoneNo = $('#MEMBER_BIRTH').val();
		
		if(!pattern.test(phoneNo)){
			$('#JoinInfoRegLoginBirth-error-text').html('형식에 맞게 입력해주세요.');
			checkbirth = false;
			return;
		} else {
			$('#JoinInfoRegLoginBirth-error-text').hide();
			checkbirth = true;
		}
	}) //생년월일 pattern end
		
	
	//step3 휴대폰 번호 pattern 검사
	let checkphone = false;		//휴대폰 번호 pattern 확인여부
	
	$('#MEMBER_PHONENO').keyup(function(){
		const pattern = /^(010)(\d{4})(\d{4})$/;
		const phoneNo = $('#MEMBER_PHONENO').val();
		
		if(!pattern.test(phoneNo)){
			$('#JoinInfoRegLoginPhone-error-text').html('형식에 맞게 입력해주세요.');
			checkphone = false;
			return;
		} else {
			$('#JoinInfoRegLoginPhone-error-text').hide();
			checkphone = true;
		}
	}) //휴대폰 pattern end

	
	//step3 비밀번호 pattern 검사 & 비밀번호 일치 확인
	let checkpass = false; 					//비밀번호 일치 확인여부
	
	
	$('#MEMBER_PASS').keyup(function(){		//비밀번호 pattern 검사
		//const pattern = /^[A-Za-z0-9!@#%+=\-?_]$/;
		//const pattern = /^(?=.*[A-Za-z])(?=.*\d|.*[!@#%+=\-?_])[A-Za-z\d!@#%+=\-?_]$/;
		const pattern = /^(?=.*[A-Za-z])(?=.*(\d|[!@#%+=\-?_]))[A-Za-z\d!@#%+=\-?_]+$/;

		//const pattern = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#%+=\\\-?_])[A-Za-z\d!@#%+=\\\-?_]+$/;
		const pass = $('#MEMBER_PASS').val();
		
		if(!pattern.test(pass)){
			$('#JoinInfoRegLoginPwd-error-text').html("비밀번호를 형식에 맞게 입력해주세요.")
												.css('display', 'block');
			checkpass = false;
		} else {
			$('#JoinInfoRegLoginPwd-error-text').css('display', 'none');
			checkpass = true;
		}
	})//비밀번호 pattern 검사
	
	
	$('#MEMBER_PASS_Confirm').keyup(function(){	//비밀번호 확인 일치 검사 & 비밀번호 확인 pattern 검사
		//const pattern = /^[A-Za-z0-9!@#%+=\-?_]$/;
		//const pattern = /^(?=.*[A-Za-z])(?=.*\d|.*[!@#%+=\-?_])[A-Za-z\d!@#%+=\-?_]$/;
		const pass = $('#MEMBER_PASS').val();
		const passvalcheck = $('#MEMBER_PASS_Confirm').val();
	
		if($.trim(pass) !== $.trim(passvalcheck)){	//입력한 비밀번호와 비밀번호 확인이 일치하지 않을 때  
			$('#JoinInfoRegLoginPwdConfirm-error-text').html("비밀번호를 확인해주세요.")
														.css('color', 'red');
			checkpass = false;
			
		} else {					//일치할 때
			$('#JoinInfoRegLoginPwdConfirm-error-text').html("비밀번호가 일치합니다.")
													   .css('color', 'black');
			checkpass = true;
		}
	
	})//비밀번호 확인 일치 검사
	
	//회원가입 step3 : 폼 제출
	$('#joinstep3form').submit(function(){
	
		if(!checkid){
			alert('아이디 중복확인을 해주세요.');
			$("#MEMBER_ID").focus();
			return false;
		}
		
		if(!checkbirth){
			alert('생년월일을 확인해주세요.');
			$('#MEMBER_BIRTH').focus();
			return false;
		}
		
		if(!checkphone){
			alert('전화번호를 확인해주세요.');
			$('#MEMBER_PHONENO').focus();
			return false;
		}
		
		if(!checkpass){	
			alert('비밀번호가 일치하는지 확인해주세요.');
			$('#MEMBER_PASS_Confirm').focus();
			return false;
		}
	})//step3 폼 제출 end
	

}) //ready end