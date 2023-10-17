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
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

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
				<div class="col-12">
					<form enctype="multipart/form-data" id="eventadd" action="${pageContext.request.contextPath}/event/insert" class="form" method="post">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
						<div class="row row--form">
			
							<div class="col-12 col-md-7 form__content">
								<div class="row row--form">
								
								<div class="col-3">
									<select name="EVENT_TYPE" class="js-example-basic-single" id="rights" data-select2-id="rights" tabindex="-1" aria-hidden="true">
												<option value="MOVIE">영화</option>
												<option value="THEATER">극장</option>
												<option value="DISCOUNT">제휴/할인</option>
												<option value="CURTAINCALL">시사회/무대인사</option>
									</select>
								</div>
					
								<div class="col-12">
									<input type="text" name="EVENT_SUBJECT" class="form__input"
											placeholder="이벤트 제목" required>
								</div>
									
								<div class="col-12">
									<textarea id="text" name="EVENT_CONTENT"
											class="form__textarea" placeholder="이벤트 내용"></textarea>
								</div>
									
								<div class="col-3"><!-- 이벤트 시작일 -->
									<input type="text" name="EVENT_STARTDATE" class="form__input" placeholder="이벤트 시작일 (yyyymmdd)" required>
								</div>
							
								<div class="col-3"><!-- 이벤트 종료일 -->
									<input type="text" name="EVENT_ENDDATE" class="form__input" placeholder="이벤트 종료일 " required>
								</div>
							 </div>
						   </div><!-- form content end -->

							<div class="col-12">
								<label>
									<img src="${pageContext.request.contextPath}/resources/image/admin/fileadd.png" style="width: 30px;">
									<input type="file" id="eventupfile" name="uploadevent" value="" style="color:white;" multiple />
								</label>
								<span id="filevalue" style="display:none;"></span>
                            </div>

							<div class="col-12" >
								<button type="submit" class="form__btn" style="display:inline-block;">등록</button>
								<button type="button" class="form__btn" style="display:inline-block; margin-left:10px;">취소</button>
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
   
	$("#eventupfile").change(function(){
		console.log($(this).val())		//c:\fakepath\upload.png
		const inputfile = $(this).val().split('\\');
		$('#filevalue').text(inputfile[inputfile.length - 1]);
		
	});
	
   
}) //ready end
</script>	
</body>
</html>