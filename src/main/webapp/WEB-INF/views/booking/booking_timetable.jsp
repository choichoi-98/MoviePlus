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






<title></title>

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
																	<li><button type="button" class="btn">${theater.THEATER_NAME}</button></li>
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
						<div class="tab-block tab-layer mb30">
							<ul>
								<c:forEach var="location" items="${locationList}"> 
									<li class="location-select-tab" data-selected-loc="${location.value}"><a
										href="#" class="btn"
										title="${location.value} 선택">${location.value}</a></li>
								</c:forEach>
							</ul>
						</div>


						<div class="theater-list">
							<div class="theater-area-click">
								<a href="/theater?brchNo=1372" title="강남 상세보기">강남</a>
							</div> <!-- 1차 -->
							<div class="theater-type-box">
								<div class="theater-type">
									<p class="theater-name">1관</p>
									<p class="chair">총 232석</p>
								</div> <!-- 2차 -->
								<div class="theater-time">
									<div class="theater-time-box">
										<table class="time-list-table">
											<tbody>
												<tr>
													<td class="">
														<div class="td-ab">
															<div class="txt-center">
																<a href="" title="영화예매하기">
																	<div class="ico-box">
																		<i class="iconset ico-sun"></i>
																	</div>
																	<p class="time">09:50</p>
																	<p class="chair">219석</p>
																	<div class="play-time">
																		<p>09:50~11:38</p>
																		<p>1회차</p>
																	</div>
																</a>
															</div>
														</div>
													</td>
													<td class="">
														<div class="td-ab">
															<div class="txt-center">
																<a href="" title="영화예매하기">
																	<div class="ico-box">
																		<i class="iconset ico-off"></i>
																	</div>
																	<p class="time">12:00</p>
																	<p class="chair">220석</p>
																	<div class="play-time">
																		<p>12:00~13:48</p>
																		<p>2회차</p>
																	</div>
																</a>
															</div>
														</div>
													</td>
													<td class="">
														<div class="td-ab">
															<div class="txt-center">
																<a href="" title="영화예매하기">
																	<div class="ico-box">
																		<i class="iconset ico-off"></i>
																	</div>
																	<p class="time">14:10</p>
																	<p class="chair">216석</p>
																	<div class="play-time">
																		<p>14:10~15:58</p>
																		<p>3회차</p>
																	</div>
																</a>
															</div>
														</div>
													</td>
													<td class="">
														<div class="td-ab">
															<div class="txt-center">
																<a href="" title="영화예매하기">
																	<div class="ico-box">
																		<i class="iconset ico-off"></i>
																	</div>
																	<p class="time">16:20</p>
																	<p class="chair">209석</p>
																	<div class="play-time">
																		<p>16:20~18:08</p>
																		<p>4회차</p>
																	</div>
																</a>
															</div>
														</div>
													</td>
													<td class="">
														<div class="td-ab">
															<div class="txt-center">
																<a href="" title="영화예매하기">
																	<div class="ico-box">
																		<i class="iconset ico-off"></i>
																	</div>
																	<p class="time">18:30</p>
																	<p class="chair">215석</p>
																	<div class="play-time">
																		<p>18:30~20:18</p>
																		<p>5회차</p>
																	</div>
																</a>
															</div>
														</div>
													</td>
													<td class="">
														<div class="td-ab">
															<div class="txt-center">
																<a href="" title="영화예매하기">
																	<div class="ico-box">
																		<i class="iconset ico-off"></i>
																	</div>
																	<p class="time">20:40</p>
																	<p class="chair">225석</p>
																	<div class="play-time">
																		<p>20:40~22:28</p>
																		<p>6회차</p>
																	</div>
																</a>
															</div>
														</div>
													</td>
													<td class="">
														<div class="td-ab">
															<div class="txt-center">
																<a href="" title="영화예매하기">
																	<div class="ico-box">
																		<i class="iconset ico-off"></i>
																	</div>
																	<p class="time">22:50</p>
																	<p class="chair">228석</p>
																	<div class="play-time">
																		<p>22:50~24:38</p>
																		<p>7회차</p>
																	</div>
																</a>
															</div>
														</div>
													</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>
							<div class="theater-type-box">
								<div class="theater-type">
									<p class="theater-name">2관</p>
									<p class="chair">총 103석</p>
								</div>
								<div class="theater-time">
									<div class="theater-type-area">2D</div>
									<div class="theater-time-box">
										<table class="time-list-table">
											<caption>상영시간을 보여주는 표 입니다.</caption>

											<tbody>
												<tr>
													<td class="">
														<div class="td-ab">
															<div class="txt-center">
																<a href="" title="영화예매하기">
																	<div class="ico-box">
																		<i class="iconset ico-off"></i>
																	</div>
																	<p class="time">13:20</p>
																	<p class="chair">100석</p>
																	<div class="play-time">
																		<p>13:20~15:08</p>
																		<p>2회차</p>
																	</div>
																</a>
															</div>
														</div>
													</td>
													<td class="">
														<div class="td-ab">
															<div class="txt-center">
																<a href="" title="영화예매하기">
																	<div class="ico-box">
																		<i class="iconset ico-off"></i>
																	</div>
																	<p class="time">17:50</p>
																	<p class="chair">98석</p>
																	<div class="play-time">
																		<p>17:50~19:38</p>
																		<p>4회차</p>
																	</div>
																</a>
															</div>
														</div>
													</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>
							<div class="theater-type-box">
								<div class="theater-type">
									<p class="theater-name">5관</p>
									<p class="chair">총 96석</p>
								</div>
								<div class="theater-time">
									<div class="theater-type-area">2D</div>
									<div class="theater-time-box">
										<table class="time-list-table">
											<caption>상영시간을 보여주는 표 입니다.</caption>

											<tbody>
												<tr>
													<td class="">
														<div class="td-ab">
															<div class="txt-center">
																<a href="" title="영화예매하기">
																	<div class="ico-box">
																		<i class="iconset ico-off"></i>
																	</div>
																	<p class="time">23:55</p>
																	<p class="chair">95석</p>
																	<div class="play-time">
																		<p>23:55~25:43</p>
																		<p>6회차</p>
																	</div>
																</a>
															</div>
														</div>
													</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>


						<div class="theater-list">
							<div class="theater-area-click">
								<a href="/theater?brchNo=0023"
									title="강남대로&amp;#40;씨티&amp;#41; 상세보기">강남대로(씨티)</a>
							</div>
							<div class="theater-type-box">
								<div class="theater-type">
									<p class="theater-name">1관</p>
									<p class="chair">총 230석</p>
								</div>
								<div class="theater-time">
									<div class="theater-type-area">2D</div>
									<div class="theater-time-box">
										<table class="time-list-table">
											<caption>상영시간을 보여주는 표 입니다.</caption>

											<tbody>
												<tr>
													<td class="">
														<div class="td-ab">
															<div class="txt-center">
																<a href="" title="영화예매하기">
																	<div class="ico-box">
																		<i class="iconset ico-sun"></i>
																	</div>
																	<p class="time">11:45</p>
																	<p class="chair">230석</p>
																	<div class="play-time">
																		<p>11:45~13:33</p>
																		<p>2회차</p>
																	</div>
																</a>
															</div>
														</div>
													</td>
													<td class="">
														<div class="td-ab">
															<div class="txt-center">
																<a href="" title="영화예매하기">
																	<div class="ico-box">
																		<i class="iconset ico-off"></i>
																	</div>
																	<p class="time">13:45</p>
																	<p class="chair">228석</p>
																	<div class="play-time">
																		<p>13:45~15:33</p>
																		<p>3회차</p>
																	</div>
																</a>
															</div>
														</div>
													</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>
							<div class="theater-type-box">
								<div class="theater-type">
									<p class="theater-name">2관</p>
									<p class="chair">총 240석</p>
								</div>
								<div class="theater-time">
									<div class="theater-type-area">2D</div>
									<div class="theater-time-box">
										<table class="time-list-table">
											<caption>상영시간을 보여주는 표 입니다.</caption>

											<tbody>
												<tr>
													<td class="">
														<div class="td-ab">
															<div class="txt-center">
																<a href="" title="영화예매하기">
																	<div class="ico-box">
																		<i class="iconset ico-off"></i>
																	</div>
																	<p class="time">17:20</p>
																	<p class="chair">229석</p>
																	<div class="play-time">
																		<p>17:20~19:08</p>
																		<p>4회차</p>
																	</div>
																</a>
															</div>
														</div>
													</td>
													<td class="">
														<div class="td-ab">
															<div class="txt-center">
																<a href="" title="영화예매하기">
																	<div class="ico-box">
																		<i class="iconset ico-off"></i>
																	</div>
																	<p class="time">19:30</p>
																	<p class="chair">236석</p>
																	<div class="play-time">
																		<p>19:30~21:18</p>
																		<p>5회차</p>
																	</div>
																</a>
															</div>
														</div>
													</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
						<!-- 윗 부분 극장 별 조회 -->
						


					</div>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="/WEB-INF/views/footer.jsp" />
</body>
</html>