<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MoviePlus: 모두를 위한 영화관 </title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css" media="all">
<style>
#header.main-header{
	top:0px;
}
</style>

<script>
	//document.ready를 사용하여 main페이지 로드 시 ajax 요청 보내기 
	$(document).ready(function(){
		$.ajax({
			url:"http://localhost:9000/movieplus/movie", //영화목록 api 처리 주소
			type:"GET",
			success: function(response){
				console.log("영화 데이터 가져오기 성공!");
			},
			error: function(){
				consol.log("영화 데이터 가져오기 실패");
			}
		});
	});
</script>
</head>
<body>

	<jsp:include page="/WEB-INF/views/header.jsp"/>
	
<div class="container main-container area-ad">
		영화 리스트,,,

</div>
<!--// container -->
	
	<jsp:include page="/WEB-INF/views/footer.jsp"/>
</body>
</html>