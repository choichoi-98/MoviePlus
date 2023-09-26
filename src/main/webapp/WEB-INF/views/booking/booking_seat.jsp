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
	
	<div class="page-util" style="">
        <div class="inner-wrap">
            <div class="location">
                <span>Home</span>
                <a href="/booking" title="예매 페이지로 이동">예매</a>
                <a href="/booking" title="빠른예매 페이지로 이동">빠른예매</a>
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
										id="seatMemberCntInit">
										<i class="iconset ico-reset-small"></i>초기화
									</button>
								</div>
							</div>
							<div class="seat-area">
								<div class="seat-count" style="min-height: 52px">
									<div class="cell">
										<p class="txt">성인</p>
										<div class="count">
											<button type="button" class="down" title="성인 좌석 선택 감소">-</button>
											<div class="number">
												<button type="button" class="now" title="성인 현재 좌석 선택 수">0</button>
											</div>
											<button type="button" class="up" title="성인 좌석 선택 증가">+</button>
										</div>
									</div>
									<div class="cell">
										<p class="txt">청소년</p>
										<div class="count">
											<button type="button" class="down" title="청소년 좌석 선택 감소">-</button>
											<div class="number">
												<button type="button" class="now" title="청소년 현재 좌석 선택 수">0</button>
											</div>
											<button type="button" class="up" title="청소년 좌석 선택 증가">+</button>
										</div>
									</div>
									<div class="cell">
										<p class="txt">우대</p>
										<div class="count">
											<button type="button" class="down" title="우대 좌석 선택 감소">-</button>
											<div class="number">
												<button type="button" class="now" title="우대 현재 좌석 선택 수">0</button>
											</div>
											<button type="button" class="up" title="우대 좌석 선택 증가">+</button>
										</div>
									</div>
								</div>
								<div class="seat-layout">
									<div class="alert" style="display: none;"></div>
									<div class="seat-count-before" style="top: 0px">관람인원을
										선택하십시요</div>
									<div
										class="scroll m-scroll mCustomScrollbar _mCS_1 mCS_no_scrollbar">
										<div id="mCSB_1"
											class="mCustomScrollBox mCS-light mCSB_vertical mCSB_inside"
											style="max-height: none;" tabindex="0">
											<div id="mCSB_1_container"
												class="mCSB_container mCS_no_scrollbar_y"
												style="position: relative; top: 0px; left: 0px; height: 350px;"
												dir="ltr">
												<div id="seatLayout" style="width: 100%; height: 350px;">
													<img src="${pageContext.request.contextPath}/resources/image/booking/img-theater-screen.png" alt="screen"
														style="position: absolute; left: 62px; top: 10px;"
														class="mCS_img_loaded">
													<jsp:include page="/WEB-INF/views/seats/seat-1.jsp" />
													<!-- 좌석 인클루드, 1-3 순 크기 -->
												</div>
												<div id="mCSB_1_scrollbar_vertical"
													class="mCSB_scrollTools mCSB_1_scrollbar mCS-light mCSB_scrollTools_vertical">
													<div class="mCSB_draggerContainer">
														<div id="mCSB_1_dragger_vertical" class="mCSB_dragger"
															style="position: absolute; min-height: 30px; display: none; height: 439px; top: 0px; max-height: 382px;">
															<div class="mCSB_dragger_bar" style="line-height: 30px;"></div>
														</div>
														<div class="mCSB_draggerRail"></div>
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
									<div class="tit-area">
										<span class="movie-grade small age-all age-12">12세이상관람가</span>
										<p class="tit">천박사 퇴마 연구소: 설경의 비밀</p>
										<p class="cate">2D</p>
									</div>
									<div class="info-area">
										<p class="theater">강남</p>
										<p class="special">1관</p>
										<p class="date">
											<span>2023.09.27</span><em>(수)</em>
										</p>
										<div class="other-time">
											<button type="button" class="now">
												12:00~13:48<i class="arr"></i>
											</button>
											<ul class="other">
												<li><button type="button" choicnt="220"
														playschdlno="2309271372001" class="btn ">09:50~11:38</button></li>
												<li><button type="button" choicnt="220"
														playschdlno="2309271372002" class="btn on ">12:00~13:48</button></li>
												<li><button type="button" choicnt="100"
														playschdlno="2309271372045" class="btn ">13:20~15:08</button></li>
												<li><button type="button" choicnt="217"
														playschdlno="2309271372003" class="btn ">14:10~15:58</button></li>
												<li><button type="button" choicnt="211"
														playschdlno="2309271372004" class="btn ">16:20~18:08</button></li>
												<li><button type="button" choicnt="99"
														playschdlno="2309271372047" class="btn ">17:50~19:38</button></li>
												<li><button type="button" choicnt="215"
														playschdlno="2309271372005" class="btn ">18:30~20:18</button></li>
												<li><button type="button" choicnt="224"
														playschdlno="2309271372006" class="btn ">20:40~22:28</button></li>
												<li><button type="button" choicnt="228"
														playschdlno="2309271372007" class="btn ">22:50~24:38</button></li>
												<li><button type="button" choicnt="95"
														playschdlno="2309271372069" class="btn ">23:55~25:43</button></li>
											</ul>
										</div>
										<p class="poster">
											<img src=""
												alt="천박사 퇴마 연구소: 설경의 비밀">
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
												<li><div class="seat-condition disabled" title="장애인석"></div>
													<em> 장애인석</em></li>
											</ul>
										</div>
										<div class="seat-num">
											<p class="tit">선택좌석</p>
											<div class="my-seat">
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
										<a href="#" class="button" id="pagePrevious"
											title="이전">이전</a> <a href="#"
											class="button disabled" id="pageNext" title="다음">다음</a>
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