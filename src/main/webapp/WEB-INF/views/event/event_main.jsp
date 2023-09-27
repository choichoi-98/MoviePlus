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

				<div class="tab-list fixed">
					<ul>
						<!-- li class="on" id="eventTab_"><a href="javascript:fn_chgEventTab('')">전체</a></li-->
						<li class="on" id="eventTab_"><a
							href="javascript:fn_eventTabMove(&#39;&#39;)" title="전체">전체</a></li>

						<!--  li id="eventTab_CED03"><a href="javascript:fn_chgEventTab('CED03')">메가Pick</a></li-->
						<li id="eventTab_CED03" class=""><a
							href="javascript:fn_eventTabMove(&#39;CED03&#39;)"
							title="메가Pick 탭으로 이동">메가Pick</a></li>

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
						<li id="eventTab_CED04" class=""><a
							href="javascript:fn_eventTabMove(&#39;CED04&#39;)"
							title="시사회/무대인사 탭으로 이동">시사회/무대인사</a></li>

					</ul>
				</div>

				<div id="toptablist" class="toptablist display-none"></div>













			</div>


			<div id="divTopArea" class="event-slider">
				<div class="inner-wrap">

					<p class="name">추천 이벤트</p>

					<div class="event-pagination swiper-pagination-bullets">
						<span class="swiper-pagination-bullet"></span><span
							class="swiper-pagination-bullet"></span><span
							class="swiper-pagination-bullet"></span><span
							class="swiper-pagination-bullet"></span><span
							class="swiper-pagination-bullet"></span><span
							class="swiper-pagination-bullet"></span><span
							class="swiper-pagination-bullet"></span><span
							class="swiper-pagination-bullet"></span><span
							class="swiper-pagination-bullet"></span><span
							class="swiper-pagination-bullet swiper-pagination-bullet-active"></span><span
							class="swiper-pagination-bullet"></span><span
							class="swiper-pagination-bullet"></span><span
							class="swiper-pagination-bullet"></span><span
							class="swiper-pagination-bullet"></span><span
							class="swiper-pagination-bullet"></span><span
							class="swiper-pagination-bullet"></span><span
							class="swiper-pagination-bullet"></span><span
							class="swiper-pagination-bullet"></span><span
							class="swiper-pagination-bullet"></span><span
							class="swiper-pagination-bullet"></span><span
							class="swiper-pagination-bullet"></span><span
							class="swiper-pagination-bullet"></span><span
							class="swiper-pagination-bullet"></span><span
							class="swiper-pagination-bullet"></span>
					</div>

					<div class="event-count">
						<span title="현재 페이지" class="active">10</span> / <span
							title="전체 페이지" class="total">24</span>
					</div>

					<div class="event-util">
						<button type="button" class="event-prev" tabindex="0"
							role="button" aria-label="Previous slide">이전 이벤트 보기</button>
						<button type="button" class="event-next" tabindex="0"
							role="button" aria-label="Next slide">다음 이벤트 보기</button>
						<button type="button" class="pause on">일시정지</button>
						<button type="button" class="play">자동재생</button>
					</div>

					<div class="event-control">
						<button type="button" class="event-prev" tabindex="0"
							role="button" aria-label="Previous slide">이전 이벤트 보기</button>
						<button type="button" class="event-next" tabindex="0"
							role="button" aria-label="Next slide">다음 이벤트 보기</button>
					</div>
				</div>

				<div
					class="event-swiper swiper-container-initialized swiper-container-horizontal">
					<div class="swiper-wrapper"
						style="transform: translate3d(-6270px, 0px, 0px); transition-duration: 0ms;">
						<div class="cell swiper-slide swiper-slide-duplicate"
							data-swiper-slide-index="22"
							style="width: 530px; margin-right: 40px;">
							<a href="https://www.megabox.co.kr/event#" data-no="12761"
								data-netfunnel="N" class="eventBtn"
								title="[메가박스X더쎈카드] 할인카드 조회하고 혜택받자! 상세보기">

								<p class="img">
									<img src="./event_files/tGlm2fXaKlYTeX55sC3h4VFQUwHPXdXV.jpg"
										alt="[메가박스X더쎈카드] 할인카드 조회하고 혜택받자!" onerror="noImg(this);">
								</p>

								<div class="cont">
									<p class="tit">[메가박스X더쎈카드] 할인카드 조회하고 혜택받자!</p>
									<p class="date">2023.03.10 ~ 2023.12.31</p>
								</div>
							</a>

						</div>
						<div class="cell swiper-slide swiper-slide-duplicate"
							data-swiper-slide-index="23"
							style="width: 530px; margin-right: 40px;">
							<a href="https://www.megabox.co.kr/event#" data-no="9187"
								data-netfunnel="N" class="eventBtn"
								title="U+멤버십 고객 영화 2,000원 할인 상세보기">

								<p class="img">
									<img src="./event_files/poxTnLz5oVfwTJlW6TINBrEKv3jP2GIJ.jpg"
										alt="U+멤버십 고객 영화 2,000원 할인" onerror="noImg(this);">
								</p>

								<div class="cont">
									<p class="tit">U+멤버십 고객 영화 2,000원 할인</p>
									<p class="date">2021.02.01 ~ 2023.12.31</p>
								</div>
							</a>

						</div>
						<!-- 반복 -->

						<div class="cell swiper-slide" data-swiper-slide-index="0"
							style="width: 530px; margin-right: 40px;">
							<a href="https://www.megabox.co.kr/event#" data-no="14037"
								data-netfunnel="N" class="eventBtn"
								title="[2023 시네 도슨트] 위대한 예술가들을 만나다  상세보기">

								<p class="img">
									<img src="./event_files/eAx3Sfbwr9hTjsuv2rkM0XekHgARkiVB.jpg"
										alt="[2023 시네 도슨트] 위대한 예술가들을 만나다 " onerror="noImg(this);">
								</p>

								<div class="cont">
									<p class="tit">[2023 시네 도슨트] 위대한 예술가들을 만나다</p>
									<p class="date">2023.10.09 ~ 2023.11.07</p>
								</div>
							</a>

						</div>

						<div class="cell swiper-slide" data-swiper-slide-index="1"
							style="width: 530px; margin-right: 40px;">
							<a href="https://www.megabox.co.kr/event#" data-no="13988"
								data-netfunnel="N" class="eventBtn"
								title="[21세기 피아노의 거장] 리사이틀 기획전  상세보기">

								<p class="img">
									<img src="./event_files/29IkJK1VQSgkTXAeJfsVgjuBap8VcElF.jpg"
										alt="[21세기 피아노의 거장] 리사이틀 기획전 " onerror="noImg(this);">
								</p>

								<div class="cont">
									<p class="tit">[21세기 피아노의 거장] 리사이틀 기획전</p>
									<p class="date">2023.10.02 ~ 2023.11.11</p>
								</div>
							</a>

						</div>

						<div class="cell swiper-slide" data-swiper-slide-index="2"
							style="width: 530px; margin-right: 40px;">
							<a href="https://www.megabox.co.kr/event#" data-no="14093"
								data-netfunnel="N" class="eventBtn"
								title="볼수록 더 걸작이다! &lt;거미집&gt; N차 관람 이벤트 상세보기">

								<p class="img">
									<img src="./event_files/bNc7h2aRbenEIaZWmx7VZsBXJGHJYg43.jpg"
										alt="볼수록 더 걸작이다! &lt;거미집&gt; N차 관람 이벤트" onerror="noImg(this);">
								</p>

								<div class="cont">
									<p class="tit">볼수록 더 걸작이다! &lt;거미집&gt; N차 관람 이벤트</p>
									<p class="date">2023.09.27 ~ 2023.10.17</p>
								</div>
							</a>

						</div>

						<div class="cell swiper-slide" data-swiper-slide-index="3"
							style="width: 530px; margin-right: 40px;">
							<a href="https://www.megabox.co.kr/event#" data-no="14130"
								data-netfunnel="N" class="eventBtn"
								title="[냥사원 추석선물세트] MEGA-DRAW🍀 상세보기">

								<p class="img">
									<img src="./event_files/OGudZYJmHVGhUWlPpZ1Jq9JiO95p2Ezs.png"
										alt="[냥사원 추석선물세트] MEGA-DRAW🍀" onerror="noImg(this);">
								</p>

								<div class="cont">
									<p class="tit">[냥사원 추석선물세트] MEGA-DRAW🍀</p>
									<p class="date">2023.09.27 ~ 2023.10.09</p>
								</div>
							</a>

						</div>

						<div class="cell swiper-slide" data-swiper-slide-index="4"
							style="width: 530px; margin-right: 40px;">
							<a href="https://www.megabox.co.kr/event#" data-no="14129"
								data-netfunnel="N" class="eventBtn"
								title="[냥사원 추석선물세트] 만원의 행복💸 상세보기">

								<p class="img">
									<img src="./event_files/xETgRnYda46lEYp9nKV3rcQKnXGmeMZC.jpg"
										alt="[냥사원 추석선물세트] 만원의 행복💸" onerror="noImg(this);">
								</p>

								<div class="cont">
									<p class="tit">[냥사원 추석선물세트] 만원의 행복💸</p>
									<p class="date">2023.09.27 ~ 2023.10.03</p>
								</div>
							</a>

						</div>

						<div class="cell swiper-slide" data-swiper-slide-index="5"
							style="width: 530px; margin-right: 40px;">
							<a href="https://www.megabox.co.kr/event#" data-no="14091"
								data-netfunnel="N" class="eventBtn"
								title="[삼성카드X메가박스] 삼성카드 이용하신다면 영화 9천원 관람! 상세보기">

								<p class="img">
									<img src="./event_files/wFzM0LZSmlPX81lnpQhuowNb9VP9LkGj.jpg"
										alt="[삼성카드X메가박스] 삼성카드 이용하신다면 영화 9천원 관람!"
										onerror="noImg(this);">
								</p>

								<div class="cont">
									<p class="tit">[삼성카드X메가박스] 삼성카드 이용하신다면 영화 9천원 관람!</p>
									<p class="date">2023.09.25 ~ 2023.10.31</p>
								</div>
							</a>

						</div>

						<div class="cell swiper-slide" data-swiper-slide-index="6"
							style="width: 530px; margin-right: 40px;">
							<a href="https://www.megabox.co.kr/event#" data-no="14016"
								data-netfunnel="N" class="eventBtn"
								title="메가박스 한가위 관람권패키지 출시 상세보기">

								<p class="img">
									<img src="./event_files/CD7iGjetxRFCiC5wrn2zKOVNi2dDQ0SM.jpg"
										alt="메가박스 한가위 관람권패키지 출시" onerror="noImg(this);">
								</p>

								<div class="cont">
									<p class="tit">메가박스 한가위 관람권패키지 출시</p>
									<p class="date">2023.09.11 ~ 2023.10.03</p>
								</div>
							</a>

						</div>

						<div class="cell swiper-slide" data-swiper-slide-index="7"
							style="width: 530px; margin-right: 40px;">
							<a href="https://www.megabox.co.kr/event#" data-no="14065"
								data-netfunnel="N" class="eventBtn"
								title="[카카오페이] 온라인 결제 시 즉시할인 선착순 혜택 제공! 상세보기">

								<p class="img">
									<img src="./event_files/XWKEW9ZLYmFFjnzoo60MF08dwRhyRL4m.jpg"
										alt="[카카오페이] 온라인 결제 시 즉시할인 선착순 혜택 제공!" onerror="noImg(this);">
								</p>

								<div class="cont">
									<p class="tit">[카카오페이] 온라인 결제 시 즉시할인 선착순 혜택 제공!</p>
									<p class="date">2023.09.18 ~ 2023.10.15</p>
								</div>
							</a>

						</div>

						<div class="cell swiper-slide swiper-slide-prev"
							data-swiper-slide-index="8"
							style="width: 530px; margin-right: 40px;">
							<a href="https://www.megabox.co.kr/event#" data-no="14064"
								data-netfunnel="N" class="eventBtn"
								title="[포인트페스타] 제휴포인트 쓰고 콤보 할인쿠폰 받아가세요! 상세보기">

								<p class="img">
									<img src="./event_files/mW6j1BOI4WHooQ3HqJyRWKLoLZkxh8Ct.jpg"
										alt="[포인트페스타] 제휴포인트 쓰고 콤보 할인쿠폰 받아가세요!" onerror="noImg(this);">
								</p>

								<div class="cont">
									<p class="tit">[포인트페스타] 제휴포인트 쓰고 콤보 할인쿠폰 받아가세요!</p>
									<p class="date">2023.09.18 ~ 2023.10.15</p>
								</div>
							</a>

						</div>

						<div class="cell swiper-slide swiper-slide-active"
							data-swiper-slide-index="9"
							style="width: 530px; margin-right: 40px;">
							<a href="https://www.megabox.co.kr/event#" data-no="14060"
								data-netfunnel="N" class="eventBtn"
								title="[KT x 메가박스] 9월 어썸한 달달혜택 상세보기">

								<p class="img">
									<img src="./event_files/yPvhJmofW2ydgsAX0vQTE2pXEvtnq4gH.jpg"
										alt="[KT x 메가박스] 9월 어썸한 달달혜택" onerror="noImg(this);">
								</p>

								<div class="cont">
									<p class="tit">[KT x 메가박스] 9월 어썸한 달달혜택</p>
									<p class="date">2023.09.15 ~ 2023.09.30</p>
								</div>
							</a>

						</div>

						<div class="cell swiper-slide swiper-slide-next"
							data-swiper-slide-index="10"
							style="width: 530px; margin-right: 40px;">
							<a href="https://www.megabox.co.kr/event#" data-no="12642"
								data-netfunnel="N" class="eventBtn" title="메가박스 VIP 혜택 안내 상세보기">

								<p class="img">
									<img src="./event_files/ZbBRWoViHfa6Oc40yCwEs1lB4VmW4Lhi.jpg"
										alt="메가박스 VIP 혜택 안내" onerror="noImg(this);">
								</p>

								<div class="cont">
									<p class="tit">메가박스 VIP 혜택 안내</p>
									<p class="date">2023.03.02 ~ 2024.02.29</p>
								</div>
							</a>

						</div>

						<div class="cell swiper-slide" data-swiper-slide-index="11"
							style="width: 530px; margin-right: 40px;">
							<a href="https://www.megabox.co.kr/event#" data-no="13381"
								data-netfunnel="N" class="eventBtn"
								title="[DB손해보험] 내 차 보험료 확인하고 영화 할인쿠폰 받기 상세보기">

								<p class="img">
									<img src="./event_files/iQfG1SrlkF1g81hZDEkWvO00AMzknYsM.jpg"
										alt="[DB손해보험] 내 차 보험료 확인하고 영화 할인쿠폰 받기" onerror="noImg(this);">
								</p>

								<div class="cont">
									<p class="tit">[DB손해보험] 내 차 보험료 확인하고 영화 할인쿠폰 받기</p>
									<p class="date">2023.05.30 ~ 2023.12.31</p>
								</div>
							</a>

						</div>

						<div class="cell swiper-slide" data-swiper-slide-index="12"
							style="width: 530px; margin-right: 40px;">
							<a href="https://www.megabox.co.kr/event#" data-no="11263"
								data-netfunnel="N" class="eventBtn"
								title="내 차 보험료 확인하고 영화 1만원 할인쿠폰 받으세요! 상세보기">

								<p class="img">
									<img src="./event_files/nWyHhXImDc6vKH1YZgiNhhlfDI5Zvq0O.jpg"
										alt="내 차 보험료 확인하고 영화 1만원 할인쿠폰 받으세요!" onerror="noImg(this);">
								</p>

								<div class="cont">
									<p class="tit">내 차 보험료 확인하고 영화 1만원 할인쿠폰 받으세요!</p>
									<p class="date">2022.04.18 ~ 2023.12.31</p>
								</div>
							</a>

						</div>

						<div class="cell swiper-slide" data-swiper-slide-index="13"
							style="width: 530px; margin-right: 40px;">
							<a href="https://www.megabox.co.kr/event#" data-no="13975"
								data-netfunnel="N" class="eventBtn"
								title="[메가박스X진에어] 추석은 메X진행렬입니다! 상세보기">

								<p class="img">
									<img src="./event_files/GEGjJIHH7M7GYDaBEPXVvi3wpsAkX03h.jpg"
										alt="[메가박스X진에어] 추석은 메X진행렬입니다!" onerror="noImg(this);">
								</p>

								<div class="cont">
									<p class="tit">[메가박스X진에어] 추석은 메X진행렬입니다!</p>
									<p class="date">2023.09.07 ~ 2023.10.09</p>
								</div>
							</a>

						</div>

						<div class="cell swiper-slide" data-swiper-slide-index="14"
							style="width: 530px; margin-right: 40px;">
							<a href="https://www.megabox.co.kr/event#" data-no="13941"
								data-netfunnel="N" class="eventBtn"
								title="[톡학생증 x  메가박스] 톡학생증 발급받고 톡똑한 영화관람! 상세보기">

								<p class="img">
									<img src="./event_files/KpW5X2KPkHXO19gdVvbpfwM3rJNkCYLr.jpg"
										alt="[톡학생증 x  메가박스] 톡학생증 발급받고 톡똑한 영화관람!"
										onerror="noImg(this);">
								</p>

								<div class="cont">
									<p class="tit">[톡학생증 x 메가박스] 톡학생증 발급받고 톡똑한 영화관람!</p>
									<p class="date">2023.09.01 ~ 2024.08.31</p>
								</div>
							</a>

						</div>

						<div class="cell swiper-slide" data-swiper-slide-index="15"
							style="width: 530px; margin-right: 40px;">
							<a href="https://www.megabox.co.kr/event#" data-no="13930"
								data-netfunnel="N" class="eventBtn"
								title="강원지역 삼성카드 영화할인 프로모션 상세보기">

								<p class="img">
									<img src="./event_files/OZg00VZtug6tsp4MmsJgrpdHG644M100.jpg"
										alt="강원지역 삼성카드 영화할인 프로모션" onerror="noImg(this);">
								</p>

								<div class="cont">
									<p class="tit">강원지역 삼성카드 영화할인 프로모션</p>
									<p class="date">2023.09.01 ~ 2023.10.03</p>
								</div>
							</a>

						</div>

						<div class="cell swiper-slide" data-swiper-slide-index="16"
							style="width: 530px; margin-right: 40px;">
							<a href="https://www.megabox.co.kr/event#" data-no="13953"
								data-netfunnel="N" class="eventBtn"
								title="[토스페이] 메가박스 최대 1.3만원 혜택받기 상세보기">

								<p class="img">
									<img src="./event_files/aVHBHL1xMICgmQgwH1D7l92o0SNr2B4J.jpg"
										alt="[토스페이] 메가박스 최대 1.3만원 혜택받기" onerror="noImg(this);">
								</p>

								<div class="cont">
									<p class="tit">[토스페이] 메가박스 최대 1.3만원 혜택받기</p>
									<p class="date">2023.09.01 ~ 2023.09.30</p>
								</div>
							</a>

						</div>

						<div class="cell swiper-slide" data-swiper-slide-index="17"
							style="width: 530px; margin-right: 40px;">
							<a href="https://www.megabox.co.kr/event#" data-no="13935"
								data-netfunnel="N" class="eventBtn"
								title="[메가박스X더쎈카드] 더쎈카드에서 메가박스 쿠폰 받자! 상세보기">

								<p class="img">
									<img src="./event_files/hboB4LC3tVmiHIhQPNDxa0LljgSZyKvl.png"
										alt="[메가박스X더쎈카드] 더쎈카드에서 메가박스 쿠폰 받자!" onerror="noImg(this);">
								</p>

								<div class="cont">
									<p class="tit">[메가박스X더쎈카드] 더쎈카드에서 메가박스 쿠폰 받자!</p>
									<p class="date">2023.08.19 ~ 2023.09.30</p>
								</div>
							</a>

						</div>

						<div class="cell swiper-slide" data-swiper-slide-index="18"
							style="width: 530px; margin-right: 40px;">
							<a href="https://www.megabox.co.kr/event#" data-no="13889"
								data-netfunnel="N" class="eventBtn"
								title="[메가박스X발로소득] 메가박스 챌린지 참여하고 영화 할인쿠폰 받기 상세보기">

								<p class="img">
									<img src="./event_files/qycpbOhLKmjFMyecVF8Nbmatf2ZdmiBG.png"
										alt="[메가박스X발로소득] 메가박스 챌린지 참여하고 영화 할인쿠폰 받기"
										onerror="noImg(this);">
								</p>

								<div class="cont">
									<p class="tit">[메가박스X발로소득] 메가박스 챌린지 참여하고 영화 할인쿠폰 받기</p>
									<p class="date">2023.08.19 ~ 2023.09.30</p>
								</div>
							</a>

						</div>

						<div class="cell swiper-slide" data-swiper-slide-index="19"
							style="width: 530px; margin-right: 40px;">
							<a href="https://www.megabox.co.kr/event#" data-no="13633"
								data-netfunnel="N" class="eventBtn"
								title="[ktM모바일X메가박스] 알뜰폰 제휴요금제 출시 안내 상세보기">

								<p class="img">
									<img src="./event_files/FxG3rrK1qAbig01AxmJP7jvGvtB850Ii.jpg"
										alt="[ktM모바일X메가박스] 알뜰폰 제휴요금제 출시 안내" onerror="noImg(this);">
								</p>

								<div class="cont">
									<p class="tit">[ktM모바일X메가박스] 알뜰폰 제휴요금제 출시 안내</p>
									<p class="date">2023.07.06 ~ 2023.12.31</p>
								</div>
							</a>

						</div>

						<div class="cell swiper-slide" data-swiper-slide-index="20"
							style="width: 530px; margin-right: 40px;">
							<a href="https://www.megabox.co.kr/event#" data-no="8865"
								data-netfunnel="N" class="eventBtn"
								title="[메가박스X현대카드] 상시 6,000M 포인트 사용 상세보기">

								<p class="img">
									<img src="./event_files/liflSYt4BQt4RYxrBuLVXG3Tk3Wq2CdA.jpg"
										alt="[메가박스X현대카드] 상시 6,000M 포인트 사용" onerror="noImg(this);">
								</p>

								<div class="cont">
									<p class="tit">[메가박스X현대카드] 상시 6,000M 포인트 사용</p>
									<p class="date">2023.05.02 ~ 2023.12.31</p>
								</div>
							</a>

						</div>

						<div class="cell swiper-slide" data-swiper-slide-index="21"
							style="width: 530px; margin-right: 40px;">
							<a href="https://www.megabox.co.kr/event#" data-no="13065"
								data-netfunnel="N" class="eventBtn"
								title="[토스페이] 생애 첫 결제 시 최대 3천원 즉시할인 상세보기">

								<p class="img">
									<img src="./event_files/0P08kANUShhVA5bR2LGYeQ4OZYn6Iakj.jpg"
										alt="[토스페이] 생애 첫 결제 시 최대 3천원 즉시할인" onerror="noImg(this);">
								</p>

								<div class="cont">
									<p class="tit">[토스페이] 생애 첫 결제 시 최대 3천원 즉시할인</p>
									<p class="date">2023.04.24 ~ 2024.04.30</p>
								</div>
							</a>

						</div>

						<div class="cell swiper-slide" data-swiper-slide-index="22"
							style="width: 530px; margin-right: 40px;">
							<a href="https://www.megabox.co.kr/event#" data-no="12761"
								data-netfunnel="N" class="eventBtn"
								title="[메가박스X더쎈카드] 할인카드 조회하고 혜택받자! 상세보기">

								<p class="img">
									<img src="./event_files/tGlm2fXaKlYTeX55sC3h4VFQUwHPXdXV.jpg"
										alt="[메가박스X더쎈카드] 할인카드 조회하고 혜택받자!" onerror="noImg(this);">
								</p>

								<div class="cont">
									<p class="tit">[메가박스X더쎈카드] 할인카드 조회하고 혜택받자!</p>
									<p class="date">2023.03.10 ~ 2023.12.31</p>
								</div>
							</a>

						</div>

						<div class="cell swiper-slide" data-swiper-slide-index="23"
							style="width: 530px; margin-right: 40px;">
							<a href="https://www.megabox.co.kr/event#" data-no="9187"
								data-netfunnel="N" class="eventBtn"
								title="U+멤버십 고객 영화 2,000원 할인 상세보기">

								<p class="img">
									<img src="./event_files/poxTnLz5oVfwTJlW6TINBrEKv3jP2GIJ.jpg"
										alt="U+멤버십 고객 영화 2,000원 할인" onerror="noImg(this);">
								</p>

								<div class="cont">
									<p class="tit">U+멤버십 고객 영화 2,000원 할인</p>
									<p class="date">2021.02.01 ~ 2023.12.31</p>
								</div>
							</a>

						</div>

						<div class="cell swiper-slide swiper-slide-duplicate"
							data-swiper-slide-index="0"
							style="width: 530px; margin-right: 40px;">
							<a href="https://www.megabox.co.kr/event#" data-no="14037"
								data-netfunnel="N" class="eventBtn"
								title="[2023 시네 도슨트] 위대한 예술가들을 만나다  상세보기">

								<p class="img">
									<img src="./event_files/eAx3Sfbwr9hTjsuv2rkM0XekHgARkiVB.jpg"
										alt="[2023 시네 도슨트] 위대한 예술가들을 만나다 " onerror="noImg(this);">
								</p>

								<div class="cont">
									<p class="tit">[2023 시네 도슨트] 위대한 예술가들을 만나다</p>
									<p class="date">2023.10.09 ~ 2023.11.07</p>
								</div>
							</a>

						</div>
						<div class="cell swiper-slide swiper-slide-duplicate"
							data-swiper-slide-index="1"
							style="width: 530px; margin-right: 40px;">
							<a href="https://www.megabox.co.kr/event#" data-no="13988"
								data-netfunnel="N" class="eventBtn"
								title="[21세기 피아노의 거장] 리사이틀 기획전  상세보기">

								<p class="img">
									<img src="./event_files/29IkJK1VQSgkTXAeJfsVgjuBap8VcElF.jpg"
										alt="[21세기 피아노의 거장] 리사이틀 기획전 " onerror="noImg(this);">
								</p>

								<div class="cont">
									<p class="tit">[21세기 피아노의 거장] 리사이틀 기획전</p>
									<p class="date">2023.10.02 ~ 2023.11.11</p>
								</div>
							</a>

						</div>
					</div>
					<span class="swiper-notification" aria-live="assertive"
						aria-atomic="true"></span>
				</div>
			</div>


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

			<div id="event-list-wrap">



				<div class="inner-wrap">


					<div class="tit-util mt70">
						<h3 class="tit">메가Pick</h3>
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

					</div>



					<div class="tit-util mt70">
						<h3 class="tit">영화</h3>
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




							<li><a href="https://www.megabox.co.kr/event#"
								data-no="14080" data-netfunnel="N" class="eventBtn"
								title="[음반 증정 이벤트] 21세기 피아노의 거장 : 이고르 레빗 상세보기"> <!--<p class="img"><img src="../../../static/pc/images/event/@img-event-list-megabox.jpg" alt="" /></p>-->
									<p class="img">
										<img src="./event_files/r3dVGIq3y73GNoIBHTUr59iaky4FaizJ.jpg"
											alt="[음반 증정 이벤트] 21세기 피아노의 거장 : 이고르 레빗"
											onerror="noImg(this);">
									</p>

									<p class="tit">[음반 증정 이벤트] 21세기 피아노의 거장 : 이고르 레빗</p>

									<p class="date">2023.10.16 ~ 2023.10.30</p>
							</a></li>




							<li><a href="https://www.megabox.co.kr/event#"
								data-no="14111" data-netfunnel="N" class="eventBtn"
								title="[2023 사건 읽는 영화관] 마지막 사건 : ep09. 조직 폭력사건 상세보기"> <!--<p class="img"><img src="../../../static/pc/images/event/@img-event-list-megabox.jpg" alt="" /></p>-->
									<p class="img">
										<img src="./event_files/kpKe2kMQ9he4ByMPBk0tTkNXfE1VbXE9.jpg"
											alt="[2023 사건 읽는 영화관] 마지막 사건 : ep09. 조직 폭력사건"
											onerror="noImg(this);">
									</p>

									<p class="tit">[2023 사건 읽는 영화관] 마지막 사건 : ep09. 조직 폭력사건</p>

									<p class="date">2023.10.15 ~ 2023.10.15</p>
							</a></li>




							<li><a href="https://www.megabox.co.kr/event#"
								data-no="13986" data-netfunnel="N" class="eventBtn"
								title="[특별기획 시네 도슨트] 파리로 떠나는 미술관 나들이  상세보기"> <!--<p class="img"><img src="../../../static/pc/images/event/@img-event-list-megabox.jpg" alt="" /></p>-->
									<p class="img">
										<img src="./event_files/aItO9tvuBL6jR8cIaZK4oTZbvQMdMo0S.jpg"
											alt="[특별기획 시네 도슨트] 파리로 떠나는 미술관 나들이 " onerror="noImg(this);">
									</p>

									<p class="tit">[특별기획 시네 도슨트] 파리로 떠나는 미술관 나들이</p>

									<p class="date">2023.10.14 ~ 2023.10.14</p>
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

							<li><a href="https://www.megabox.co.kr/event#"
								data-no="13594" data-netfunnel="N" class="eventBtn"
								title="[목동] 달콤 고소 믹스팝콘 출시! 상세보기"> <!--<p class="img"><img src="../../../static/pc/images/event/@img-event-list-megabox.jpg" alt="" /></p>-->
									<p class="img">
										<img src="./event_files/H5Gp79G35D7EGI79myLrHbvhMyvCXVfG.jpg"
											alt="[목동] 달콤 고소 믹스팝콘 출시!" onerror="noImg(this);">
									</p>

									<p class="tit">[목동] 달콤 고소 믹스팝콘 출시!</p>

									<p class="date">2023.09.04 ~ 2024.12.31</p>
							</a></li>







							<li><a href="https://www.megabox.co.kr/event#"
								data-no="14058" data-netfunnel="N" class="eventBtn"
								title="[대구경북지역] 대구경북 추석 감사제! 상세보기"> <!--<p class="img"><img src="../../../static/pc/images/event/@img-event-list-megabox.jpg" alt="" /></p>-->
									<p class="img">
										<img src="./event_files/d1XbZ2eCriDT38XJ1PRwJlwgMXbQXEe3.jpg"
											alt="[대구경북지역] 대구경북 추석 감사제!" onerror="noImg(this);">
									</p>

									<p class="tit">[대구경북지역] 대구경북 추석 감사제!</p>

									<p class="date">2023.09.28 ~ 2023.10.09</p>
							</a></li>




							<li><a href="https://www.megabox.co.kr/event#"
								data-no="12817" data-netfunnel="N" class="eventBtn"
								title="[세종] 황금 연휴, 시크릿 쿠폰 상세보기"> <!--<p class="img"><img src="../../../static/pc/images/event/@img-event-list-megabox.jpg" alt="" /></p>-->
									<p class="img">
										<img src="./event_files/31f8AFvVElpdDgerHg9MhvB3SVy58OWr.jpg"
											alt="[세종] 황금 연휴, 시크릿 쿠폰" onerror="noImg(this);">
									</p>

									<p class="tit">[세종] 황금 연휴, 시크릿 쿠폰</p>

									<p class="date">2023.09.28 ~ 2023.10.03</p>
							</a></li>




							<li><a href="https://www.megabox.co.kr/event#"
								data-no="14147" data-netfunnel="N" class="eventBtn"
								title="[영통] 추석 감사제 상세보기"> <!--<p class="img"><img src="../../../static/pc/images/event/@img-event-list-megabox.jpg" alt="" /></p>-->
									<p class="img">
										<img src="./event_files/7KrAFENgZr00jjVOCyWCO11hSqZNPgmX.jpg"
											alt="[영통] 추석 감사제" onerror="noImg(this);">
									</p>

									<p class="tit">[영통] 추석 감사제</p>

									<p class="date">2023.09.21 ~ 2023.10.09</p>
							</a></li>



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
								title="[삼성카드X메가박스] 삼성카드 이용하신다면 영화 9천원 관람! 상세보기"> <!--<p class="img"><img src="../../../static/pc/images/event/@img-event-list-megabox.jpg" alt="" /></p>-->
									<p class="img">
										<img src="./event_files/nP1W09ckc1CSXuj57ge2iVJxG7KSUUuJ.jpg"
											alt="[삼성카드X메가박스] 삼성카드 이용하신다면 영화 9천원 관람!"
											onerror="noImg(this);">
									</p>

									<p class="tit">[삼성카드X메가박스] 삼성카드 이용하신다면 영화 9천원 관람!</p>

									<p class="date">2023.09.25 ~ 2023.10.31</p>
							</a></li>







							<li><a href="https://www.megabox.co.kr/event#"
								data-no="14065" data-netfunnel="N" class="eventBtn"
								title="[카카오페이] 온라인 결제 시 즉시할인 선착순 혜택 제공! 상세보기"> <!--<p class="img"><img src="../../../static/pc/images/event/@img-event-list-megabox.jpg" alt="" /></p>-->
									<p class="img">
										<img src="./event_files/J3BC9s7UCPgkbQEKTO85oymCeHXVoi5w.jpg"
											alt="[카카오페이] 온라인 결제 시 즉시할인 선착순 혜택 제공!" onerror="noImg(this);">
									</p>

									<p class="tit">[카카오페이] 온라인 결제 시 즉시할인 선착순 혜택 제공!</p>

									<p class="date">2023.09.18 ~ 2023.10.15</p>
							</a></li>






							<li><a href="https://www.megabox.co.kr/event#"
								data-no="14064" data-netfunnel="N" class="eventBtn"
								title="[포인트페스타] 제휴포인트 쓰고 콤보 할인쿠폰 받아가세요! 상세보기"> <!--<p class="img"><img src="../../../static/pc/images/event/@img-event-list-megabox.jpg" alt="" /></p>-->
									<p class="img">
										<img src="./event_files/D1YzDw39oDeSIbE1Q92RTRVV9fJ7WiDX.jpg"
											alt="[포인트페스타] 제휴포인트 쓰고 콤보 할인쿠폰 받아가세요!" onerror="noImg(this);">
									</p>

									<p class="tit">[포인트페스타] 제휴포인트 쓰고 콤보 할인쿠폰 받아가세요!</p>

									<p class="date">2023.09.18 ~ 2023.10.15</p>
							</a></li>






							<li><a href="https://www.megabox.co.kr/event#"
								data-no="14060" data-netfunnel="N" class="eventBtn"
								title="[KT x 메가박스] 9월 어썸한 달달혜택 상세보기"> <!--<p class="img"><img src="../../../static/pc/images/event/@img-event-list-megabox.jpg" alt="" /></p>-->
									<p class="img">
										<img src="./event_files/xoVut4qd0vhGvFLOofidsMQRgeoU3YPZ.jpg"
											alt="[KT x 메가박스] 9월 어썸한 달달혜택" onerror="noImg(this);">
									</p>

									<p class="tit">[KT x 메가박스] 9월 어썸한 달달혜택</p>

									<p class="date">2023.09.15 ~ 2023.09.30</p>
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




							<li><a href="https://www.megabox.co.kr/event#"
								data-no="14136" data-netfunnel="N" class="eventBtn"
								title="&lt;30일&gt; 개봉주말&amp;한글날 무대인사 상세보기"> <!--<p class="img"><img src="../../../static/pc/images/event/@img-event-list-megabox.jpg" alt="" /></p>-->
									<p class="img">
										<img src="./event_files/5cAJZ2jcDWmrabKUb8yZBZhsgMPb7a9N.jpg"
											alt="&lt;30일&gt; 개봉주말&amp;한글날 무대인사" onerror="noImg(this);">
									</p>

									<p class="tit">&lt;30일&gt; 개봉주말&amp;한글날 무대인사</p>

									<p class="date">2023.10.08 ~ 2023.10.09</p>
							</a></li>




							<li><a href="https://www.megabox.co.kr/event#"
								data-no="14143" data-netfunnel="N" class="eventBtn"
								title="&lt;화란&gt; 개봉 전 무대인사 상세보기"> <!--<p class="img"><img src="../../../static/pc/images/event/@img-event-list-megabox.jpg" alt="" /></p>-->
									<p class="img">
										<img src="./event_files/cAoFV23xmxFgl0CISYbhCiKdG1UZYvRy.jpg"
											alt="&lt;화란&gt; 개봉 전 무대인사" onerror="noImg(this);">
									</p>

									<p class="tit">&lt;화란&gt; 개봉 전 무대인사</p>

									<p class="date">2023.10.07 ~ 2023.10.09</p>
							</a></li>




							<li><a href="https://www.megabox.co.kr/event#"
								data-no="14121" data-netfunnel="N" class="eventBtn"
								title="&lt;1947 보스톤&gt; 2주차 무대인사 상세보기"> <!--<p class="img"><img src="../../../static/pc/images/event/@img-event-list-megabox.jpg" alt="" /></p>-->
									<p class="img">
										<img src="./event_files/41E5dJ9xqfjWkt6dD55t0iPXqpTvgNLW.jpg"
											alt="&lt;1947 보스톤&gt; 2주차 무대인사" onerror="noImg(this);">
									</p>

									<p class="tit">&lt;1947 보스톤&gt; 2주차 무대인사</p>

									<p class="date">2023.10.07 ~ 2023.10.08</p>
							</a></li>
						</ul>
					</div>
				</div>

			</div>



		</div>
	</div>
	<!--// container -->


	<jsp:include page="/WEB-INF/views/footer.jsp" />
</body>
</html>