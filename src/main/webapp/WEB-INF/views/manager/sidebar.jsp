<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/bootstrap-reboot.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/bootstrap-grid.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/magnific-popup.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/jquery.mCustomScrollbar.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/select2.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/ionicons.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/admin.css">
	
<meta name="_csrf" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}">
	
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<sec:authorize access="isAuthenticated()">
         <sec:authentication property="principal" var="pinfo"/>
</sec:authorize>
	<div class="sidebar">
		<!-- sidebar logo -->
		<a href="#" class="sidebar__logo">
			<img src="${pageContext.request.contextPath}/resources/image/admin/admin_logo.png" alt="" style="width:100%;">
		</a>
		<!-- end sidebar logo -->
		
		<!-- sidebar user -->
		<div class="sidebar__user">
			<div class="sidebar__user-img">
			</div>

			<div class="sidebar__user-title">
				<span>${theaterName}관</span>
				<p>${pinfo.MEMBER_NAME}님</p>
			</div>

			<button class="sidebar__user-btn" type="button" onclick="location='${pageContext.request.contextPath}/'">
				<i class="icon ion-ios-log-out"></i>
			</button>
		</div>
		<!-- end sidebar user -->

		<!-- sidebar nav -->
		<div class="sidebar__nav-wrap">
			<ul class="sidebar__nav">
				<li class="sidebar__nav-item">
					<a href="${pageContext.request.contextPath}/manager/" class="sidebar__nav-link"><span>대쉬보드</span></a>
				</li>
				
				<li class="sidebar__nav-item">
					<a href="${pageContext.request.contextPath}/manager/manageroom" class="sidebar__nav-link"><span>상영관 관리</span></a>
				</li>
				
				<li class="sidebar__nav-item">
					<a href="${pageContext.request.contextPath}/manager/scheduling" class="sidebar__nav-link"><span>상영 스케줄 관리</span></a>
				</li>

				<li class="sidebar__nav-item">
					<a href="#" class="sidebar__nav-link"><span>공지사항 등록</span></a>
				</li>
				
				<li class="sidebar__nav-item">
					<a href="#" class="sidebar__nav-link"><span>1:1문의 답변</span></a>
				</li>
	
				<!-- end collapse -->

				
			</ul>
		</div>
		<!-- end sidebar nav -->
		
		<!-- sidebar copyright -->
		
		<sec:authorize access="hasRole('ROLE_ADMIN')">
			<div class="sidebar__copyright"><a href="/	movieplus/admin/" target="_blank">총 관리자 메뉴</a></div>
		</sec:authorize>
		<sec:authorize access="hasRole('ROLE_MANAGER')">
			<div class="sidebar__copyright">상영관 관리자 메뉴</div>
		</sec:authorize>
			
		<!-- end sidebar copyright -->
	</div>
	
	<script src="${pageContext.request.contextPath}/resources/js/admin/jquery-3.5.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/admin/bootstrap.bundle.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/admin/jquery.magnific-popup.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/admin/jquery.mousewheel.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/admin/jquery.mCustomScrollbar.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/admin/select2.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/admin/admin.js"></script>
</body>
</html>