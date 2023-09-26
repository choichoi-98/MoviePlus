<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script
	src="${pageContext.request.contextPath}/resources/js/jquery-3.7.0.js"></script>
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
			<div class="inner-wrap"
				style="padding-top: 40px; padding-bottom: 100px;">

				<!-- quick-reserve -->
				<div class="quick-reserve">
					<div class="tit-util">
						<h2 class="tit">빠른예매</h2>

						<div id="btnLangChg" class="right btn-ticket"
							style="display: none">
							<button type="button" class="button gray-line"
								onclick="parent.setLangChg()">English</button>
						</div>
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
									<div class="year-area">
										<div class="year" style="left: 30px; z-index: 1; opacity: 1;">2023.09</div>
										<div class="year" style="left: 450px; z-index: 1; opacity: 1;">2023.10</div>
									</div>


									<div class="date-area" id="formDeList">
										<div class="wrap"
											style="position: relative; width: 2100px; border: none; left: -70px;">
											<button class="disabled holi" type="button"
												date-data="2023.09.24" month="8" tabindex="-1">
												<span class="ir">2023년 9월</span><em
													style="pointer-events: none;">24<span
													style="pointer-events: none;" class="ir">일</span></em><span
													class="day-kr"
													style="pointer-events: none; display: inline-block">일</span><span
													class="day-en" style="pointer-events: none; display: none">Sun</span>
											</button>
											<button class="disabled" type="button" date-data="2023.09.25"
												month="8">
												<span class="ir">2023년 9월</span><em
													style="pointer-events: none;">25<span
													style="pointer-events: none;" class="ir">일</span></em><span
													class="day-kr"
													style="pointer-events: none; display: inline-block">오늘</span><span
													class="day-en" style="pointer-events: none; display: none">Mon</span>
											</button>
											<button class="disabled" type="button" date-data="2023.09.26"
												month="8">
												<span class="ir">2023년 9월</span><em
													style="pointer-events: none;">26<span
													style="pointer-events: none;" class="ir">일</span></em><span
													class="day-kr"
													style="pointer-events: none; display: inline-block">내일</span><span
													class="day-en" style="pointer-events: none; display: none">Tue</span>
											</button>
											<button class="" type="button" date-data="2023.09.27"
												month="8">
												<span class="ir">2023년 9월</span><em
													style="pointer-events: none;">27<span
													style="pointer-events: none;" class="ir">일</span></em><span
													class="day-kr"
													style="pointer-events: none; display: inline-block">수</span><span
													class="day-en" style="pointer-events: none; display: none">Wed</span>
											</button>
											<button class="holi on" type="button" date-data="2023.09.28"
												month="8">
												<span class="ir">2023년 9월</span><em
													style="pointer-events: none;">28<span
													style="pointer-events: none;" class="ir">일</span></em><span
													class="day-kr"
													style="pointer-events: none; display: inline-block">목</span><span
													class="day-en" style="pointer-events: none; display: none">Thu</span>
											</button>
											<button class="holi" type="button" date-data="2023.09.29"
												month="8">
												<span class="ir">2023년 9월</span><em
													style="pointer-events: none;">29<span
													style="pointer-events: none;" class="ir">일</span></em><span
													class="day-kr"
													style="pointer-events: none; display: inline-block">금</span><span
													class="day-en" style="pointer-events: none; display: none">Fri</span>
											</button>
											<button class="sat" type="button" date-data="2023.09.30"
												month="8">
												<span class="ir">2023년 9월</span><em
													style="pointer-events: none;">30<span
													style="pointer-events: none;" class="ir">일</span></em><span
													class="day-kr"
													style="pointer-events: none; display: inline-block">토</span><span
													class="day-en" style="pointer-events: none; display: none">Sat</span>
											</button>
											<button class="holi" type="button" date-data="2023.10.01"
												month="9">
												<span class="ir">2023년 10월</span><em
													style="pointer-events: none;">1<span
													style="pointer-events: none;" class="ir">일</span></em><span
													class="day-kr"
													style="pointer-events: none; display: inline-block">일</span><span
													class="day-en" style="pointer-events: none; display: none">Sun</span>
											</button>
											<button class="holi" type="button" date-data="2023.10.02"
												month="9">
												<span class="ir">2023년 10월</span><em
													style="pointer-events: none;">2<span
													style="pointer-events: none;" class="ir">일</span></em><span
													class="day-kr"
													style="pointer-events: none; display: inline-block">월</span><span
													class="day-en" style="pointer-events: none; display: none">Mon</span>
											</button>
											<button class="holi" type="button" date-data="2023.10.03"
												month="9">
												<span class="ir">2023년 10월</span><em
													style="pointer-events: none;">3<span
													style="pointer-events: none;" class="ir">일</span></em><span
													class="day-kr"
													style="pointer-events: none; display: inline-block">화</span><span
													class="day-en" style="pointer-events: none; display: none">Tue</span>
											</button>
											<button class="disabled" type="button" date-data="2023.10.04"
												month="9">
												<span class="ir">2023년 10월</span><em
													style="pointer-events: none;">4<span
													style="pointer-events: none;" class="ir">일</span></em><span
													class="day-kr"
													style="pointer-events: none; display: inline-block">수</span><span
													class="day-en" style="pointer-events: none; display: none">Wed</span>
											</button>
											<button class="disabled" type="button" date-data="2023.10.05"
												month="9">
												<span class="ir">2023년 10월</span><em
													style="pointer-events: none;">5<span
													style="pointer-events: none;" class="ir">일</span></em><span
													class="day-kr"
													style="pointer-events: none; display: inline-block">목</span><span
													class="day-en" style="pointer-events: none; display: none">Thu</span>
											</button>
											<button class="disabled" type="button" date-data="2023.10.06"
												month="9">
												<span class="ir">2023년 10월</span><em
													style="pointer-events: none;">6<span
													style="pointer-events: none;" class="ir">일</span></em><span
													class="day-kr"
													style="pointer-events: none; display: inline-block">금</span><span
													class="day-en" style="pointer-events: none; display: none">Fri</span>
											</button>
											<button class="disabled sat" type="button"
												date-data="2023.10.07" month="9">
												<span class="ir">2023년 10월</span><em
													style="pointer-events: none;">7<span
													style="pointer-events: none;" class="ir">일</span></em><span
													class="day-kr"
													style="pointer-events: none; display: inline-block">토</span><span
													class="day-en" style="pointer-events: none; display: none">Sat</span>
											</button>
											<button class="disabled holi" type="button"
												date-data="2023.10.08" month="9">
												<span class="ir">2023년 10월</span><em
													style="pointer-events: none;">8<span
													style="pointer-events: none;" class="ir">일</span></em><span
													class="day-kr"
													style="pointer-events: none; display: inline-block">일</span><span
													class="day-en" style="pointer-events: none; display: none">Sun</span>
											</button>
											<button class="disabled" type="button" date-data="2023.10.09"
												month="9" tabindex="-1">
												<span class="ir">2023년 10월</span><em
													style="pointer-events: none;">9<span
													style="pointer-events: none;" class="ir">일</span></em><span
													class="day-kr"
													style="pointer-events: none; display: inline-block">월</span><span
													class="day-en" style="pointer-events: none; display: none">Mon</span>
											</button>
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
									<button type="button" id="calendar"
										class="btn-calendar-large" title="달력보기">달력보기</button>

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
												<div id="mCSB_1"
													class="mCustomScrollBox mCS-light mCSB_vertical mCSB_inside"
													style="max-height: none;" tabindex="0">
													<div id="mCSB_1_container"
														class="mCSB_container mCS_no_scrollbar_y"
														style="position: relative; top: 0; left: 0;" dir="ltr">
														<ul>

															<li><button type="button" class="btn" movie-nm="잠"
																	movie-no="23055700"
																	img-path="/SharedImg/2023/09/06/7qc54ox52VChHBh4UYs4Awepnwf8SbXM_150.jpg"
																	movie-popup-at="N" movie-popup-no="0" form-at="Y">
																	<span class="movie-grade small age-15">15세이상관람가</span><i
																		class="iconset ico-heart-small">보고싶어 설정안함</i><span
																		class="txt">잠</span>
																</button></li>
															<li><button type="button" class="btn"
																	movie-nm="더 넌 2" movie-no="23069000"
																	img-path="/SharedImg/2023/09/07/twDS6DyPyBWrvjNCpK13Pk2riUob86Jt_150.jpg"
																	movie-popup-at="N" movie-popup-no="0" form-at="Y">
																	<span class="movie-grade small age-15">15세이상관람가</span><i
																		class="iconset ico-heart-small">보고싶어 설정안함</i><span
																		class="txt">더 넌 2</span>
																</button></li>

															<li><button type="button" class="btn"
																	movie-nm="그란 투리스모" movie-no="23059800"
																	img-path="/SharedImg/2023/08/06/yLY9RqwIM1iJLSTnNXrqdI4NDSNN6JLp_150.jpg"
																	movie-popup-at="N" movie-popup-no="0" form-at="Y">
																	<span class="movie-grade small age-12">12세이상관람가</span><i
																		class="iconset ico-heart-small">보고싶어 설정안함</i><span
																		class="txt">그란 투리스모</span>
																</button></li>
															<li><button type="button" class="btn"
																	movie-nm="오펜하이머" movie-no="23049000"
																	img-path="/SharedImg/2023/07/26/HlwoWJD0GGvQWX5FnkUDEPmlaCAlmN0Z_150.jpg"
																	movie-popup-at="N" movie-popup-no="0" form-at="Y">
																	<span class="movie-grade small age-15">15세이상관람가</span><i
																		class="iconset ico-heart-small">보고싶어 설정안함</i><span
																		class="txt">오펜하이머</span>
																</button></li>
															<li><button type="button" class="btn"
																	movie-nm="극장판 엉덩이 탐정: 미스터리 가면 ~최강의 대결"
																	movie-no="23067900"
																	img-path="/SharedImg/2023/09/05/kTjBzuhaCc7pWImHhcDANG67LXzSbTLN_150.jpg"
																	movie-popup-at="N" movie-popup-no="0" form-at="Y">
																	<span class="movie-grade small age-all">전체관람가</span><i
																		class="iconset ico-heart-small">보고싶어 설정안함</i><span
																		class="txt">극장판 엉덩이 탐정: 미스터리 가면 ~최강의 대결</span>
																</button></li>

														</ul>
													</div>
													<div id="mCSB_2_scrollbar_vertical"
														class="mCSB_scrollTools mCSB_2_scrollbar mCS-light mCSB_scrollTools_vertical">
														<div class="mCSB_draggerContainer">
															<div id="mCSB_2_dragger_vertical" class="mCSB_dragger"
																style="position: absolute; min-height: 30px; display: none; top: 0px;">
																<div class="mCSB_dragger_bar" style="line-height: 30px;"></div>
															</div>
															<div class="mCSB_draggerRail"></div>
														</div>
													</div>
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
									<div class="choice-all" id="choiceMovieNone"
										style="display: none;">
										<strong>모든영화</strong> <span>목록에서 영화를 선택하세요.</span>
									</div>

									<!-- 영화를 선택했을 때 -->
									<div class="choice-all" id="choiceMovieNone" style="display:;">
										<span>선택한 영화 이름</span>
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
										<button type="button" class="btn-tab on">전체</button>
										<div class="list">
											<div class="scroll" id="brchList">
												<ul>
													<li id="liFavorBrch"><button id="btnFavorBrch"
															type="button" class="btn">
															<span calss="txt">선호극장(1)</span>
														</button>
														<div class="depth" id="favorite">
															<div
																class="detail-list m-scroll mCustomScrollbar _mCS_4 mCS_no_scrollbar">
																<div id="mCSB_4"
																	class="mCustomScrollBox mCS-light mCSB_vertical mCSB_inside"
																	style="max-height: none;" tabindex="0">
																	<div id="mCSB_4_container"
																		class="mCSB_container mCS_no_scrollbar_y"
																		style="position: relative; top: 0; left: 0;" dir="ltr">
																		<ul>
																			<li><button id="btn" type="button" class="on">강남</button></li>
																		</ul>
																	</div>
																	<div id="mCSB_4_scrollbar_vertical"
																		class="mCSB_scrollTools mCSB_4_scrollbar mCS-light mCSB_scrollTools_vertical">
																		<div class="mCSB_draggerContainer">
																			<div id="mCSB_4_dragger_vertical"
																				class="mCSB_dragger"
																				style="position: absolute; min-height: 30px; display: none; height: 3657px; max-height: 310px; top: 0px;">
																				<div class="mCSB_dragger_bar"
																					style="line-height: 30px;"></div>
																			</div>
																			<div class="mCSB_draggerRail"></div>
																		</div>
																	</div>
																</div>
															</div>
															<div class="no-favorite">
																<div class="wrap">
																	<i class="iconset ico-theater-favorite"></i>
																	<div class="txt">
																		자주가는 극장을<br>등록해 보세요!
																	</div>
																	<div class="setting">
																		<a href="#" title="선호극장 설정"><i
																			class="iconset ico-theater-chk-purple"></i> 선호극장 설정</a>
																	</div>
																</div>
															</div>


														</div></li>
													<li><button type="button" class="btn" id="10">
															<span calss="txt">서울(갯수)</span>
														</button>
														<div class="depth">
															<div
																class="detail-list m-scroll area-cd10 mCustomScrollbar _mCS_5 mCS_no_scrollbar">
																<div id="mCSB_5"
																	class="mCustomScrollBox mCS-light mCSB_vertical mCSB_inside"
																	style="max-height: none;" tabindex="0">
																	<div id="mCSB_5_container"
																		class="mCSB_container mCS_no_scrollbar_y"
																		style="position: relative; top: 0; left: 0;" dir="ltr">
																		<ul>
																			<li><button id="btn" type="button" class="on">강남</button></li>
																			<li><button id="btn" type="button">강남대로(씨티)</button></li>
																			<li><button id="btn" type="button">강동</button></li>
																		</ul>
																	</div>
																	<div id="mCSB_5_scrollbar_vertical"
																		class="mCSB_scrollTools mCSB_5_scrollbar mCS-light mCSB_scrollTools_vertical">
																		<div class="mCSB_draggerContainer">
																			<div id="mCSB_5_dragger_vertical"
																				class="mCSB_dragger"
																				style="position: absolute; min-height: 30px; display: none; top: 0px;">
																				<div class="mCSB_dragger_bar"
																					style="line-height: 30px;"></div>
																			</div>
																			<div class="mCSB_draggerRail"></div>
																		</div>
																	</div>
																</div>
															</div>
														</div></li>
													<li><button type="button" class="btn has-issue"
															id="30">
															<span calss="txt">경기(30)</span>
														</button>
														<div class="depth">
															<div
																class="detail-list m-scroll area-cd30 mCustomScrollbar _mCS_6 mCS_no_scrollbar">
																<div id="mCSB_6"
																	class="mCustomScrollBox mCS-light mCSB_vertical mCSB_inside"
																	style="max-height: none;" tabindex="0">
																	<div id="mCSB_6_container"
																		class="mCSB_container mCS_no_scrollbar_y"
																		style="position: relative; top: 0; left: 0;" dir="ltr">
																		<ul>
																			<li><button id="btn" type="button">고양스타필드</button></li>
																			<li><button id="btn" type="button">광명AK플라자</button></li>
																		</ul>
																	</div>
																	<div id="mCSB_6_scrollbar_vertical"
																		class="mCSB_scrollTools mCSB_6_scrollbar mCS-light mCSB_scrollTools_vertical"
																		style="display: block;">
																		<div class="mCSB_draggerContainer">
																			<div id="mCSB_6_dragger_vertical"
																				class="mCSB_dragger"
																				style="position: absolute; min-height: 30px; display: none; top: 0px; height: 117px; max-height: 310px;">
																				<div class="mCSB_dragger_bar"
																					style="line-height: 30px;"></div>
																			</div>
																			<div class="mCSB_draggerRail"></div>
																		</div>
																	</div>
																</div>
															</div>
														</div></li>
													<li><button type="button" class="btn" id="35">
															<span calss="txt">인천(5)</span>
														</button>
														<div class="depth">
															<div
																class="detail-list m-scroll area-cd35 mCustomScrollbar _mCS_7 mCS_no_scrollbar">
																<div id="mCSB_7"
																	class="mCustomScrollBox mCS-light mCSB_vertical mCSB_inside"
																	style="max-height: none;" tabindex="0">
																	<div id="mCSB_7_container"
																		class="mCSB_container mCS_no_scrollbar_y"
																		style="position: relative; top: 0; left: 0;" dir="ltr">
																		<ul>
																			<li><button id="btn" type="button">검단</button></li>
																			<li><button id="btn" type="button">송도</button></li>

																		</ul>
																	</div>
																	<div id="mCSB_7_scrollbar_vertical"
																		class="mCSB_scrollTools mCSB_7_scrollbar mCS-light mCSB_scrollTools_vertical">
																		<div class="mCSB_draggerContainer">
																			<div id="mCSB_7_dragger_vertical"
																				class="mCSB_dragger"
																				style="position: absolute; min-height: 30px; display: none; top: 0px;">
																				<div class="mCSB_dragger_bar"
																					style="line-height: 30px;"></div>
																			</div>
																			<div class="mCSB_draggerRail"></div>
																		</div>
																	</div>
																</div>
															</div>
														</div></li>
													<li><button type="button" class="btn" id="45">
															<span calss="txt">대전/충청/세종(14)</span>
														</button>
														<div class="depth">
															<div
																class="detail-list m-scroll area-cd45 mCustomScrollbar _mCS_8 mCS_no_scrollbar">
																<div id="mCSB_8"
																	class="mCustomScrollBox mCS-light mCSB_vertical mCSB_inside"
																	style="max-height: none;" tabindex="0">
																	<div id="mCSB_8_container"
																		class="mCSB_container mCS_no_scrollbar_y"
																		style="position: relative; top: 0; left: 0;" dir="ltr">
																		<ul>
																			<li><button id="btn" type="button">공주</button></li>
																			<li><button id="btn" type="button">논산</button></li>
																		</ul>
																	</div>
																	<div id="mCSB_8_scrollbar_vertical"
																		class="mCSB_scrollTools mCSB_8_scrollbar mCS-light mCSB_scrollTools_vertical">
																		<div class="mCSB_draggerContainer">
																			<div id="mCSB_8_dragger_vertical"
																				class="mCSB_dragger"
																				style="position: absolute; min-height: 30px; display: none; top: 0px;">
																				<div class="mCSB_dragger_bar"
																					style="line-height: 30px;"></div>
																			</div>
																			<div class="mCSB_draggerRail"></div>
																		</div>
																	</div>
																</div>
															</div>
														</div></li>
													<li><button type="button" class="btn has-issue on"
															id="55">
															<span calss="txt">부산/대구/경상(23)</span>
														</button>
														<div class="depth on">
															<div
																class="detail-list m-scroll area-cd55 mCustomScrollbar _mCS_9 mCS_no_scrollbar">
																<div id="mCSB_9"
																	class="mCustomScrollBox mCS-light mCSB_vertical mCSB_inside"
																	style="max-height: none;" tabindex="0">
																	<div id="mCSB_9_container"
																		class="mCSB_container mCS_no_scrollbar_y"
																		style="position: relative; top: 0; left: 0;" dir="ltr">
																		<ul>
																			<li><button id="btn" type="button" class="on">경북도청</button></li>
																			<li><button id="btn" type="button">경산하양</button></li>

																		</ul>
																	</div>
																	<div id="mCSB_9_scrollbar_vertical"
																		class="mCSB_scrollTools mCSB_9_scrollbar mCS-light mCSB_scrollTools_vertical"
																		style="display: block;">
																		<div class="mCSB_draggerContainer">
																			<div id="mCSB_9_dragger_vertical"
																				class="mCSB_dragger"
																				style="position: absolute; min-height: 30px; display: none; top: 0px; height: 146px; max-height: 310px;">
																				<div class="mCSB_dragger_bar"
																					style="line-height: 30px;"></div>
																			</div>
																			<div class="mCSB_draggerRail"></div>
																		</div>
																	</div>
																</div>
															</div>
														</div></li>
													<li><button type="button" class="btn" id="65">
															<span calss="txt">광주/전라(9)</span>
														</button>
														<div class="depth">
															<div
																class="detail-list m-scroll area-cd65 mCustomScrollbar _mCS_10 mCS_no_scrollbar">
																<div id="mCSB_10"
																	class="mCustomScrollBox mCS-light mCSB_vertical mCSB_inside"
																	style="max-height: none;" tabindex="0">
																	<div id="mCSB_10_container"
																		class="mCSB_container mCS_no_scrollbar_y"
																		style="position: relative; top: 0; left: 0;" dir="ltr">
																		<ul>
																			<li><button id="btn" type="button">광주상무</button></li>
																			<li><button id="btn" type="button">광주하남</button></li>

																		</ul>
																	</div>
																	<div id="mCSB_10_scrollbar_vertical"
																		class="mCSB_scrollTools mCSB_10_scrollbar mCS-light mCSB_scrollTools_vertical">
																		<div class="mCSB_draggerContainer">
																			<div id="mCSB_10_dragger_vertical"
																				class="mCSB_dragger"
																				style="position: absolute; min-height: 30px; display: none; top: 0px;">
																				<div class="mCSB_dragger_bar"
																					style="line-height: 30px;"></div>
																			</div>
																			<div class="mCSB_draggerRail"></div>
																		</div>
																	</div>
																</div>
															</div>
														</div></li>
													<li><button type="button" class="btn" id="70">
															<span calss="txt">강원(4)</span>
														</button>
														<div class="depth">
															<div
																class="detail-list m-scroll area-cd70 mCustomScrollbar _mCS_11 mCS_no_scrollbar">
																<div id="mCSB_11"
																	class="mCustomScrollBox mCS-light mCSB_vertical mCSB_inside"
																	style="max-height: none;" tabindex="0">
																	<div id="mCSB_11_container"
																		class="mCSB_container mCS_no_scrollbar_y"
																		style="position: relative; top: 0; left: 0;" dir="ltr">
																		<ul>
																			<li><button id="btn" type="button">남춘천</button></li>
																			<li><button id="btn" type="button">속초</button></li>

																		</ul>
																	</div>
																	<div id="mCSB_11_scrollbar_vertical"
																		class="mCSB_scrollTools mCSB_11_scrollbar mCS-light mCSB_scrollTools_vertical">
																		<div class="mCSB_draggerContainer">
																			<div id="mCSB_11_dragger_vertical"
																				class="mCSB_dragger"
																				style="position: absolute; min-height: 30px; display: none; top: 0px;">
																				<div class="mCSB_dragger_bar"
																					style="line-height: 30px;"></div>
																			</div>
																			<div class="mCSB_draggerRail"></div>
																		</div>
																	</div>
																</div>
															</div>
														</div></li>
													<li><button type="button" class="btn has-issue"
															id="80">
															<span calss="txt">제주(1)</span>
														</button>
														<div class="depth">
															<div
																class="detail-list m-scroll area-cd80 mCustomScrollbar _mCS_12 mCS_no_scrollbar">
																<div id="mCSB_12"
																	class="mCustomScrollBox mCS-light mCSB_vertical mCSB_inside"
																	style="max-height: none;" tabindex="0">
																	<div id="mCSB_12_container"
																		class="mCSB_container mCS_no_scrollbar_y"
																		style="position: relative; top: 0; left: 0;" dir="ltr">
																		<ul>
																			<li><button id="btn" type="button">제주서귀포</button></li>
																		</ul>
																	</div>
																	<div id="mCSB_12_scrollbar_vertical"
																		class="mCSB_scrollTools mCSB_12_scrollbar mCS-light mCSB_scrollTools_vertical">
																		<div class="mCSB_draggerContainer">
																			<div id="mCSB_12_dragger_vertical"
																				class="mCSB_dragger"
																				style="position: absolute; min-height: 30px; display: none; top: 0px;">
																				<div class="mCSB_dragger_bar"
																					style="line-height: 30px;"></div>
																			</div>
																			<div class="mCSB_draggerRail"></div>
																		</div>
																	</div>
																</div>
															</div>
														</div></li>
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
									<div class="choice-all" id="choiceBrchNone"
										style="display: none;">
										<strong>전체극장</strong> <span>목록에서 극장을 선택하세요.</span>
									</div>

									<!-- 영화관을 한개라도 선택 했을때 -->
									<div class="choice-all" id="choiceBrchNone"
										style="display: block;">
										<span>선택한 영화관</span>
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
										<i class="iconset ico-sun" title="조조"></i> 조조
										 <i	class="iconset ico-moon" title="심야"></i> 심야
									</div>
								</div>

								<!-- hour-schedule : 시간 선택  : 00~30 시-->
								<div class="hour-schedule">
									<button type="button" class="btn-prev-time">이전 시간 보기</button>

									<div class="wrap">
										<div class="view"
											style="position: absolute; width: 1015px; transition: none 0s ease 0s; left: -175px;">
											<button type="button" class="hour" disabled="disabled"
												style="opacity: 0.5">00</button>
											<button type="button" class="hour" disabled="disabled"
												style="opacity: 0.5">01</button>
											<button type="button" class="hour" disabled="disabled"
												style="opacity: 0.5">02</button>
											<button type="button" class="hour" disabled="disabled"
												style="opacity: 0.5">03</button>
											<button type="button" class="hour" disabled="disabled"
												style="opacity: 0.5">04</button>
											<button type="button" class="hour" disabled="disabled"
												style="opacity: 0.5">05</button>
											<button type="button" class="hour" disabled="disabled"
												style="opacity: 0.5">06</button>
											<button type="button" class="hour" disabled="disabled"
												style="opacity: 0.5">07</button>
											<button type="button" class="hour" disabled="disabled"
												style="opacity: 0.5">08</button>
											<button type="button" class="hour on" style="opacity: 1;">09</button>
											<button type="button" class="hour" style="opacity: 1;">10</button>
											<button type="button" class="hour" style="opacity: 1;">11</button>
											<button type="button" class="hour" style="opacity: 1;">12</button>
											<button type="button" class="hour" style="opacity: 1;">13</button>
											<button type="button" class="hour" style="opacity: 1;">14</button>
											<button type="button" class="hour" style="opacity: 1;">15</button>
											<button type="button" class="hour" style="opacity: 1;">16</button>
											<button type="button" class="hour" style="opacity: 1;">17</button>
											<button type="button" class="hour" style="opacity: 1;">18</button>
											<button type="button" class="hour" style="opacity: 1;">19</button>
											<button type="button" class="hour" style="opacity: 1;">20</button>
											<button type="button" class="hour" style="opacity: 1;">21</button>
											<button type="button" class="hour" style="opacity: 1;">22</button>
											<button type="button" class="hour" style="opacity: 1;">23</button>
											<button type="button" class="hour" disabled="disabled"
												style="opacity: 0.5">24</button>
											<button type="button" class="hour" disabled="disabled"
												style="opacity: 0.5">25</button>
											<button type="button" class="hour" disabled="disabled"
												style="opacity: 0.5">26</button>
											<button type="button" class="hour" disabled="disabled"
												style="opacity: 0.5">27</button>
											<button type="button" class="hour" disabled="disabled"
												style="opacity: 0.5">28</button>

										</div>
									</div>

									<button type="button" class="btn-next-time">다음 시간 보기</button>
								</div>
								<!--// hour-schedule : 시간 선택  : 00~30 시-->

								<!-- movie-schedule-area : 시간표 출력 영역-->
								<div class="movie-schedule-area">

									<!-- 영화, 영화관 선택 안했을때 -->
									<!---->
									<div class="no-result" id="playScheduleNonList"
										style="display: none;">
										<i class="iconset ico-movie-time"></i>

										<p class="txt">
											영화와 극장을 선택하시면<br> 상영시간표를 비교하여 볼 수 있습니다.
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
													style="position: relative; top: 0px; left: 0px;" dir="ltr">
													<ul>
														<li><button type="button" class="btn">
																<div class="legend">
																	<i class="iconset ico-sun" title="조조">조조</i>
																</div>
																<span class="time"><strong title="상영 시작">09:00</strong><em
																	title="상영 종료">~10:48</em></span><span class="title"><strong
																	title="천박사 퇴마 연구소: 설경의 비밀">천박사 퇴마 연구소: 설경의 비밀</strong><em>2D</em></span>
																<div class="info">
																	<span class="theater" title="극장">광명소하<br>컴포트
																		2관 (리클라이너/LASER)
																	</span><span class="seat"><strong class="now"
																		title="잔여 좌석">97</strong><span>/</span><em class="all"
																		title="전체 좌석">97</em></span>
																</div>
															</button></li>
														<li><button type="button" class="btn">
																<div class="legend">
																	<i class="iconset ico-sun" title="조조">조조</i>
																</div>
																<span class="time"><strong title="상영 시작">09:20</strong><em
																	title="상영 종료">~11:08</em></span><span class="title"><strong
																	title="천박사 퇴마 연구소: 설경의 비밀">천박사 퇴마 연구소: 설경의 비밀</strong><em>2D</em></span>
																<div class="info">
																	<span class="theater" title="극장">강남<br>1관
																	</span><span class="seat"><strong class="now"
																		title="잔여 좌석">229</strong><span>/</span><em
																		class="all" title="전체 좌석">232</em></span>
																</div>
															</button></li>
														
														<li><button type="button" class="btn">
																<div class="legend"></div>
																<span class="time"><strong title="상영 시작">11:30</strong><em
																	title="상영 종료">~13:18</em></span><span class="title"><strong
																	title="천박사 퇴마 연구소: 설경의 비밀">천박사 퇴마 연구소: 설경의 비밀</strong><em>2D</em></span>
																<div class="info">
																	<span class="theater" title="극장">강남<br>1관
																	</span><span class="seat"><strong class="now"
																		title="잔여 좌석">220</strong><span>/</span><em
																		class="all" title="전체 좌석">232</em></span>
																</div>
															</button></li>
														
													</ul>
												</div>
												<div id="mCSB_23_scrollbar_vertical"
													class="mCSB_scrollTools mCSB_23_scrollbar mCS-light mCSB_scrollTools_vertical"
													style="display: block;">
													<div class="mCSB_draggerContainer">
														<div id="mCSB_23_dragger_vertical" class="mCSB_dragger"
															style="position: absolute; min-height: 30px; display: none; height: 66px; max-height: 420px; top: 0px;">
															<div class="mCSB_dragger_bar" style="line-height: 30px;"></div>
														</div>
														<div class="mCSB_draggerRail"></div>
													</div>
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