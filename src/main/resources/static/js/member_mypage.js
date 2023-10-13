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
				url : "mypageChgEmail",
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
	
	
		
	//마이페이지 - 프로필 이미지 등록버튼 클릭 
	let check = 0;
	
	$('#addProfileImgBtn').click(function(){
		$('#upfile').click();
	})
	
	
	function showprofilebtn(){
		if($('#filevalue').text()== ''){	//파일 이름이 없는 경우 이미지 등록 버튼 보이게
			$('#addProfileImgBtn').css('display','inline-block');
		} else {		//파일 이름이 있는 경우 이미지 삭제 버튼 보이게				
			$('#deleteProfileImgBtn').css('display', 'inline-block');
			$('#addProfileImgBtn').css('display','none');
		}
	}
	
	showprofilebtn();
	
	
	
	//마이페이지 - 프로필 이미지 파일 업로드 미리보기
	$('#upfile').change(function(upload){
		check++;
		const inputfile = $(this).val().split('\\');
		const filename=inputfile[inputfile.length - 1]; //inputfile.length - 1 = 2

		const pattern = /(gif|jpg|jpeg|png)$/i; //i(ignore case)는 대소문자 무시를 의미
		if(pattern.test(filename)){
			$('#upfile').text(filename);
			
			const reader = new FileReader();	//파일을 읽기 위한 객체 생성
			
		  reader.readAsDataURL(event.target.files[0]);
			 
		  reader.onload = function(){	//읽기에 성공했을 때 실행되는 이벤트 핸들러
			$('#filevalue + img').attr('src', this.result);  
		  };
		} else {
			alert('이미지 파일(gif,jpg,jpeg,png)이 아닌 경우는 무시됩니다.');
			$(this).val('')
		}
		
	})
	
	//마이페이지 - 프로필 이미지 삭제
	$('#deleteProfileImgBtn').click(function(){
		$('#filevalue + img').attr('src', "/movieplus/resources/image/member/bg-profile.png"); 
		$("#filevalue").text('');
		$(this).css('display', 'none');
		showprofilebtn();
		$('#upfile').val(''); //<input type=file>의 값도 빈문자열로 만든다.
	})
	
	
	//마이페이지 개인정보 변경 제출
	$("#modifyinfoform").submit(function(){
		 event.preventDefault(); 
		 
		//파일 첨부를 변경하지 않으면 $('#filevalue').text()의 파일명을
		//파라미터 'check'라는 이름으로 form에 추가하여 전송
		if(check == 0){
			const value = $('#filevalue').text();
			const html = "<input type='hidden' value='" + value + "' name='check'>";
			console.log(html);
			$(this).append(html);
		}
		
		this.submit();
		alert('회원정보가 수정되었습니다.');
	})
	
	$('#modifycancelBtn').on("click",function(){
		location.href="/member/mypage";	
	})
	
	
	//마이페이지 비밀번호 변경
	let passcheck = false;
	
	$('#changepassform').submit(function(){
		var pwnew = $('#pwnew').val();
		var checkpwnew = $('#checkpwnew').val();
		
		/*
		if(!passcheck){
			alert('비밀번호를 확인해주세요.');
			return false;
		}
		*/
		
		if(pwnew == ''){	//새 비밀번호 미입력
			alert('새 비밀번호를 입력하세요.');
			return false;
		}
		
		if(checkpwnew == ''){	//새 비밀번호 재입력 미입력
			alert('새 비밀번호를 재입력하세요.');
			return false;
		}
		
		if(pwnew != checkpwnew){	//새 비밀번호 확인 불일치
			alert('비밀번호를 확인해주세요.');
			return false;
		}
		
		alert('비밀번호가 변경되었습니다.');
		
		
	})
	
	
	
	

}) //ready end