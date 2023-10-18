<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MoviePlus: 모두를 위한 영화관</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp" />

	<!-- container -->
	<div class="container">

		<div class="page-util">
			<div class="inner-wrap">
				<div class="location">
					<span>Home</span> 
					<a href="https://www.megabox.co.kr/event"	title="이벤트 메인 페이지로 이동">이벤트</a> 
					<a href="#" title="진행중 이벤트 페이지로 이동">진행중 이벤트</a>
				</div>
			</div>
		</div>

		<div id="contents">
			<div class="inner-wrap">
				<h2 class="tit">진행중인 이벤트</h2>
				<div class="tab-list fixed">	<!-- 탭 리스트 -->
					<ul>
						<!-- li class="on" id="eventTab_"><a href="javascript:fn_chgEventTab('')">전체</a></li-->
						<li class="on" id="eventTab_"><a
							href="javascript:fn_eventTabMove(&#39;&#39;)" title="전체">전체</a></li>

						<!--  li id="eventTab_CED01"><a href="javascript:fn_chgEventTab('CED01')">영화</a></li-->
						<li id="eventTab_CED01" class=""><a
							href="javascript:fn_eventTabMove(&#39;CED01&#39;)"
							title="영화 탭으로 이동">영화</a></li>

						<!--  li id="eventTab_CED02"><a href="javascript:fn_chgEventTab('CED02')">극장</a></li-->
						<li id="eventTab_CED02" class=""><a
							href="javascript:fn_eventTabMove(&#39;CED02&#39;)"
							title="극장 탭으로 이동">극장</a></li>

						<!--  li id="eventTab_CED05"><a href="javascript:fn_chgEventTab('CED05')">제휴/할인</a></li-->
						<li id="eventTab_CED05" class=""><a
							href="javascript:fn_eventTabMove(&#39;CED05&#39;)"
							title="제휴/할인 탭으로 이동">제휴/할인</a></li>

						<!--  li id="eventTab_CED04"><a href="javascript:fn_chgEventTab('CED04')">시사회/무대인사</a></li-->
						<li id="eventTab_CED04" class="">
						<a href="${pageContext.request.contextPath}/event/curtaincall" 
							title="시사회/무대인사 탭으로 이동"><!-- href="javascript:fn_eventTabMove(&#39;CED04&#39;)"  -->시사회/무대인사</a></li>
						
						<!--  li id="eventTab_CED03"><a href="javascript:fn_chgEventTab('CED03')">메가Pick</a></li-->
						<li id="eventTab_CED03" class=""><a
							href="javascript:fn_eventTabMove(&#39;CED03&#39;)"
							title="재개봉 탭으로 이동">재개봉</a></li>
					</ul>
				</div>	<!-- 탭 리스트 end -->

				<div id="toptablist" class="toptablist display-none"></div>
			</div> <!-- inner-wrap class end -->


			<div id="boardSearch" class="inner-wrap" style="display: none">

				<div class="board-list-util mt40">
					<p class="result-count"></p>

					<div class="board-search">
						<input type="text" title="검색어를 입력해 주세요."
							placeholder="검색어를 입력해 주세요." class="input-text">
						<button type="button" class="btn-search-input">검색</button>
					</div>
				</div>
			</div>

			<div id="event-list-wrap"> <!-- 이벤트 리스트 (4 x 5) -->

				<div class="inner-wrap">
					<div class="tit-util mt70">
						<h3 class="tit">영화*</h3>
						<div class="right">
							<a href="javascript:fn_chgEventTab(&#39;CED01&#39;)" title="더보기">더보기
								<i class="iconset ico-arr-right-gray ml05"></i>
							</a>
						</div>
					</div>


					<div class="event-list mt15">
						<ul>
							<li><a href="https://www.megabox.co.kr/event#"
								data-no="14081" data-netfunnel="N" class="eventBtn"
								title="[음반 증정 이벤트] 21세기 피아노의 거장 : 다닐 트리포노프 상세보기"> <!--<p class="img"><img src="../../../static/pc/images/event/@img-event-list-megabox.jpg" alt="" /></p>-->
									<p class="img">
										<img src="./event_files/OuF8MwUmJhBV5sCkz6RIDXu5CUXrjCeK.jpg"
											alt="[음반 증정 이벤트] 21세기 피아노의 거장 : 다닐 트리포노프"
											onerror="noImg(this);">
									</p>

									<p class="tit">[음반 증정 이벤트] 21세기 피아노의 거장 : 다닐 트리포노프</p>

									<p class="date">2023.10.30 ~ 2023.11.13</p>
							</a></li>
						</ul>

					</div>


					<div class="tit-util mt70">
						<h3 class="tit">극장</h3>
						<div class="right">
							<a href="javascript:fn_chgEventTab(&#39;CED02&#39;)" title="더보기">더보기
								<i class="iconset ico-arr-right-gray ml05"></i>
							</a>
						</div>
					</div>


					<div class="event-list mt15">
						<ul>
							<li>
								<a href="https://www.megabox.co.kr/event#"
								data-no="13594" data-netfunnel="N" class="eventBtn"
								title="[목동] 달콤 고소 믹스팝콘 출시! 상세보기"> <!--<p class="img"><img src="../../../static/pc/images/event/@img-event-list-megabox.jpg" alt="" /></p>-->
									<p class="img">
										<img src="./event_files/H5Gp79G35D7EGI79myLrHbvhMyvCXVfG.jpg"
											alt="[목동] 달콤 고소 믹스팝콘 출시!" onerror="noImg(this);">
									</p>

									<p class="tit">[목동] 달콤 고소 믹스팝콘 출시!</p>

									<p class="date">2023.09.04 ~ 2024.12.31</p>
								</a>
							</li>
						</ul>
					</div>


					<div class="tit-util mt70">
						<h3 class="tit">제휴/할인</h3>
						<div class="right">
							<a href="javascript:fn_chgEventTab(&#39;CED05&#39;)" title="더보기">더보기
								<i class="iconset ico-arr-right-gray ml05"></i>
							</a>
						</div>
					</div>

					<div class="event-list mt15">
						<ul>
							<li><a href="https://www.megabox.co.kr/event#"
								data-no="14091" data-netfunnel="N" class="eventBtn"
								title="[삼성카드X무비플러스] 삼성카드 이용하신다면 영화 9천원 관람! 상세보기"> <!--<p class="img"><img src="../../../static/pc/images/event/@img-event-list-megabox.jpg" alt="" /></p>-->
									<p class="img">
										<img src="./event_files/nP1W09ckc1CSXuj57ge2iVJxG7KSUUuJ.jpg"
											alt="[삼성카드X무비플러스] 삼성카드 이용하신다면 영화 9천원 관람!"
											onerror="noImg(this);">
									</p>

									<p class="tit">[삼성카드X무비플러스] 삼성카드 이용하신다면 영화 9천원 관람!</p>

									<p class="date">2023.09.25 ~ 2023.10.31</p>
							</a></li>
						</ul>
					</div>


					<div class="tit-util mt70">
						<h3 class="tit">시사회/무대인사</h3>
						<div class="right">
							<a href="javascript:fn_chgEventTab(&#39;CED04&#39;)" title="더보기">더보기
								<i class="iconset ico-arr-right-gray ml05"></i>
							</a>
						</div>
					</div>


					<div class="event-list mt15">
						<ul>
							<li><a href="https://www.megabox.co.kr/event#"
								data-no="14167" data-netfunnel="N" class="eventBtn"
								title="&lt;거미집&gt; 10월 9일(월) 무대인사 상세보기"> <!--<p class="img"><img src="../../../static/pc/images/event/@img-event-list-megabox.jpg" alt="" /></p>-->
									<p class="img">
										<img src="./event_files/r67e27z9KJcShtK6GmKLyZa540D7BIhs.jpg"
											alt="&lt;거미집&gt; 10월 9일(월) 무대인사" onerror="noImg(this);">
									</p>

									<p class="tit">&lt;거미집&gt; 10월 9일(월) 무대인사</p>

									<p class="date">2023.10.09 ~ 2023.10.09</p>
							</a></li>
						</ul>
					</div>
				
				
				
					<div class="tit-util mt70">
						<h3 class="tit">재개봉</h3>
						<div class="right">
							<a href="javascript:fn_chgEventTab(&#39;CED03&#39;)" title="더보기">더보기
								<i class="iconset ico-arr-right-gray ml05"></i>
							</a>
						</div>
					</div>

					<div class="event-list mt15">

						<ul>

							<li><a href="https://www.megabox.co.kr/event#"
								data-no="14148" data-netfunnel="N" class="eventBtn"
								title="[미니 시네마 무비칩 NO.4] 거미집 상세보기"> <!--<p class="img"><img src="../../../static/pc/images/event/@img-event-list-megabox.jpg" alt="" /></p>-->
									<p class="img">
										<img src="./event_files/qBvplprRP9LBljXVlfpW2Ytpl8BwWD3i.jpg"
											alt="[미니 시네마 무비칩 NO.4] 거미집" onerror="noImg(this);">
									</p>

									<p class="tit">[미니 시네마 무비칩 NO.4] 거미집</p>

									<p class="date">2023.09.27 ~ 2023.10.10</p>
							</a></li>


							<li><a href="https://www.megabox.co.kr/event#"
								data-no="14130" data-netfunnel="N" class="eventBtn"
								title="[냥사원 추석선물세트] MEGA-DRAW🍀 상세보기"> <!--<p class="img"><img src="../../../static/pc/images/event/@img-event-list-megabox.jpg" alt="" /></p>-->
									<p class="img">
										<img src="./event_files/Rc68zSpipRxRcmJD92NV2oNOUGZhferp.png"
											alt="[냥사원 추석선물세트] MEGA-DRAW🍀" onerror="noImg(this);">
									</p>

									<p class="tit">[냥사원 추석선물세트] MEGA-DRAW🍀</p>

									<p class="date">2023.09.27 ~ 2023.10.09</p>
							</a></li>




							<li><a href="https://www.megabox.co.kr/event#"
								data-no="14129" data-netfunnel="N" class="eventBtn"
								title="[냥사원 추석선물세트] 만원의 행복💸 상세보기"> <!--<p class="img"><img src="../../../static/pc/images/event/@img-event-list-megabox.jpg" alt="" /></p>-->
									<p class="img">
										<img src="./event_files/GFRbC0aYEs0pv5IFSJRdbdwJyIMiR2HB.png"
											alt="[냥사원 추석선물세트] 만원의 행복💸" onerror="noImg(this);">
									</p>

									<p class="tit">[냥사원 추석선물세트] 만원의 행복💸</p>

									<p class="date">2023.09.27 ~ 2023.10.03</p>
							</a></li>


							<li><a href="https://www.megabox.co.kr/event#"
								data-no="14131" data-netfunnel="N" class="eventBtn"
								title="냥사원이 먹고 싶어서 만든 만춘쿠키🍪 상세보기"> <!--<p class="img"><img src="../../../static/pc/images/event/@img-event-list-megabox.jpg" alt="" /></p>-->
									<p class="img">
										<img src="./event_files/exewEGhKg35lsTwavoeUhuUP01e3BwFo.jpg"
											alt="냥사원이 먹고 싶어서 만든 만춘쿠키🍪" onerror="noImg(this);">
									</p>

									<p class="tit">냥사원이 먹고 싶어서 만든 만춘쿠키🍪</p>

									<p class="date">2023.09.22 ~ 2023.10.09</p>
							</a></li>

						</ul>
					</div> <!-- 재개봉 end -->
					
					
				</div><!-- inner-wrap end -->
			</div><!-- event-list-wrap end -->



		</div>
	</div>
	<!--// container -->


	<jsp:include page="/WEB-INF/views/footer.jsp" />
</body>
</html>