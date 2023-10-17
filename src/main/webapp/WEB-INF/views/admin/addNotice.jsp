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
<title>공지사항 작성</title>
</head>
<body>
	<div class="sidebar">
	<sec:authentication property="principal" var="pinfo" />
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
				<span>사이트 관리자</span>
				<p>${memberInfo.MEMBER_NAME}님</p>
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
					<a href="/movieplus/admin/" class="sidebar__nav-link"><span>대쉬보드</span></a>
				</li>
				
				<li class="sidebar__nav-item">
					<a href="#" class="sidebar__nav-link"><span>회원 관리</span></a>
				</li>
				
				<li class="sidebar__nav-item">
					<a href="/movieplus/admin/managetheater" class="sidebar__nav-link"><span>극장 관리</span></a>
				</li>

				<li class="sidebar__nav-item">
					<a href="/movieplus/movie/movieAdd" class="sidebar__nav-link"><span>상영 영화 관리</span></a>
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
					<a href="#" class="sidebar__nav-link"><span>공지사항 등록</span></a>
				</li>
				
				<li class="sidebar__nav-item">
					<a href="#" class="sidebar__nav-link"><span>1:1문의 답변</span></a>
				</li>
				
				<li class="sidebar__nav-item">
					<a href="#" class="sidebar__nav-link"><span>자주 묻는 질문 관리</span></a>
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
	
	<sec:authentication property="principal" var="pinfo" />
	<main class="main">
		<div class="container-fluid">
			<div class="row">
				<!-- main title -->
				<div class="col-12">
					<div class="main__title">
						<h2>공지사항</h2>
					</div>
				</div>
				<!-- end main title -->

				<!-- form -->
				<div class="col-12">
					<form action="notice_insert" class="form" method="post">
						<div class="row row--form">

							<div class="col-12 col-md-8 form__content">
								<div class="row row--form">
									
									<div class="col-md-12">
										<input type="text" name="CUSTOMER_NOTICE_SUBJECT" class="form__input" value="[공지]&nbsp;">
									</div>

									<div class="col-md-12">
										<textarea id="text" name="CUSTOMER_NOTICE_CONTENT" class="form__textarea" placeholder="공지 내용을 입력해주세요." style="height:500px;"></textarea>
									</div>
								</div>
							</div>
							<div class="col-12" style="display:flex; margin-left: 60%;">
								<a href="${pageContext.request.contextPath}/admin/noticelist"><button type="button" class="form__btn" style="margin-right:20px;">취소</button></a>
								<button type="submit"class="form__btn">확인</button>
							</div>
						</div>
						<input type="hidden" name="CUSTOMER_NOTICE_TYPE" class="form__input" value="전체">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
					</form>
				</div>
				<!-- end form -->
			</div>
		</div>
	</main>
</body>
</html>