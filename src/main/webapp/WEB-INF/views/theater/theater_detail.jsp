<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="${pageContext.request.contextPath}/resources/image/favico.png" type="image/x-icon">
<title>MoviePlus: 모두를 위한 영화관</title>

<script
	src="${pageContext.request.contextPath}/resources/js/jquery-3.7.0.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/theater.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/theater_map.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/favorite_theater.js"></script>

<script
	src="${pageContext.request.contextPath}/resources/js/theater_detail_timeTable.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c5acfe6dd339afa29efececd8efe0373&libraries=services"></script>


</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp" />




	<div class="page-util">
		<div class="inner-wrap">
			<div class="location">
				<span>Home</span> <a href="#" title="극장 페이지로 이동">극장</a> <a href="#"
					title="전체극장 페이지로 이동">전체극장</a> <a href="#" title="극장정보 페이지로 이동">극장정보</a>
			</div>
		</div>
	</div>

	<input type="hidden" id="theater-address-data"
		value="${theater.THEATER_ADDRESS1}">
	<div id="contents" class="no-padding">

		<!-- theater-detail-page -->
		<div class="theater-detail-page">

			<div class="bg-img"
				style="background-image:url('${pageContext.request.contextPath}/resources/image/theater/theater_detail.jpg');"></div>
			<div class="bg-pattern"></div>
			<div class="bg-mask"></div>

			<!-- theater-all -->
			<div class="theater-all">
				<!-- theater-area-list -->
				<div class="theater-area-list">
					<ul class="area-depth1">

						<c:forEach var="location" items="${locationList}">
							<li class=""><a href="#" class="depth1"
								title="${location.value} 선택">${location.value}</a>
								<div class="area-depth2">
									<ul>
										<c:forEach var="theater" items="${theaterList}">
											<c:if test="${location.value eq theater.THEATER_LOCATION }">
												<li class=""><a
													href="detail?theaterId=${theater.THEATER_ID}"
													title="${theater.THEATER_NAME} 상세보기">${theater.THEATER_NAME}</a></li>
											</c:if>
										</c:forEach>

									</ul>
								</div></li>
						</c:forEach>


					</ul>
				</div>
				<!--// theater-area-list -->

				<p class="name">${theater.THEATER_NAME}</p>
				<input type="hidden" id="ajax-theaterId" value="${ajax_theaterId}">
				<div class="btn-util right">

					<div class="block">

						<sec:authorize access="isAnonymous()">
							<button type="button" class="btn btn-like"
								id="non-login-favorBrch">
								<i class="iconset ico-like-line"></i> <span>선호극장</span>
							</button>
						</sec:authorize>

						<sec:authorize access="isAuthenticated()">
							<button type="button" class="btn btn-like" id="favorBrch">
								<i class="iconset ico-like-line"></i> <span>선호극장</span>
							</button>
						</sec:authorize>
						<!-- 로그인 전이라면 로그인 모달창 띄우기 -->






					</div>
				</div>
			</div>
			<!--// theater-detail-cont -->
		</div>
		<!--// theater-detail-page -->

		<div class="inner-wrap pt40">

			<div class="tab-list fixed mb40 tab-layer">
				<ul id="theater-detail-tab-ul">
					<li class="on"><a href="#" title="극장정보 탭으로 이동">극장정보</a></li>
					<li class=""><a href="#" title="상영시간표 탭으로 이동">상영시간표</a></li>
					<li class=""><a href="#" title="관람료 탭으로 이동">관람료</a></li>
				</ul>
			</div>

			<div id="theater-detail-tab-div" class="tab-cont-wrap" style="margin-bottom:10px">
				<div id="tab01" class="tab-cont on">

					<div class="theater-info-text mt40">
						<p class="big">${theater.THEATER_INTRO1}</p>
						<p>${theater.THEATER_INTRO2}</p>
					</div>

					<h2 class="tit small mt70">시설안내</h2>

					<h3 class="tit small">보유시설</h3>

					<div class="theater-facility">
						<p>
							<i class="iconset ico-facility-theater"></i>일반상영관
						</p>
						<c:if test="${theater.THEATER_SPECIAL_SEAT == 'CHECKED' }">
							<p>
								<i class="iconset ico-facility-special"></i>장애인석
							</p>
						</c:if>
						<c:if test="${theater.THEATER_DISABLED_SEAT == 'CHECKED' }">
							<p>
								<i class="iconset ico-facility-disabled"></i>장애인석
							</p>
						</c:if>
					</div>

					<h2 class="tit small mt70">위치안내</h2>

					<h3 class="tit small">지도</h3>

					<!-- 지도 api 적용 -->
					<div id="map" style="width: 500px; height: 400px;"></div>

					<ul class="dot-list">
						<li><span class="font-gblue">도로명주소 : </span>
							${theater.THEATER_ADDRESS1} ${theater.THEATER_ADDRESS2}</li>

					</ul>



					<h3 class="tit small mt30">주차 안내</h3>

					<div class="parking-info">
						<div class="parking-section">
							<div class="icon-box">
								<i class="iconset ico-parking" title="주차안내">주차안내</i>
							</div>

							<div class="info">
								<p class="tit">주차요금</p>

								<ul class="dot-list">

									<li>${theater.THEATER_PARKING}</li>

								</ul>
							</div>
						</div>

					</div>

					<div id="brchNoti">

						<div class="tit-util">
							<h2 class="tit small mt70" style="float:none;">공지사항</h2>
							<a
								href="${pageContext.request.contextPath}/customer_service/regionnotice"
								class="more" title="극장 공지사항 더보기">더보기 <i
								class="iconset ico-arr-right-gray"></i></a>
						</div>

						<!-- accordion-list -->
						<div class="accordion-list" style="padding-bottom: 50px;">
							<ul>
								<c:forEach var="noticelist" items="${NoticeList}" begin="0" end="4">
								<li><div class="title">
										<a href="${pageContext.request.contextPath}/customer_service/getnoticedetail?noticedetailnum=${noticelist.CUSTOMER_NOTICE_NUM}" title="[${noticelist.CUSTOMER_NOTICE_THEATER}] ${noticelist.CUSTOMER_NOTICE_SUBJECT}">
											<div class="cont-tit">[${noticelist.CUSTOMER_NOTICE_THEATER}] ${noticelist.CUSTOMER_NOTICE_SUBJECT}</div>
											<p class="cont-admin">${noticelist.CUSTOMER_NOTICE_THEATER}</p>
											<p class="cont-date">${noticelist.CUSTOMER_NOTICE_SYSDATE}</p>
										</a>
									</div>
								</c:forEach>
							</ul>
						</div>
					</div>

				</div>

				<div id="tab02" class="tab-cont">
					<a href="#" class="ir">상영시간표 탭 화면 입니다.</a>
					<h3 class="tit mt60">
						<span id="selected-value-title" class="font-green"></span> 상영시간표
					</h3>

					<div class="time-schedule mb30">
						<div class="wrap">
							<button type="button" title="이전 날짜 보기" class="btn-pre" disabled>
								<i class="iconset ico-cld-pre"></i> <em>이전</em>
							</button>
							<div class="date-list">

								<div class="date-area">
									<div id="timetable-date-div" class="wrap"
										style="position: relative; width: 2100px; border: none; left: -70px;">
										<c:forEach var="date" items="${dateList}">
											<button class="" type="button"
												data-selectedDate="${date.date}">
												<em style="pointer-events: none;">${date.day}</em> <span
													class="day-kr"
													style="pointer-events: none; display: inline-block">${date.week}</span>

											</button>
										</c:forEach>
									</div>
								</div>
							</div>
							<button type="button" title="다음 날짜 보기" class="btn-next" disabled>
								<i class="iconset ico-cld-next"></i> <em>다음</em>
							</button>
							<div class="bg-line">
								<input type="hidden" name="datePicker" id="datePicker"
									class="hasDatepicker" value="2023.09.27">
								<button type="button" class="btn-calendar-large" title="달력보기">
									달력보기</button>
							</div>
						</div>
					</div>

					<div class="movie-option mb30" style="overflow: nonset;">
						<div class="option">
							<ul>
								<li><i class="iconset ico-sun" title="조조"></i>조조</li>
								<li><i class="iconset ico-moon" title="심야"></i>심야</li>
							</ul>
						</div>
					</div>

					<div id="theater-list-box" class="reserve theater-list-box">


					</div>

					<div class="box-border v1 mt30">
						<li>지연입장에 의한 관람불편을 최소화하고자 본 영화는 약 10분 후 시작됩니다.</li>
						<li>쾌적한 관람 환경을 위해 상영시간 이전에 입장 부탁드립니다.</li>
					</div>
				</div>

				<div id="tab03" class="tab-cont">
					<a href="#" class="ir">관람료 탭 화면 입니다.</a>

					<h2 class="tit small">영화관람료</h2>
					<div class="fee-table-box">
						<div class="fee-table">
							<p class="fee-table-tit">2D</p>
							<div class="table-wrap">
								<table class="data-table a-c"
									summary="가격표를 요일, 상영시간, 일반, 청소년 순서로 보여줍니다.">
									<caption>가격표를 요일, 상영시간, 일반, 청소년 순서로 보여줍니다.</caption>
									<colgroup>
										<col>
										<col style="width: 25%;">
										<col style="width: 25%;">
										<col style="width: 25%;">
									</colgroup>
									<thead>
										<tr>
											<th scope="col">구분</th>
											<th scope="col">일반</th>
											<th scope="col">조조</th>
											<th scope="col">심야</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>청소년</td>
											<td>13,000</td>
											<td>10,000</td>
											<td>11,000</td>
										</tr>
										<tr>
											<td>성인</td>
											<td>15,000</td>
											<td>12,000</td>
											<td>13,000</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>

					</div>
					<span style="color: #792828"> <span style="font-size: 22px">요금제</span>
					</span> <br> <br> • <span style="color: #01738b">청소년 요금</span>&nbsp;
					만7세~ 만18세 : 초등학생~고등학생(학생증, 교복, 청소년증, 의료보험증, 주민등록 등/초본, 그 외 청소년 확인
					가능 서류)<br> • 48개월 미만의 경우 증빙원(예 : 의료보험증, 주민등록 초/등본 등) 지참 시에만 무료
					관람 가능<br> <br> <br> <span style="font-size: 22px"><span
						style="color: #792828">우대적용</span></span><br> <br> • <span
						style="color: #01738b">국가유공자</span>&nbsp; 현장에서 국가유공자증을 소지한 본인 외 동반
					1인까지 적용<br> • <span style="color: #01738b">장애인</span>&nbsp;
					현장에서 복지카드를 소지한 장애인[중증 (1급~3급)까지 동반 1인까지 적용 / 경증(4급~6급)은 본인에 한함]<br>
					• <span style="color: #01738b">경로</span>&nbsp; 만65세 이상 본인에 한함(신분증
					확인)<br> • <span style="color: #01738b">미취학아동</span>&nbsp; 부모
					동반한 만4세~ 만6세까지 본인(의료보험증, 주민등록 초/등본 확인)<br> • <span
						style="color: #01738b">소방종사자</span>&nbsp; 공무원증을 소지하거나 정복을 입은 소방관
					본인<br> <br> <br> 관람가격 및 시간대 운영은 극장마다 상이할 수 있으며, 상기
					가격은 메가박스 강남점에 한하여 적용됩니다.
				</div>
			</div>
		</div>
	</div>



	<jsp:include page="/WEB-INF/views/footer.jsp" />
</body>
</html>