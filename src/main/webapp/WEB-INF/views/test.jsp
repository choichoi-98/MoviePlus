<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp"/>
	
	test
	
	<!--
		0. 작업하면서 첫 커밋할때 브랜치 만들기
		
		1. test파일은 커밋하지말고 작업한 파일들 헤더랑 푸터 사이에 집어넣고 실행시키면서 테스트 하는 용도로 쓰세여
		   접속 주소는 localhost:9000/movieplus
		
		2. main.css는 메인페이지에서만 사용하는 css 파일
		   나머지 페이지는 헤더에 포함된 min.css만 사용해요
			
		3. 페이지 대부분이 <div class="container"> ~~~ </div> 긁어오면 전부 가져와져요
			긁어온뒤에 동적으로 처리하는 부분 정리
			
			메인페이지는 <div class="container main-container area-ad">
			
	 -->
	
	<jsp:include page="/WEB-INF/views/footer.jsp"/>
</body>
</html>