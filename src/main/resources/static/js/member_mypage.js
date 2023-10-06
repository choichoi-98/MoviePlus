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
	
	
	
	
	

}) //ready end