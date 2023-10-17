<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script
	src="${pageContext.request.contextPath}/resources/js/jquery-3.7.0.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/booking_timetable.js"></script>

<title></title>

</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp" />

	<div class="page-util" style="">
		<div class="inner-wrap">
			<div class="location">
				<span>Home</span> <a href="#" title="예매 페이지로 이동">예매</a> <a href="#"
					title="빠른예매 페이지로 이동">빠른예매</a>
			</div>


		</div>
	</div>

	<div class="container" style="padding-bottom: 240px;">
		<div class="page-util fixed" style="">
			<div class="inner-wrap">
				<div class="location">
					<span>Home</span> <a href="#" title="예매 페이지로 이동">예매</a> <a href="#"
						title="빠른예매 페이지로 이동">빠른예매</a>
				</div>


			</div>
		</div>

		<div id="bokdMBooking" style="overflow: hidden; height: 760px;">
			<input type="hidden" id="fast-movieCode" value="${fast-movieCode}">
			<div class="inner-wrap"
				style="padding-top: 40px; padding-bottom: 100px;">

				<!-- quick-reserve -->
				<div class="quick-reserve">
					<div class="tit-util">
						<h2 class="tit">빠른예매</h2>
					</div>


					<div class="mege-quick-reserve-inculde">

						<!-- time-schedule -->
						<div class="time-schedule quick">
							<div class="wrap">

								<!-- 이전날짜 -->
								<button type="button" title="이전 날짜 보기" class="btn-pre"
									disabled="true">
									<i class="iconset ico-cld-pre"></i> <em>이전</em>
								</button>
								<!--// 이전날짜 -->

								<div class="date-list">
									<!-- 년도, 월 표시 -->
									<div class="date-area" id="formDeList">
										<div class="wrap"
											style="position: relative; width: 2100px; border: none; left: -70px;">
											<c:forEach var="date" items="${dateList}">
												<button class="timetable-date" type="button"
													data-date="${date.date}">
													<span class="ir">${date.year}년 ${date.month}월</span><em
														style="pointer-events: none;">${date.day}<span
														style="pointer-events: none;" class="ir">${date.week}</span></em><span
														class="day-kr"
														style="pointer-events: none; display: inline-block">${date.week}</span>
												</button>
											</c:forEach>
										</div>
									</div>
								</div>

								<!-- 다음날짜 -->
								<button type="button" title="다음 날짜 보기" class="btn-next"
									disabled="true">
									<i class="iconset ico-cld-next"></i> <em>다음</em>
								</button>
								<!--// 다음날짜 -->

								<!-- 달력보기 -->
								<div class="bg-line">
									<input type="hidden" id="datePicker" value="2023.09.28"
										class="hasDatepicker">
									<button type="button" id="calendar" class="btn-calendar-large"
										title="달력보기">달력보기</button>

								</div>
								<!--// 달력보기 -->
							</div>
						</div>
						<!--// time-schedule -->

						<!-- quick-reserve-area -->
						<div class="quick-reserve-area">

							<!-- movie-choice : 영화 선택  -->
							<div class="movie-choice">
								<p class="tit">영화</p>

								<!-- list-area -->
								<div class="list-area">

									<!-- all : 전체 -->
									<div class="all-list">
										<button type="button" class="btn-tab on" id="movieAll">전체</button>
										<div class="list">
											<div
												class="scroll m-scroll mCustomScrollbar _mCS_1 mCS_no_scrollbar"
												id="movieList">
												<div id="mCSB_1_container"
													class="mCSB_container mCS_no_scrollbar_y"
													style="width: 100%; height: 100%; overflow-x: hidden; overflow-y: auto">
													<ul id="movie-timetable-ul">
														<!-- ajax 리스트 업 -->
													</ul>
												</div>
											</div>
										</div>
									</div>
									<!--// other-list  : 큐레이션 -->
								</div>
								<!--// list-area -->

								<!-- view-area -->
								<div class="view-area">

									<!-- 영화 선택 하지 않았을 때 -->
									<div class="choice-all" id="choiceMovieNone" style="display:;">
										<strong>상영 영화</strong> <span>목록에서 영화를 선택하세요.</span>
									</div>
								</div>
								<!--// view-area -->
							</div>
							<!--// movie-choice : 영화 선택  -->

							<!-- theater-choice : 극장 선택  -->
							<div class="theater-choice">
								<div class="tit-area">
									<p class="tit">극장</p>
								</div>

								<!-- list-area -->
								<div class="list-area" id="brchTab">

									<!-- all-list : 전체 -->
									<div class="all-list">
										<button type="button" class="btn-tab"
											style="border-right: 1px solid #d9d8dd">전체</button>
										<div class="list">
											<div class="scroll" id="brchList">
												<ul>
													<li id="liFavorBrch" class="booking-theater-li"><button
															id="btnFavorBrch" type="button" class="btn">
															<span class="txt">선호극장</span><span class="theaterRoomCnt">(${favTheaterCnt})</span>
														</button>


														<div class="depth" id="favorite">
															<c:choose>
																<c:when test="${empty favTheaterList}">
																	<div class="no-favorite">
																		<div class="wrap">
																			<i class="iconset ico-theater-favorite"></i>
																			<div class="txt">등록된 극장이 없습니다</div>
																		</div>
																	</div>
																</c:when>
																<c:otherwise>
																	<div
																		class="detail-list m-scroll mCustomScrollbar _mCS_4 mCS_no_scrollbar">
																		<div id="mCSB_4_container"
																			class="mCSB_container mCS_no_scrollbar_y"
																			style="width: 100%; height: 100%; overflow-x: hidden; overflow-y: auto"
																			dir="ltr">
																			<ul class="theater-ul-list">
																				<c:forEach var="theater" items="${favTheaterList}">
																					<li class="theater-timetable"
																						data-theaterId="${theater.THEATER_ID}"><button
																							id="btn" class="theater-btn" type="button"
																							class="">${theater.THEATER_NAME}</button></li>
																				</c:forEach>
																			</ul>
																		</div>
																	</div>
																</c:otherwise>
															</c:choose>



														</div></li>



													<c:forEach var="location" items="${locationList}">
														<li class='booking-theater-li'>
															<button type="button" class="btn"
																data-location="${location.value}">
																<!-- on -->
																<span class="txt">${location.value}</span><span
																	class="theaterRoomCnt">(0)</span>
															</button>
															<div class="depth">
																<!-- on -->
																<div
																	class="detail-list m-scroll area-cd10 mCustomScrollbar _mCS_5 mCS_no_scrollbar">
																	<div id="mCSB_5_container"
																		class="mCSB_container mCS_no_scrollbar_y"
																		style="width: 100%; height: 100%; overflow-x: hidden; overflow-y: auto">
																		<ul class="theater-ul-list">
																			<c:forEach var="theater" items="${theaterList}">
																				<c:if
																					test="${theater.THEATER_LOCATION eq location.value}">
																					<li class="theater-timetable"
																						data-theaterId="${theater.THEATER_ID}"><button
																							id="btn" class="theater-btn" type="button">${theater.THEATER_NAME}</button></li>
																				</c:if>
																			</c:forEach>
																		</ul>
																	</div>
																</div>
															</div>
														</li>
													</c:forEach>

												</ul>
											</div>
										</div>
									</div>
									<!--// all-list : 전체 -->

								</div>
								<!--// list-area -->

								<!-- view-area -->
								<div class="view-area">

									<!-- 영화관 선택 하지 않았을 때 -->
									<div class="choice-all" id="choiceBrchNone" style="display:;">
										<strong>전체극장</strong> <span>목록에서 극장을 선택하세요.</span>
									</div>

								</div>
								<!--// view-area -->


							</div>
							<!--// theater-choice : 영화관 선택  -->

							<!-- time-choice : 상영시간표 선택 -->
							<div class="time-choice">
								<div class="tit-area">
									<p class="tit">시간</p>

									<div class="right legend">
										<i class="iconset ico-sun" title="조조"></i> 조조 <i
											class="iconset ico-moon" title="심야"></i> 심야
									</div>
								</div>


								<!-- movie-schedule-area : 시간표 출력 영역-->
								<div class="movie-schedule-area">

									<!-- 영화, 영화관 선택 안했을때 -->
									<!---->
									<div class="no-result" id="playScheduleNonList"
										style="">
										<i class="iconset ico-movie-time"></i>

										<p class="txt">
											영화나 극장을 선택하시면<br> 상영시간표를 비교하여 볼 수 있습니다.
										</p>
									</div>
									
									<div class="no-result" id="playScheduleNonList2"
										style="display:none">
										<i class="iconset ico-movie-time"></i>

										<p class="txt">
											상영 스케줄이 없습니다.
										</p>
									</div>


									<!-- 영화, 영화관 선택 했을때 -->
									<div class="result">
										<div
											class="scroll m-scroll mCustomScrollbar _mCS_23 mCS_no_scrollbar"
											id="playScheduleList" style="">
											<div id="mCSB_23"
												class="mCustomScrollBox mCS-light mCSB_vertical mCSB_inside"
												style="max-height: none;" tabindex="0">
												<div id="mCSB_23_container"
													class="mCSB_container mCS_no_scrollbar_y"
													style="width: 100%; height: 100%; overflow-x: hidden; overflow-y: auto">
													<ul id="scheduleListResult">
														
													</ul>
												</div>
											</div>
										</div>

									</div>
								</div>
								<!--// movie-schedule-area : 시간표 출력 영역-->

							</div>
							<!--// time-choice : 상영시간표 선택 -->
						</div>
						<!--// quick-reserve-area -->
					</div>
					<!--// mege-quick-reserve-inculde : 다른 페이지에서 iframe 으로 설정될 영역 -->

				</div>
				<!--// quick-reserve -->


			</div>
		</div>
	</div>

	<jsp:include page="/WEB-INF/views/footer.jsp" />
</body>
</html>