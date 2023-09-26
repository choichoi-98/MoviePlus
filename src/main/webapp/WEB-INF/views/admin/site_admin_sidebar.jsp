<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/bootstrap-reboot.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/bootstrap-grid.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/magnific-popup.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/jquery.mCustomScrollbar.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/select2.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/ionicons.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/admin.css">
	
	
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="sidebar">
		<!-- sidebar logo -->
		<a href="#" class="sidebar__logo">
			<img src="${pageContext.request.contextPath}/resources/image/admin/admin_logo.png" alt="" style="width:100%;">
		</a>
		<!-- end sidebar logo -->
		
		<!-- sidebar user -->
		<div class="sidebar__user">
			<div class="sidebar__user-img">
				<img src="img/user.svg" alt="">
			</div>

			<div class="sidebar__user-title">
				<span>사이트 관리자</span>
				<p>어드민 님</p>
			</div>

			<button class="sidebar__user-btn" type="button" onclick="location='/movieplus/'">
			ㅇ
			</button>
		</div>
		<!-- end sidebar user -->

		<!-- sidebar nav -->
		<div class="sidebar__nav-wrap">
			<ul class="sidebar__nav">
				<li class="sidebar__nav-item">
					<a href="#" class="sidebar__nav-link sidebar__nav-link--active"><span>극장 관리</span></a>
				</li>

				<li class="sidebar__nav-item">
					<a href="#" class="sidebar__nav-link"><span>상영 영화 관리</span></a>
				</li>
				
				<li class="sidebar__nav-item">
					<a href="#" class="sidebar__nav-link"><span>이벤트 관리</span></a>
				</li>
				
				<li class="sidebar__nav-item">
					<a href="#" class="sidebar__nav-link"><span>재개봉 관리</span></a>
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