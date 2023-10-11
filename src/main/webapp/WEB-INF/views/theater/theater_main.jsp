<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script
	src="${pageContext.request.contextPath}/resources/js/jquery-3.7.0.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/theater.js"></script>

<title></title>

</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp" />

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
							<i class="iconset ico-favo-theater"></i> <span class="font-gblue">${memberInfo.MEMBER_NAME}</span>님의
							선호영화관
							<ul class="theater-circle">
								<c:forEach var="fav" items="${favList}">
									<li><a href="detail?theaterId=${fav.THEATER_ID}" title="${fav.THEATER_NAME} 상세보기">${fav.THEATER_NAME}</a></li>
								</c:forEach>
							</ul>
	
						</div>
						</sec:authorize>
					</div>
				</div>


				<div class="tit-util mt70 mb15">
					<h3 class="tit">극장 이벤트</h3>
					<a href="#" class="more" title="극장 이벤트 더보기">더보기 <i
						class="iconset ico-arr-right-gray"></i></a>
				</div>

				<div class="event-box">
					<ul>

						<li><a href="#" class="eventBtn" data-no="14058"
							data-netfunnel="N" title="[대구경북지역] 대구경북 추석 감사제! 상세보기"> <img
								src="" alt="[대구경북지역] 대구경북 추석 감사제!">
						</a></li>

						<li><a href="#" class="eventBtn" data-no="12817"
							data-netfunnel="N" title="[세종] 황금 연휴, 시크릿 쿠폰 상세보기"> <img
								src="" alt="[세종] 황금 연휴, 시크릿 쿠폰" >
						</a></li>

					</ul>
				</div>


				<div class="tit-util mt70 mb15">
					<h3 class="tit">극장 공지사항</h3>
					<a href="#" class="more" title="극장 공지사항 더보기">더보기 <i
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



							<tr>
								<td>광명소하</td>
								<th scope="row"><a href="#" title="[광명소하] 리뉴얼 오픈 안내 상세보기">
										[광명소하] 리뉴얼 오픈 안내 </a></th>
								<td>경기</td>
								<td>2023.09.19</td>
							</tr>

							<tr>
								<td>송파파크하비오</td>
								<th scope="row"><a href="#"
									title="[송파파크하비오] 9/19~9/22 운영시간 변경 안내 상세보기"> [송파파크하비오]
										9/19~9/22 운영시간 변경 안내 </a></th>
								<td>서울</td>
								<td>2023.09.15</td>
							</tr>

							<tr>
								<td>백석벨라시타</td>
								<th scope="row"><a href="#"
									title="[백석벨라시타]제 15회 DMZ국제다큐멘터리 영화제 개최 안내 상세보기"> [백석벨라시타]제
										15회 DMZ국제다큐멘터리 영화제 개최 안내 </a></th>
								<td>경기</td>
								<td>2023.09.13</td>
							</tr>

							<tr>
								<td>검단</td>
								<th scope="row"><a href="#"
									title="[검단] 우대요금 변경 안내 (9/15부터~) 상세보기"> [검단] 우대요금 변경 안내
										(9/15부터~) </a></th>
								<td>인천</td>
								<td>2023.09.11</td>
							</tr>

							<tr>
								<td>일산</td>
								<th scope="row"><a href="#"
									title="[일산] 임시 휴업 안내 (2023년 9월 7일 부터~) 상세보기"> [일산] 임시 휴업 안내
										(2023년 9월 7일 부터~) </a></th>
								<td>경기</td>
								<td>2023.09.04</td>
							</tr>




						</tbody>
					</table>
				</div>

			</div>
		</div>
	</div>


	<jsp:include page="/WEB-INF/views/footer.jsp" />
</body>
</html>