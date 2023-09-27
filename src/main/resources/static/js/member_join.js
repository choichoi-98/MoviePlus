$(document).ready(function(){
	
	//회원가입 1)이메일 인증
	$('#btnSendverify').click(function(){
		const email = $('#JoinEmail').val();
		const checkinput = $('#JoinVerifyNo').val(); //입력한 인증번호
		
		
		$.ajax({
			url : "member/sendEmail",
			data : email,
			success : function(resp){
				$("#authRandnum").val(resp);
				alert('인증번호가 발송되었습니다.');
			}
		}); //ajax end
	}) //이메일 인증 end


})