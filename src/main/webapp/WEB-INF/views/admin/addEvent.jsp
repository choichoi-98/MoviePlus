<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="${pageContext.request.contextPath}/resources/image/favico.png" type="image/x-icon">
<title>MoviePlus: 모두를 위한 영화관</title>
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
						<h2>이벤트 추가</h2>
					</div>
				</div>
				<!-- end main title -->

				<!-- form -->
				<div class="table-wrap mt10" style="color:white; margin-left:20px; width:900px">
				<form enctype="multipart/form-data" id="eventadd" action="${pageContext.request.contextPath}/admin/eventInsert" class="form" method="post" style="width:880px;">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">	
						<table class="board-form va-m">
							<colgroup>
								<col style="width:150px;">
								<col>
								<col style="width:150px;">
								<col>
							</colgroup>
							<tbody>
								<tr>
									<th scope="row">이벤트 종류</th>
									<td colspan="3">
										<select name="EVENT_TYPE" class="js-example-basic-single" id="rights" data-select2-id="rights" tabindex="-1" aria-hidden="true">
												<option value="영화">영화</option>
												<option value="극장">극장</option>
												<option value="제휴/할인">제휴/할인</option>
												<option value="시사회/무대인사">시사회/무대인사</option>
									</select>
									</td>
								</tr>
								<tr>
									<th scope="row"><label for="ask-type">이벤트 제목</label></th>
									<td colspan="3">
										<input type="text" name="EVENT_SUBJECT" class="form__input"
											placeholder="이벤트 제목을 입력해주세요." required>
									</td>
								</tr>
								<tr>
									<th scope="row"><label for="EVENT_STARTDATE">이벤트 시작일</label></th>
									<td>
										<input type="text" name="EVENT_STARTDATE" class="form__input" placeholder="yyyymmdd" maxlength="8" required>
										
									</td>
									<th scope="row" style="text-align:center"><label for="EVENT_ENDDATE">이벤트 종료일</label></th>
									<td>
										<input type="text" name="EVENT_ENDDATE" class="form__input" placeholder="" maxlength="8"  required>
									</td>
								</tr>
								<tr>
									<th scope="row"><label for="hpNum1">이벤트 발표일</label></th>
									<td colspan="3">
										<input type="text" name="EVENT_RESULTDATE" class="form__input" placeholder="" maxlength="8"  required>
									</td>
								</tr>
								
								<tr>
									<th scope="row"><label for="qnaCustInqTitle">썸네일</label></th>
									<td colspan="3">
									<div id="imgupload">
										<label>
										<span style="color:white;"> 
										<c:if test = "${empty eventdata.EVENT_FILE}">
											<img src="${pageContext.request.contextPath}/resources/image/admin/event.png" alt="썸네일" style="width: 30px;">
										</c:if>
										<c:if test = "${!empty eventdata.EVENT_FILE}">
											<img src="${pageContext.request.contextPath}/upload${eventdata.EVENT_FILE}" alt="썸네일" style="width: 30px;">
										</c:if>
										<input type="file" id="eventthumbupfile" name="uploadthumb" value="${eventdata.EVENT_FILE}" style="color:white; " />
										</span>
										<span id="thumbfilevalue" style="display:none;"></span>
										</label>
									</div>	
									</td>
								</tr>
								<tr>
									<th scope="row"><label for="textarea">내용</label></th>
									<td colspan="3">
										<label>
											<img src="${pageContext.request.contextPath}/resources/image/admin/fileadd.png" style="width: 30px;">
											<input type="file" id="eventupfile" name="uploadevent" value="" style="color:white;" multiple />
										</label>
									<span id="filevalue" style="display:none;"></span>
									</td>
								</tr>
							</tbody>
						</table>
						</div> 
						
							<div class="col-12" >
								<button type="submit" class="form__btn" style="display:inline-block;">등록</button>
								<button type="button" id="cancelbtn" class="form__btn" style="display:inline-block; margin-left:10px;">취소</button>
							</div>
						</form>	
						
				
				<!-- end form -->
			</div>
		</div>
	</main>
<script>
$(document).ready(function(){
   

	$("#cancelbtn").click(function(){
		location.href = "/movieplus/admin/manageEvent";		
	})
	
	let check = 0;
	
		//마이페이지 - 프로필 이미지 파일 업로드 미리보기
	$('#eventthumbupfile').change(function(upload){
		
		const inputfile = $(this).val().split('\\');
		const filename = inputfile[inputfile.length - 1]; //inputfile.length - 1 = 2
		
		const pattern = /(gif|jpg|jpeg|png)$/i; //i(ignore case)는 대소문자 무시를 의미
		if(pattern.test(filename)){
			$('#thumbfilevalue').text(filename);
			
			const reader = new FileReader();	//파일을 읽기 위한 객체 생성
		 	reader.readAsDataURL(event.target.files[0]);
		  	reader.onload = function(){	//읽기에 성공했을 때 실행되는 이벤트 핸들러
			$('#imgupload img').attr('src', this.result);  
		  };
		} else {
			alert('이미지 파일(gif,jpg,jpeg,png)이 아닌 경우는 무시됩니다.');
			$(this).val('')
		}
		
	})
   
}) //ready end
</script>	
</body>
</html>