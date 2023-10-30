<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script
	src="${pageContext.request.contextPath}/resources/js/jquery-3.7.0.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/theater.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/favorite_theater.js"></script>


<title></title>

</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp" />
	<sec:authorize access="isAuthenticated()">
		<sec:authentication property="principal" var="pinfo" />
	</sec:authorize>

	<div class="container">

		<div class="page-util">
			<div class="inner-wrap">
				<div class="location">
					<span>Home</span> <a href="#" title="극장 페이지로 이동">극장</a> <a href="#"
						title="전체극장 페이지로 이동">전체극장</a>
				</div>
			</div>
		</div>

		<!-- content -->
		<div id="contents" class="no-padding">


			<!--// theater-main -->
			<div class="inner-wrap">
				<h2 class="tit mt40">전체극장</h2>
				<div class="theater-box" style="height: 292px;">
					<div class="theater-place">
						<ul>
							<c:forEach var="location" items="${locationList}"
								varStatus="status">
								<c:choose>
									<c:when test="${status.index == 0}">
										<li class="on">
									</c:when>
									<c:otherwise>
										<li class="">
									</c:otherwise>
								</c:choose>
								<button type="button" class="sel-city">${location.value}</button>

								<div class="theater-list">
									<ul>
										<c:forEach var="theater" items="${theaterList}">
											<c:if test="${location.value eq theater.THEATER_LOCATION }">
												<li><a href="detail?theaterId=${theater.THEATER_ID}"
													title="${theater.THEATER_NAME} 상세보기">${theater.THEATER_NAME}</a></li>
											</c:if>
										</c:forEach>
									</ul>
								</div>
								</li>
							</c:forEach>
						</ul>
					</div>

					<div class="user-theater">


						<sec:authorize access="isAnonymous()">
							<!-- 로그인 전 -->
							<div>
								<i class="iconset ico-favo-theater"></i> 나의 선호영화관 정보 <a href="#"
									class="button small ml10" id="movelogin" title="로그인하기">로그인하기</a>
							</div>
						</sec:authorize>

						<sec:authorize access="isAuthenticated()">
							<!-- 로그인 후 -->
							<div>
								<i class="iconset ico-favo-theater"></i> <span
									class="font-gblue">${pinfo.MEMBER_NAME}</span>님의 선호영화관
								<ul id="fav-theater-list" class="theater-circle">

								</ul>
								
								<a href="#" class="button small float-r fav-modal-on" title="선호영화관 관리"> <i class="iconset ico-edit"></i> 선호영화관 관리</a>

							</div>
						</sec:authorize>
					</div>
				</div>

				<div class="tit-util mt70 mb15">
					<h3 class="tit">극장 공지사항</h3>
					<a
						href="${pageContext.request.contextPath}/customer_service/regionnotice"
						class="more" title="극장 공지사항 더보기">더보기 <i
						class="iconset ico-arr-right-gray"></i></a>
				</div>

				<div class="table-wrap">
					<table class="board-list">
						<caption>극장, 제목, 지역, 등록일이 들어간 극장 공지사항 목록</caption>
						<colgroup>
							<col style="width: 150px;">
							<col>
							<col style="width: 150px;">
							<col style="width: 120px;">
						</colgroup>
						<thead>
							<tr>
								<th scope="col">극장</th>
								<th scope="col">제목</th>
								<th scope="col">지역</th>
								<th scope="col">등록일</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="noticelist" items="${NoticeList}" begin="0" end="4">
							<tr>
								<td>${noticelist.CUSTOMER_NOTICE_THEATER}</td>
								<th scope="row">
								<a href="${pageContext.request.contextPath}/customer_service/getnoticedetail?noticedetailnum=${noticelist.CUSTOMER_NOTICE_NUM}" title= "${noticelist.CUSTOMER_NOTICE_SUBJECT}">
										[${noticelist.CUSTOMER_NOTICE_THEATER}] ${noticelist.CUSTOMER_NOTICE_SUBJECT} </a></th>
								<td>${noticelist.CUSTOMER_NOTICE_REGION}</td>
								<td>${noticelist.CUSTOMER_NOTICE_SYSDATE}</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>

			</div>
		</div>
	</div>

	<jsp:include page="/WEB-INF/views/theater/favorite_theater_modal.jsp" />

	<jsp:include page="/WEB-INF/views/footer.jsp" />
</body>
</html>