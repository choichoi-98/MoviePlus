<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script
	src="${pageContext.request.contextPath}/resources/js/jquery-3.7.0.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/booking.js"></script>
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
								<li class="on"><a href="#" id="tab-left-area-movie" title="영화별 선택" class="btn"><i
										class="iconset ico-tab-movie"></i> 영화별</a></li>
								<li><a href="#" id="tab-left-area-theater" title="극장별 선택" class="btn"><i
										class="iconset ico-tab-theater"></i> 극장별</a></li>
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
												<div id="mCSB_2"
													class="mCustomScrollBox mCS-light mCSB_vertical mCSB_inside"
													style="max-height: none;" tabindex="0">
													<div id="mCSB_2_container" class="mCSB_container"
														style="position: relative; top: 0; left: 0;" dir="ltr">
														<ul class="list">
															<li><button type="button" class="btn disabled on">천박사
																	퇴마 연구소: 설경의 비밀</button></li>
															<li><button type="button" class="btn disabled">거미집</button></li>
															<li><button type="button" class="btn disabled">1947
																	보스톤</button></li>
															<li><button type="button" class="btn disabled">30일</button></li>
															<li><button type="button" class="btn disabled">더
																	넌 2</button></li>
															<li><button type="button" class="btn disabled">크리에이터</button></li>
															<li><button type="button" class="btn disabled">씰벤져스
																	: 용감한 바다특공대</button></li>
															<li><button type="button" class="btn">잠</button></li>
															<li><button type="button" class="btn disabled">화란</button></li>
															<li><button type="button" class="btn">그란
																	투리스모</button></li>
															<li><button type="button" class="btn">가문의
																	영광: 리턴즈</button></li>
															<li><button type="button" class="btn disabled">극장판
																	엉덩이 탐정: 미스터리 가면 ~최강의 대결</button></li>
															<li><button type="button" class="btn">오펜하이머</button></li>
															<li><button type="button" class="btn">아이돌
																	마스터 밀리언 라이브!</button></li>
														</ul>
													</div>
													<div id="mCSB_2_scrollbar_vertical"
														class="mCSB_scrollTools mCSB_2_scrollbar mCS-light mCSB_scrollTools_vertical"
														style="display: block;">
														<div class="mCSB_draggerContainer">
															<div id="mCSB_2_dragger_vertical" class="mCSB_dragger"
																style="position: absolute; min-height: 30px; display: block; height: 55px; max-height: 190px; top: 0px;">
																<div class="mCSB_dragger_bar" style="line-height: 30px;"></div>
															</div>
															<div class="mCSB_draggerRail"></div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="poster-section">
									<div class="table">
										<div class="td">
											<a href="#" title="천박사 퇴마 연구소: 설경의 비밀 상세보기"><img
												class="poster" src="" alt="영화 포스터 이미지"></a>
										</div>
									</div>
								</div>
							</div>

							<div id="masterBrch" class="ltab-layer-cont">
								<a href="#" class="ir"></a>
								<div class="wrap tab-area">
									<div class="tab-list-choice">
										<ul>
											<li><a
												href="#"
												title="서울지점 선택" data-area-cd="10" class="on">서울(20)</a></li>
											<li><a
												href="#"
												title="경기지점 선택" data-area-cd="30">경기(31)</a></li>
											<li><a
												href="#"
												title="인천지점 선택" data-area-cd="35">인천(5)</a></li>

										</ul>
									</div>
									<div class="list-section">
										<div id="tab10" class="tab-layer-cont">
											<div
												class="scroll m-scroll mCustomScrollbar _mCS_4 mCS_no_scrollbar">
												<div id="mCSB_4"
													class="mCustomScrollBox mCS-light mCSB_vertical mCSB_inside"
													style="max-height: none;" tabindex="0">
													<div id="mCSB_4_container"
														class="mCSB_container mCS_y_hidden mCS_no_scrollbar_y"
														style="position: relative; top: 0; left: 0;" dir="ltr">
														<ul class="list">
															<li><button type="button" class="btn"
																	data-area-cd="10" data-brch-no="1372">강남</button></li>
															<li><button type="button" class="btn"
																	data-area-cd="10" data-brch-no="0023">강남대로(씨티)</button>
															</li>
															<li><button type="button" class="btn"
																	data-area-cd="10" data-brch-no="1341">강동</button></li>
															<li><button type="button" class="btn"
																	data-area-cd="10" data-brch-no="1431">군자</button></li>
															<li><button type="button" class="btn"
																	data-area-cd="10" data-brch-no="0041">더 부티크
																	목동현대백화점</button></li>
															<li><button type="button" class="btn"
																	data-area-cd="10" data-brch-no="1003">동대문</button></li>
														</ul>
													</div>
													<div id="mCSB_4_scrollbar_vertical"
														class="mCSB_scrollTools mCSB_4_scrollbar mCS-light mCSB_scrollTools_vertical"
														style="display: none;">
														<div class="mCSB_draggerContainer">
															<div id="mCSB_4_dragger_vertical" class="mCSB_dragger"
																style="position: absolute; min-height: 30px; height: 0px; top: 0px;">
																<div class="mCSB_dragger_bar" style="line-height: 30px;"></div>
															</div>
															<div class="mCSB_draggerRail"></div>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div id="tab12" class="tab-layer-cont">
											<div
												class="scroll m-scroll mCustomScrollbar _mCS_4 mCS_no_scrollbar">
												<div id="mCSB_4"
													class="mCustomScrollBox mCS-light mCSB_vertical mCSB_inside"
													style="max-height: none;" tabindex="0">
													<div id="mCSB_4_container"
														class="mCSB_container mCS_y_hidden mCS_no_scrollbar_y"
														style="position: relative; top: 0; left: 0;" dir="ltr">
														<ul class="list">
															<li><button type="button" class="btn"
																	data-area-cd="10" data-brch-no="1372">강남</button></li>
															<li><button type="button" class="btn"
																	data-area-cd="10" data-brch-no="0023">강남대로(씨티)</button>
															</li>
															<li><button type="button" class="btn"
																	data-area-cd="10" data-brch-no="1341">강동</button></li>
															<li><button type="button" class="btn"
																	data-area-cd="10" data-brch-no="1431">군자</button></li>
															<li><button type="button" class="btn"
																	data-area-cd="10" data-brch-no="0041">더 부티크
																	목동현대백화점</button></li>
															<li><button type="button" class="btn"
																	data-area-cd="10" data-brch-no="1003">동대문</button></li>
														</ul>
													</div>
													<div id="mCSB_4_scrollbar_vertical"
														class="mCSB_scrollTools mCSB_4_scrollbar mCS-light mCSB_scrollTools_vertical"
														style="display: none;">
														<div class="mCSB_draggerContainer">
															<div id="mCSB_4_dragger_vertical" class="mCSB_dragger"
																style="position: absolute; min-height: 30px; height: 0px; top: 0px;">
																<div class="mCSB_dragger_bar" style="line-height: 30px;"></div>
															</div>
															<div class="mCSB_draggerRail"></div>
														</div>
													</div>
												</div>
											</div>
										</div>




									</div>
								</div>
							</div>


						</div>
					</div>

					<h3 class="tit mt60">
						<span class="font-green">선택한 값</span> 상영시간표
					</h3>

					<div class="time-schedule mb30">
						<div class="wrap">
							<button type="button" title="이전 날짜 보기" class="btn-pre" disabled>
								<i class="iconset ico-cld-pre"></i> <em>이전</em>
							</button>
							<div class="date-list">
								<div class="year-area">
									<div class="year" style="left: 30px; z-index: 1; opacity: 1;">2023.09</div>
									<div class="year" style="left: 380px; z-index: 1; opacity: 1;">2023.10</div>
								</div>
								<div class="date-area">
									<div class="wrap"
										style="position: relative; width: 2100px; border: none; left: -70px;">
										<button class="disabled" type="button" tabindex="-1">
											<span class="ir">2023년 9월</span> <em
												style="pointer-events: none;">25<span
												style="pointer-events: none;" class="ir">일</span></em> <span
												class="day-kr"
												style="pointer-events: none; display: inline-block">월</span>
											<span class="day-en"
												style="pointer-events: none; display: none">Mon</span>
										</button>
										<button class="disabled" type="button">
											<span class="ir">2023년 9월</span> <em
												style="pointer-events: none;">26<span
												style="pointer-events: none;" class="ir">일</span></em> <span
												class="day-kr"
												style="pointer-events: none; display: inline-block">오늘</span>
											<span class="day-en"
												style="pointer-events: none; display: none">Tue</span>
										</button>
										<button class="on" type="button">
											<span class="ir">2023년 9월</span> <em
												style="pointer-events: none;">27<span
												style="pointer-events: none;" class="ir">일</span></em> <span
												class="day-kr"
												style="pointer-events: none; display: inline-block">내일</span>
											<span class="day-en"
												style="pointer-events: none; display: none">Wed</span>
										</button>
										<button class="" type="button">
											<span class="ir">2023년 9월</span> <em
												style="pointer-events: none;">28<span
												style="pointer-events: none;" class="ir">일</span></em> <span
												class="day-kr"
												style="pointer-events: none; display: inline-block">목</span>
											<span class="day-en"
												style="pointer-events: none; display: none">Thu</span>
										</button>
										<button class="" type="button">
											<span class="ir">2023년 9월</span> <em
												style="pointer-events: none;">29<span
												style="pointer-events: none;" class="ir">일</span></em> <span
												class="day-kr"
												style="pointer-events: none; display: inline-block">금</span>
											<span class="day-en"
												style="pointer-events: none; display: none">Fri</span>
										</button>
										<button class="sat" type="button">
											<span class="ir">2023년 9월</span> <em
												style="pointer-events: none;">30<span
												style="pointer-events: none;" class="ir">일</span></em> <span
												class="day-kr"
												style="pointer-events: none; display: inline-block">토</span>
											<span class="day-en"
												style="pointer-events: none; display: none">Sat</span>
										</button>
										<button class="holi" type="button">
											<span class="ir">2023년 10월</span><em
												style="pointer-events: none;">1 <span
												style="pointer-events: none;" class="ir">일</span></em> <span
												class="day-kr"
												style="pointer-events: none; display: inline-block">일</span>
											<span class="day-en"
												style="pointer-events: none; display: none">Sun</span>
										</button>
										<button class="" type="button">
											<span class="ir">2023년 10월</span><em
												style="pointer-events: none;">2<span
												style="pointer-events: none;" class="ir">일</span></em> <span
												class="day-kr"
												style="pointer-events: none; display: inline-block">월</span>
											<span class="day-en"
												style="pointer-events: none; display: none">Mon</span>
										</button>
										<button class="" type="button">
											<span class="ir">2023년 10월</span> <em
												style="pointer-events: none;">3<span
												style="pointer-events: none;" class="ir">일</span></em> <span
												class="day-kr"
												style="pointer-events: none; display: inline-block">화</span>
											<span class="day-en"
												style="pointer-events: none; display: none">Tue</span>
										</button>
										<button class="" type="button">
											<span class="ir">2023년 10월</span> <em
												style="pointer-events: none;">4<span
												style="pointer-events: none;" class="ir">일</span></em><span
												class="day-kr"
												style="pointer-events: none; display: inline-block">수</span><span
												class="day-en" style="pointer-events: none; display: none">Wed</span>
										</button>
										<button class="disabled" type="button">
											<span class="ir">2023년 10월</span><em
												style="pointer-events: none;">5<span
												style="pointer-events: none;" class="ir">일</span></em><span
												class="day-kr"
												style="pointer-events: none; display: inline-block">목</span><span
												class="day-en" style="pointer-events: none; display: none">Thu</span>
										</button>
										<button class="disabled" type="button">
											<span class="ir">2023년 10월</span><em
												style="pointer-events: none;">6<span
												style="pointer-events: none;" class="ir">일</span></em><span
												class="day-kr"
												style="pointer-events: none; display: inline-block">금</span><span
												class="day-en" style="pointer-events: none; display: none">Fri</span>
										</button>
										<button class="disabled sat" type="button">
											<span class="ir">2023년 10월</span><em
												style="pointer-events: none;">7<span
												style="pointer-events: none;" class="ir">일</span></em><span
												class="day-kr"
												style="pointer-events: none; display: inline-block">토</span><span
												class="day-en" style="pointer-events: none; display: none">Sat</span>
										</button>
										<button class="holi" type="button">
											<span class="ir">2023년 10월</span><em
												style="pointer-events: none;">8<span
												style="pointer-events: none;" class="ir">일</span></em><span
												class="day-kr"
												style="pointer-events: none; display: inline-block">일</span><span
												class="day-en" style="pointer-events: none; display: none">Sun</span>
										</button>
										<button class="disabled" type="button">
											<span class="ir">2023년 10월</span><em
												style="pointer-events: none;">9<span
												style="pointer-events: none;" class="ir">일</span></em><span
												class="day-kr"
												style="pointer-events: none; display: inline-block">월</span><span
												class="day-en" style="pointer-events: none; display: none">Mon</span>
										</button>
										<button class="disabled" type="button">
											<span class="ir">2023년 10월</span><em
												style="pointer-events: none;">10<span
												style="pointer-events: none;" class="ir">일</span></em><span
												class="day-kr"
												style="pointer-events: none; display: inline-block">화</span><span
												class="day-en" style="pointer-events: none; display: none">Tue</span>
										</button>
									</div>
								</div>
							</div>
							<button type="button" title="다음 날짜 보기" class="btn-next" disabled>
								<i class="iconset ico-cld-next"></i> <em>다음</em>
							</button>
							<div class="bg-line">
								<input type="hidden" name="datePicker" id="dp1695704453532"
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

					<div class="reserve theater-list-box">
						<div class="tab-block tab-layer mb30">
							<ul>
								<li class="on"><a
									href="https://www.megabox.co.kr/booking/timetable" class="btn"
									data-area-cd="10" title="서울 선택">서울</a></li>
								<li><a href="https://www.megabox.co.kr/booking/timetable"
									class="btn" data-area-cd="30" title="경기 선택">경기</a></li>
								<li><a href="https://www.megabox.co.kr/booking/timetable"
									class="btn" data-area-cd="35" title="인천 선택">인천</a></li>
							</ul>
						</div>


						<div class="theater-list">
							<div class="theater-area-click">
								<a href="/theater?brchNo=1372" title="강남 상세보기">강남</a>
							</div>
							<div class="theater-type-box">
								<div class="theater-type">
									<p class="theater-name">1관</p>
									<p class="chair">총 232석</p>
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
						<!-- 아랫 부분 영화별 조회-->

						<div class="theater-list">
							<div class="theater-area-click">
								<a href="/theater?brchNo=1331" title="성수 상세보기">성수</a>
							</div>
							<div class="theater-type-box">
								<div class="theater-type">
									<p class="theater-name">MX관</p>
									<p class="chair">총 279석</p>
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
																	<p class="time">13:55</p>
																	<p class="chair">135석</p>
																	<ul class="option">
																		<li><i class="iconset ico-stage"></i></li>
																	</ul>
																	<div class="play-time">
																		<p>13:55~16:04</p>
																		<p>1회차</p>
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
									<p class="theater-name">4관</p>
									<p class="chair">총 154석</p>
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
																	<p class="time">16:15</p>
																	<p class="chair">36석</p>
																	<ul class="option">
																		<li><i class="iconset ico-stage"></i></li>
																	</ul>
																	<div class="play-time">
																		<p>16:15~18:14</p>
																		<p>1회차</p>
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
								<a href="/theater?brchNo=1351" title="코엑스 상세보기">코엑스</a>
							</div>
							<div class="theater-type-box">
								<div class="theater-type">
									<p class="theater-name">컴포트 3관</p>
									<p class="chair">총 348석</p>
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
																	<p class="time">12:30</p>
																	<p class="chair">156석</p>
																	<div class="play-time">
																		<p>12:30~14:29</p>
																		<p>1회차</p>
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
									<p class="theater-name">컴포트 7관</p>
									<p class="chair">총 285석</p>
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
																	<p class="time">10:05</p>
																	<p class="chair">141석</p>
																	<ul class="option">
																		<li><i class="iconset ico-stage"></i></li>
																	</ul>
																	<div class="play-time">
																		<p>10:05~12:14</p>
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
																	<p class="time">12:45</p>
																	<p class="chair">121석</p>
																	<ul class="option">
																		<li><i class="iconset ico-stage"></i></li>
																	</ul>
																	<div class="play-time">
																		<p>12:45~14:44</p>
																		<p>2회차</p>
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


					</div>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="/WEB-INF/views/footer.jsp" />
</body>
</html>