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
		main.css는 메인페이지에서만 쓰는 css
		main.css 넣으면 헤더, 푸터 무너짐
	 -->
	
	<jsp:include page="/WEB-INF/views/footer.jsp"/>
</body>
</html>