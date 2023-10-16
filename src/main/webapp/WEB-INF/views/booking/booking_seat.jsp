<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style>
.disabled{
	pointer-events: none;
}

</style>
<script
	src="${pageContext.request.contextPath}/resources/js/jquery-3.7.0.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/booking.js"></script>
<title></title>

</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp" />

	<div class="page-util" style="">
		<div class="inner-wrap">
			<div class="location">
				<span>Home</span> <a href="/booking" title="예매 페이지로 이동">예매</a> <a
					href="/booking" title="빠른예매 페이지로 이동">빠른예매</a>
			</div>


		</div>
	</div>

	<div class="container" style="padding-bottom: 240px;">
		<input type="hidden" id="playDe" name="playDe" value="">
		<div class="page-util fixed" style="">
			<div class="inner-wrap">
				<div class="location">
					<span>Home</span> <a href="#" title="예매 페이지로 이동">예매</a> <a href="#"
						title="빠른예매 페이지로 이동">빠른예매</a>
				</div>


			</div>
		</div>

		<div id="bokdMSeat" style="overflow: hidden; height: 736px;">

			<div class="inner-wrap"
				style="padding-top: 40px; padding-bottom: 100px;">
				<div class="quick-reserve">
					<h2 class="tit">빠른예매</h2>

					<div class="seat-select-section">
						<div class="seat-section">
							<div class="tit-util">
								<h3 class="tit small">관람인원선택</h3>
								<div class="right">
									<button type="button" class="button gray-line small"
										id="reset-seat-select">
										<i class="iconset ico-reset-small"></i>초기화
									</button>
								</div>
							</div>
							<div class="seat-area">
								<div class="seat-count" style="min-height: 52px">
									<div class="cell" style="margin-left:180px">
										<p class="txt">성인</p>
										<div class="count">
											<button type="button" class="down" title="성인 좌석 선택 감소">-</button>
											<div class="number">
												<button id="adult-btn" type="button" class="now" title="성인 현재 좌석 선택 수">0</button>
											</div>
											<button type="button" class="up" title="성인 좌석 선택 증가">+</button>
										</div>
									</div>
									<div class="cell">
										<p class="txt">청소년</p>
										<div class="count">
											<button type="button" class="down" title="청소년 좌석 선택 감소">-</button>
											<div class="number">
												<button id="child-btn" type="button" class="now" title="청소년 현재 좌석 선택 수">0</button>
											</div>
											<button type="button" class="up" title="청소년 좌석 선택 증가">+</button>
										</div>
									</div>
								</div>
								<div class="seat-layout">
									<div class="alert" style="display: none;"></div>
									<div class="seat-count-before" style="top: 0px">관람인원을
										선택하십시요</div>
									<div
										class="scroll m-scroll mCustomScrollbar _mCS_1 mCS_no_scrollbar">
										<div id="mCSB_1_container"
											class="mCSB_container mCS_no_scrollbar_y">
											<div id="seatLayout" style="width: 100%; height: 350px;">
												<img
													src="${pageContext.request.contextPath}/resources/image/booking/img-theater-screen.png"
													alt="screen"
													style="position: absolute; left: 62px; top: 10px;"
													class="mCS_img_loaded">
												<!------------------------------------------------------------------>
												<!-- 좌석 -->		<div class="">${seat}</div>			<!-- 좌석 -->
												<!------------------------------------------------------------------>
											</div>
											<div id="mCSB_1_scrollbar_vertical"
												class="mCSB_scrollTools mCSB_1_scrollbar mCS-light mCSB_scrollTools_vertical">
												<div class="mCSB_draggerContainer">
													<div id="mCSB_1_dragger_vertical" class="mCSB_dragger"
														style="position: absolute; min-height: 30px; display: none; height: 439px; top: 0px; max-height: 382px;">
														<div class="mCSB_dragger_bar" style="line-height: 30px;"></div>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="zone-legend" style="display: none"></div>
								</div>
							</div>
							<div class="seat-result">
								<div class="wrap">
									<input type="hidden" id="hidden-scheduleId" value="${schedule.THEATER_SCHEDULE_ID}">
									<div class="tit-area">
										<span class="movie-grade small age-${movie.grade_data}">${movie.movie_Grade}</span>
										<p class="tit">${movie.movie_Title}</p>
									</div>
									<div class="info-area">
										<p class="theater">${schedule.THEATER_NAME}</p>
										<p class="special">${schedule.THEATER_ROOM_NAME}</p>
										<p class="date">
											<span>${schedule.THEATER_SCHEDULE_DATE}</span>
										</p>
										<div class="other-time">
											<button type="button" class="now">${schedule.THEATER_SCHEDULE_START}~${schedule.THEATER_SCHEDULE_END}</button>
											<input type="hidden" id="jojosimya" value="${schedule.THEATER_SCHEDULE_TYPE}">
										</div>
										<p class="poster">
											<img src="${movie.movie_Poster}" alt="${movie.movie_Title}">
										</p>
									</div>
									<div class="choice-seat-area">
										<div class="legend">
											<ul class="list">
												<li><div class="seat-condition choice" title="선택한 좌석"></div>
													<em>선택</em></li>
												<li><div class="seat-condition finish" title="예매 완료"></div>
													<em>예매완료</em></li>
												<li><div class="seat-condition impossible"
														title="선택 불가"></div> <em>선택불가</em></li>
												<li><div class="seat-condition common" title="일반"></div>
													<em> 일반</em></li>
											</ul>
										</div>
										<div class="seat-num">
											<p class="tit">선택좌석</p>
											<div class="my-seat" id="dashboard-seat">
												<div class="seat all" title="구매가능 좌석">-</div>
												<div class="seat all" title="구매가능 좌석">-</div>
												<div class="seat all" title="구매가능 좌석">-</div>
												<div class="seat all" title="구매가능 좌석">-</div>
												<div class="seat all" title="구매가능 좌석">-</div>
												<div class="seat all" title="구매가능 좌석">-</div>
												<div class="seat all" title="구매가능 좌석">-</div>
												<div class="seat all" title="구매가능 좌석">-</div>
											</div>
										</div>
									</div>
									<div class="pay-area">
										<p class="count"></p>
										<div class="pay">
											<p class="tit">최종결제금액</p>
											<div class="money">
												<em>0</em> <span>원</span>
											</div>
										</div>
									</div>
									<div class="btn-group">
										<a href="/movieplus/booking/" class="button" id="pagePrevious" title="이전">이전</a>
										<a href="#" class="button disabled" id="pageNext" title="다음">다음</a>
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