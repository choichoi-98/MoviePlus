$(document).ready(function(){
	
	//회원탈퇴를 클릭한 경우
	$("#deletemember").click(function(event){
		 const answer = confirm("정말로 탈퇴하시겠습니까?");
		 console.log(answer);	// 취소를 클릭한 경우 - false
		 
		 if(!answer) {	//취소를 클릭한 경우
			 event.preventDefault();	//이동하지 않습니다.
		  } else {
		  	alert("회원탈퇴가 완료되었습니다.");
		  }
	}) //삭제 클릭 end
	
	
	//생년월일 형식 변경
	var birth = $('#birth');
	var oldbirth = birth.text().trim();
	var newbirth = formatbirth(oldbirth);
	
	birth.text(newbirth);
	
	function formatbirth(birthString) {
		var year = birthString.substring(0, 4);
        var month = birthString.substring(4, 6);
        var day = birthString.substring(6, 8);
        
   	   return year + "년 " + month + "월 " + day + "일";
    }
	
	
	//휴대폰번호 형식 변경
	var phoneNo = $('#phoneNo');
	var oldphoneNo = phoneNo.text().trim();
	var newphoneNo = formatPhoneNo(oldphoneNo);
	
	phoneNo.text(newphoneNo);
	
	function formatPhoneNo(phoneNumber) {
   	   return phoneNumber.replace(/(\d{3})(\d{4})(\d{4})/, '$1-$2-$3');
    }
	
	
	
	
	//이메일 변경
	let verifyemailcheck = false;

	$('#EmailChgBtn').on("click",function(){
		$('.change-phone-num-area').addClass('target on');
	})
	
	$('#sendNumberBtn').click(function(){
		$('.position').css('display','inline-block');
		
		var email = $('#chEmail').val();
		const pattern = /^\w+@\w+[.]\w{3}$/;
		
		if(!pattern.test(email)){		//형식에 맞는 이메일 주소를 입력하지 않고 인증요청 버튼을 클릭하였을 때
			alert('형식에 맞게 이메일 주소를 입력하세요');
			$('#chEmail').focus();
		} else { 	//이메일 주소를 입력하였을 때
		
			$.ajax({
				url : "sendEmail",
				data : {"email" : email},
				success : function(data){
					$("#chverifycode").val(data);
					alert('인증번호가 발송되었습니다.');
				  }, 
				error : function(){
	           	 	console.log();
	            }
			}); //ajax end
	   }//else end	
	})
	
	
	//마이페이지 이메일 변경 - 인증번호 확인	
	$('#chgBtn').click( function(){
		var checkinput = $('#chkNum').val(); //입력한 인증번호
		
		if(checkinput === ''){
			alert('인증번호를 입력하세요.');
			$('#chkNum').focus();
			verifyemailcheck = false;
		} else {
			if(checkinput == $("#chverifycode").val()){
				alert('인증에 성공하였습니다.');
				verifyemailcheck = true;
			  } else {
				alert('인증에 실패하였습니다.');
				console.log();
				verifyemailcheck = false;
			  }	
		} //checkinput === '' else end	
	})
	
	//마이페이지 개인정보 변경 제출
	$("#modifyinfoform").submit(function(){
		if(verifyemailcheck = false)
		return false;
	})
	
	//마이페이지 비밀번호 변경
	$('#changepassform').submit(function(){
		
	
	})
	
	
	
	

}) //ready end