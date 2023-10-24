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
	<div class="sidebar">
	<sec:authorize access="isAuthenticated()">
	         <sec:authentication property="principal" var="pinfo"/>
	</sec:authorize>
		<!-- sidebar logo -->
		<a href="${pageContext.request.contextPath}" class="sidebar__logo">
			<img src="${pageContext.request.contextPath}/resources/image/admin/admin_logo.png" alt="" style="width:100%;">
		</a>
		<!-- end sidebar logo -->
		
		<!-- sidebar user -->
		<div class="sidebar__user">
			<div class="sidebar__user-img">
			</div>

			<div class="sidebar__user-title">
				<span>사이트 관리자</span>
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
					<a href="${pageContext.request.contextPath}/admin/" class="sidebar__nav-link"><span>대쉬보드</span></a>
				</li>
				
				<li class="sidebar__nav-item">
					<a href="${pageContext.request.contextPath}/admin/manageMember" class="sidebar__nav-link"><span>회원 관리</span></a>
				</li>
				
				<li class="sidebar__nav-item">
					<a href="${pageContext.request.contextPath}/admin/managetheater" class="sidebar__nav-link"><span>극장 관리</span></a>
				</li>

				<li class="sidebar__nav-item">
					<a href="${pageContext.request.contextPath}/movie/movieAdd" class="sidebar__nav-link"><span>상영 영화 관리</span></a>
				</li>
				
				<li class="sidebar__nav-item">
					<a href="${pageContext.request.contextPath}/store/admin/itemlist" class="sidebar__nav-link"><span>스토어 관리</span></a>
				</li>
				
				<li class="sidebar__nav-item">
					<a href="${pageContext.request.contextPath}/movie/manageMovieReview" class="sidebar__nav-link"><span>감상평 관리</span></a>
				</li>
				
				<li class="sidebar__nav-item">
					<a href="${pageContext.request.contextPath}/admin/noticelist" class="sidebar__nav-link"><span>공지사항 등록</span></a>
				</li>
				<li class="sidebar__nav-item">
					<a href="#" class="sidebar__nav-link"><span>자주 묻는 질문 관리</span></a>
				</li>
				
				<li class="sidebar__nav-item">
					<a href="${pageContext.request.contextPath}/admin/manageEvent" class="sidebar__nav-link"><span>이벤트 관리</span></a>
				</li>
				
				<li class="sidebar__nav-item">
					<a href="${pageContext.request.contextPath}/admin/reopenexpectlist" class="sidebar__nav-link"><span>재개봉 관리</span></a>
				</li>
				
				
			</ul>
			
		</div>
		<div class="sidebar__copyright">총 관리자 메뉴</div>
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