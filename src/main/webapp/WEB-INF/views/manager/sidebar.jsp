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
			</div>

			<div class="sidebar__user-title">
				<span>강남</span>
				<p>홍길동 님</p>
			</div>

			<button class="sidebar__user-btn" type="button" onclick="location='/movieplus/'">
				<i class="icon ion-ios-log-out"></i>
			</button>
		</div>
		<!-- end sidebar user -->

		<!-- sidebar nav -->
		<div class="sidebar__nav-wrap">
			<ul class="sidebar__nav">
				<li class="sidebar__nav-item">
					<a href="/movieplus/manager/" class="sidebar__nav-link"><span>대쉬보드</span></a>
				</li>
				
				<li class="sidebar__nav-item">
					<a href="/movieplus/manager/manageroom" class="sidebar__nav-link"><span>상영관 관리</span></a>
				</li>
				
				<li class="sidebar__nav-item">
					<a href="/movieplus/manager/scheduling" class="sidebar__nav-link"><span>상영 스케줄 관리</span></a>
				</li>
				
				<li class="sidebar__nav-item">
					<a href="#" class="sidebar__nav-link"><span>스토어 관리</span></a>
				</li>
				
				<li class="sidebar__nav-item">
					<a href="#" class="sidebar__nav-link"><span>무비포스트 관리</span></a>
				</li>
				
				<li class="sidebar__nav-item">
					<a href="#" class="sidebar__nav-link"><span>감상평 관리</span></a>
				</li>
				
				<li class="sidebar__nav-item">
					<a class="sidebar__nav-link" data-toggle="collapse" href="#collapseMenu" role="button" aria-expanded="false" aria-controls="collapseMenu"><span>고객센터</span></a>

					<ul class="collapse sidebar__menu" id="collapseMenu">
						<li><a href="#">공지사항 등록</a></li>
						<li><a href="#">1:1문의 답변</a></li>
						<li><a href="#">자주 묻는 질문 관리</a></li>
					</ul>
				</li>
				<!-- end collapse -->

				
			</ul>
		</div>
		<!-- end sidebar nav -->
		
		<!-- sidebar copyright -->
		<div class="sidebar__copyright"><a href="/	movieplus/admin/" target="_blank">총 관리자 메뉴</a></div>
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