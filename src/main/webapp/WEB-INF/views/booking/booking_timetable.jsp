<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">




<script
	src="${pageContext.request.contextPath}/resources/js/jquery-3.7.0.js"></script>
	
<script src="${pageContext.request.contextPath}/resources/js/timetable.js"></script>






<link rel="icon" href="${pageContext.request.contextPath}/resources/image/favico.png" type="image/x-icon">
<title>MoviePlus: 모두를 위한 영화관</title>

</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp" />

	<div id="schdlContainer" class="container">
		<input type="hidden" id="playDe" name="playDe" value="">
		<div class="page-util">
			<div class="inner-wrap">
				<div class="location">
					<span>Home</span> <a href="#" title="예매 페이지로 이동">예매</a> <a href="#"
						title="상영시간표 페이지로 이동">상영시간표</a>
				</div>

			</div>
		</div>

		<div id="contents">
			<div class="inner-wrap">
				<div class="time-table-page">
					<div class="movie-choice-area">
						<div class="tab-left-area">
							<ul>
								<li class="on"><a href="#" id="tab-left-area-movie"
									title="영화별 선택" class="btn"><i class="iconset ico-tab-movie"></i>
										영화별</a></li>
								<li><a href="#" id="tab-left-area-theater" title="극장별 선택"
									class="btn"><i class="iconset ico-tab-theater"></i> 극장별</a></li>
							</ul>
						</div>

						<div class="ltab-layer-wrap">
							<div id="masterMovie" class="ltab-layer-cont has-img on">
								<div class="wrap tab-area">
									<div class="tab-list-choice">
										<ul>
											<li>영화 목록</li>
										</ul>
									</div>
									<div class="list-section">
										<div id="masterMovie_AllMovie" class="tab-layer-cont on">
											<div class="scroll m-scroll mCustomScrollbar _mCS_2">
												<div id="mCSB_2_container" class="mCSB_container"
													style="width: 100%; height: 100%; overflow-x: hidden; overflow-y: auto"
													dir="ltr">
													<ul class="list" id="tab-movieList">
														<c:forEach var="timetable_movie" items="${movieList}"
															varStatus="status">
															<li><button data-movieCode="${timetable_movie.movie_Code}" type="button" class="btn disabled">${timetable_movie.movie_Title}</button></li>
														</c:forEach>
													</ul>
												</div>

											</div>
										</div>
									</div>
								</div>
								<div class="poster-section">
									<div class="table">
										<div id="poster-div" class="td">
											<a id="selected_movie_poster" href="#" title=""><img
												class="poster" src="" alt="포스터 없음"></a>
										</div>
									</div>
								</div>
							</div>

							<div id="masterBrch" class="ltab-layer-cont">
								<a href="#" class="ir"></a>
								<div class="wrap tab-area">
									<div class="tab-list-choice">
										<ul id="tab-list-location">
											<c:forEach var="location" items="${locationList}" varStatus="status">
												<li><a href="#" title="${location.value}지점 선택" class="location-tab" id="loc-${status.index}">${location.value}</a></li>
											</c:forEach>
										</ul>
									</div>
									
									
									<div class="list-section" id="tab-list-location-section">
										
										<c:forEach var="location" items="${locationList}" varStatus="status"> 
											<div class="tab-layer-cont" id="tab-${status.index}">
												<div
													class="scroll m-scroll mCustomScrollbar _mCS_4 mCS_no_scrollbar">
													<div id="mCSB_4_container"
												class="mCSB_container mCS_y_hidden mCS_no_scrollbar_y"
														style="width: 100%; height: 100%; overflow-x: hidden; overflow-y: auto"
														dir		="ltr">
														<ul class="list" id="tab-theaterList">
															<c:forEach var="theater" items="${theaterList}">
																<c:if test="${theater.THEATER_LOCATION eq location.value}">
																	<li><button data-theaterId="${theater.THEATER_ID}" type="button" class="btn">${theater.THEATER_NAME}</button></li>
																</c:if>
															</c:forEach>
														</ul>
													</div>
												</div>
											</div>
										</c:forEach>
										
									</div>
								</div>
							</div>
						</div>
					</div>

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
											<button class="" type="button" data-selectedDate="${date.date}">
											 <em
													style="pointer-events: none;">${date.day}</em> <span
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
						<div id="timeTable-location-select" class="tab-block tab-layer mb30">
							<ul>
								<c:forEach var="location" items="${locationList}"> 
									<li class="location-select-tab" data-selected-loc="${location.value}"><a
										href="#" class="btn"
										title="${location.value} 선택">${location.value}</a></li>
								</c:forEach>
							</ul>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="/WEB-INF/views/footer.jsp" />
</body>
</html>