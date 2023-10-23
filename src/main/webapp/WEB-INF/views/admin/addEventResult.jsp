<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MoviePlus 이벤트 추가</title>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.min.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/admin/sidebar.jsp" />

	<main class="main">
		<div class="container-fluid">
			<div class="row">
				<!-- main title -->
				<div class="col-12">
					<div class="main__title">
						<h2>이벤트 당첨자 발표 추가</h2>
					</div>
				</div>
				<!-- end main title -->

				<!-- form -->
				<div class="col-12">
					<form enctype="multipart/form-data" id="eventupdate" action="${pageContext.request.contextPath}/admin/" class="form" method="post">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
						<div class="row row--form">
			
							<div class="col-12 col-md-7 form__content">
								<div class="row row--form">
								
								<div class="col-3">
									<select class="js-example-basic-single" value="${eventdata.EVENT_TYPE}" name="EVENT_TYPE" id="rights" data-select2-id="rights" tabindex="-1" readOnly >
												<option value="영화" ${eventdata.EVENT_TYPE == '영화' ? 'selected' : ''}>영화</option>
												<option value="극장" ${eventdata.EVENT_TYPE == '극장' ? 'selected' : ''}>극장</option>
												<option value="제휴/할인"  ${eventdata.EVENT_TYPE == '제휴/할인' ? 'selected' : ''}>제휴/할인</option>
												<option value="시사회/무대인사" ${eventdata.EVENT_TYPE == '시사회/무대인사' ? 'selected' : ''}>시사회/무대인사</option>
									</select>
								</div>
								<input type="hidden" name="EVENT_NUM" value="${eventdata.EVENT_NUM}">
								<div class="col-12">
									<input type="text" name="EVENT_SUBJECT" class="form__input"
										 placeholder="이벤트 제목" value="${eventdata.EVENT_SUBJECT}" readOnly>
								</div>
									
								<div class="col-12">
									<textarea id="text" name="EVENT_RESULT" class="form__textarea"
										 placeholder="이벤트 발표 내용" required></textarea>
								</div>
									
							 </div>
						   </div><!-- form content end -->
							

							<div class="col-12" >
								<button type="submit" class="form__btn" style="display:inline-block;">등록</button>
								<button type="button" id="cancelbtn" class="form__btn" style="display:inline-block; margin-left:10px;">취소</button>
							</div>
					  </div>
					</form>
				</div>
				<!-- end form -->
			</div>
		</div>
	</main>
<script>
$(document).ready(function(){
	
	$("#cancelbtn").click(function(){
		location.href = "/movieplus/admin/manageEvent";		
	})
	
	let concheck = 0;
	let thumbcheck = 0;
	
	
	//관리자페이지 - 이벤트 내용 업로드 수정
	$('#eventupfile').change(function(event){
		concheck++;
		const inputfile = $(this).val().split('\\');
		
		$('#filevalue').text(inputfile[inputfile.length - 1]);
	})
	
	
	//관리자페이지 - 이벤트 썸네일 이미지 파일 업로드 미리보기, 수정
	$('#eventthumbupfile').change(function(upload){
		const inputfile = $(this).val().split('\\');
		const filename=inputfile[inputfile.length - 1]; //inputfile.length - 1 = 2
		
		const pattern = /(gif|jpg|jpeg|png)$/i; //i(ignore case)는 대소문자 무시를 의미
		if(pattern.test(filename)){
			
			$('#thumbfilevalue').text(filename);
			
			const reader = new FileReader();	//파일을 읽기 위한 객체 생성
			
		  reader.readAsDataURL(event.target.files[0]);
			 
		  reader.onload = function(){	//읽기에 성공했을 때 실행되는 이벤트 핸들러
			$('#thumbclass img').attr('src', this.result);  
		  };
		} else {
			alert('이미지 파일(gif,jpg,jpeg,png)이 아닌 경우는 무시됩니다.');
			$(this).val('')
		}
		thumbcheck++;
	})
	
	
	
	$('form').submit(function(e){
		e.preventDefault();
		
		//썸네일 사진파일 변경하지 않은 경우
		if(thumbcheck == 0 ){
			const thumbvalue = $('#thumbfilevalue').text();
			const html = "<input type='hidden' value='" + thumbvalue + "' name='thumbcheck'>";
			$(this).append(html);
		}
		
		//내용 사진파일 변경하지 않은 경우
		if(concheck == 0){
			const convalue = $('#filevalue').text();
			const html = "<input type='hidden' value='" + convalue + "' name='concheck'>";
			$(this).append(html);
		} 
		
		this.submit();
		
		alert('이벤트가 수정되었습니다.');
	})
   
}) //ready end
</script>	
</body>
</html>