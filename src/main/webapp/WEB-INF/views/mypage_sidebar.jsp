<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<meta name="_csrf" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=yes">
<link rel="shortcut icon"
	href="https://www.megabox.co.kr/static/pc/images/favicon.ico">

<script
	src="${pageContext.request.contextPath}/resources/js/jquery-3.7.0.js"></script>
<body>

	<!--상단의 홈 아이콘 > 나의 무비플러스-->
	<div class="container has-lnb">
		<div class="page-util">
			<div class="inner-wrap" id="myLoaction">
				<div class="location">
					<span>Home</span> <a
						href="${pageContext.request.contextPath}/member/mypage"
						title="나의 무비플러스 페이지로 이동">나의 무비플러스</a>
				</div>
			</div>
		</div>
		<div class="inner-wrap">

			<!--사이드바-->
			<div class="lnb-area">
				<nav id="lnb">
					<p class="tit on">
						<a href="${pageContext.request.contextPath}/member/mypage"
							title="나의 무비플러스">나의 무비플러스</a>
					</p>

					<ul>
						<li class=""><a href="${pageContext.request.contextPath}/booking/success" title="예매/구매내역">예매내역</a></li>
						<li class=""><a href="${pageContext.request.contextPath}/store/success" title="예매/구매내역">구매내역</a></li>
						<li><a href="${pageContext.request.contextPath}/store/coupon" title="영화/스토어 관람권">영화/스토어 관람권</a></li>
						<li><a href="${pageContext.request.contextPath}/member/mypage/membership" title="멤버십 포인트">멤버십 포인트</a></li>
						<li><a href="${pageContext.request.contextPath}/member/mypage/moviestory" title="나의 무비스토리">나의 무비스토리</a></li>
						<li><a href="${pageContext.request.contextPath}/member/myevent" title="나의 이벤트 응모내역">나의 이벤트 응모내역</a></li>
						<li><a href="${pageContext.request.contextPath}/customer_service/myinjury" title="나의 문의">나의 문의</a></li>
						<li><a href="${pageContext.request.contextPath}/member/modifyinfo" title="회원정보">개인정보 수정</a>
					</ul>
				</nav>
			</div>

			
			
</body>

