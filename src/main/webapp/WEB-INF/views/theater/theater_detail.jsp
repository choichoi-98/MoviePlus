<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script
	src="${pageContext.request.contextPath}/resources/js/jquery-3.7.0.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/theater.js"></script>
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

	<div id="contents" class="no-padding">

		<!-- theater-detail-page -->
		<div class="theater-detail-page">

			<div class="bg-img" style=""></div>
			<div class="bg-pattern"></div>
			<div class="bg-mask"></div>

			<!-- theater-all -->
			<div class="theater-all">
				<!-- theater-area-list -->
				<div class="theater-area-list">
					<ul class="area-depth1">

						<c:forEach var="location" items="${locationList}">
							<li class=""><a href="#" class="depth1" title="${location.value} 선택">${location.value}</a>
								<div class="area-depth2">
									<ul>
										<c:forEach var="theater" items="${theaterList}">
											<c:if test="${location.value eq theater.THEATER_LOCATION }">
												<li class=""><a href="detail?theaterId=${theater.THEATER_ID}" title="${theater.THEATER_NAME} 상세보기">${theater.THEATER_NAME}</a></li>
											</c:if>
										</c:forEach>
										
									</ul>
								</div>
							</li>
						</c:forEach>


					</ul>
				</div>
				<!--// theater-area-list -->

				<p class="name">강남</p>

				<div class="btn-util right">

					<div class="block">
						<button type="button" class="btn btn-like " id="favorBrch">
							<i class="iconset ico-like-line"></i> <span>선호극장</span>
							<!-- 로그인 전이라면 로그인 모달창 띄우기 -->





						</button>
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

			<div id="theater-detail-tab-div" class="tab-cont-wrap">
				<div id="tab01" class="tab-cont on">




					<div class="theater-info-text mt40">
						<p class="big">
							간단 소개(큰 글)
						</p>
						<p>간단 소개(작은 글)</p>
					</div>



					<h2 class="tit small mt70">시설안내</h2>



					<h3 class="tit small">보유시설</h3>

					<div class="theater-facility">
						<p>
							<i class="iconset ico-facility-theater"></i>일반상영관
						</p>
						<p>
							<i class="iconset ico-facility-disabled"></i>장애인석
						</p>
					</div>

					<h2 class="tit small mt70">위치안내</h2>

					<h3 class="tit small">지도</h3>
				
				<!-- 지도 api 적용 -->	
				<div id="map" style="width: 500px; height: 400px;"></div>
				<script type="text/javascript"
						src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c5acfe6dd339afa29efececd8efe0373"></script>
						
				<script>
					
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				    mapOption = { 
				    center: new kakao.maps.LatLng(37.57296, 126.9922), // 지도의 중심좌표
				    level: 3 // 지도의 확대 레벨
				    };

				var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

				var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_red.png', // 마커이미지의 주소입니다    
				    imageSize = new kakao.maps.Size(64, 69), // 마커이미지의 크기입니다
				    imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
				      
				// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
				var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
				    markerPosition = new kakao.maps.LatLng(37.57296, 126.9922); // 마커가 표시될 위치입니다

				// 마커를 생성합니다
				var marker = new kakao.maps.Marker({
				    position: markerPosition, 
				    image: markerImage // 마커이미지 설정 
				});

				// 마커가 지도 위에 표시되도록 설정합니다
				marker.setMap(map);  
					</script>

					<ul class="dot-list">
						<li><span class="font-gblue">도로명주소 : </span> 서울특별시 서초구 서초대로
							77길 3 (서초동) 아라타워 8층</li>

					</ul>

					<div class="location-map-btn mt15">
						<div class="btn-group left">
							<a href="#" class="button purple" target="_blank" title="새창열림">실시간
								길찾기</a>
						</div>
					</div>
					

					<h3 class="tit small mt30">주차 안내</h3>

					<div class="parking-info">
						<div class="parking-section">
							<div class="icon-box">
								<i class="iconset ico-parking" title="주차안내">주차안내</i>
							</div>

							<div class="info">
								<p class="tit">주차요금</p>

								<ul class="dot-list">

									<li>주차 요금은 입차시간을 기준으로 합니다.</li>

									<li>영화 관람 시 3시간 → 3,000원(3시간 초과 시 10분당 1,000원 부과, 초과비용 출차
										시 정산)</li>

									<li>건물 내 타 매장과 주차 할인 중복 적용 불가.</li>

									<li>입차시 최대 3시간 30분까지 할인 가능(차량 1대에 주차 할인 적용 2회 이상 불가)</li>

									<li>주차 공간이 협소하므로 가급적이면 대중교통을 이용 바랍니다. (지하철 2호선 강남역 출구 9번
										출구)</li>

								</ul>
							</div>
						</div>

					</div>



					<h2 class="tit small mt70">이벤트</h2>

					<div class="event-box">
						<ul>

							<li>
								<div style="width:535px; height:250px; background:gray;"></div>
							</li>

						</ul>
					</div>


					<div id="brchNoti">
						<h2 class="tit small mt70">공지사항</h2>

						<!-- accordion-list -->
						<div class="accordion-list">
							<ul>
								<li><div class="title ">
										<a href="#" title="[강남] 8/9 영화관 상영재개 및 극장방문시 진입로 안내">
											<div class="cont-tit">[강남] 8/9 영화관 상영재개 및 극장방문시 진입로 안내</div>
											<p class="cont-admin">강남</p>
											<p class="cont-date">2022.08.09</p>
										</a>
									</div>
									<div class="content" style="display: none">
										안녕하세요.<br> 메가박스 강남지점입니다.&nbsp;<br> <br> 전일 정전으로
										인한 복구작업이 완료되어<br> 8월 9일(화) 11시부터&nbsp;극장 재운영 일정이 확정되어
										안내드립니다.<br> <br> 현재 건물 내 일부 E/V 고장으로 영화관 방문시 에스컬레이터
										이용부탁드립니다.<br> 차량방문으로 주차장에서 극장 이동시에는<br> 별도 안내된 엘리베이터
										1대로 이용가능합니다.<br> <br> 중단기간동안 이용에 불편을 드리게 된 점 다시 한 번
										진심으로 사과드립니다.<br> 기다려 주신 고객님들께 고개 숙여 감사드리며,&nbsp;<br>
										즐거운 영화관람 되실 수 있도록 더욱 노력하겠습니다.<br> <br> 감사합니다.&nbsp;
									</div></li>
								<li><div class="title ">
										<a href="#" title="[강남] 8/8 정전으로 인한 상영중단 및 취소 안내">
											<div class="cont-tit">[강남] 8/8 정전으로 인한 상영중단 및 취소 안내</div>
											<p class="cont-admin">강남</p>
											<p class="cont-date">2022.08.08</p>
										</a>
									</div>
									<div class="content" style="display: none">
										안녕하세요.<br> 메가박스 강남지점입니다.<br> &nbsp;<br> 2022년
										8월 8일 급작스러운 폭우로 인하여 강남지역 일대 정전으로 영화상영이 중단되었습니다.<br>
										익일(8/9) 1회차 영화까지 불가피하게 운영이 불가하오니 참고부탁드리며,<br> 빠른 복구작업을 통해
										고객님들 불편을 최소화하겠습니다.<br> 일정 변동 사항이 있을 경우 별도 홈페이지 공지를 통해
										안내드릴 수 있도록 하겠습니다.<br> <br> 즐거운 마음으로 저희 강남지점을 예매해
										주셨으나,<br> 부득이한 사유로 인하여 영화관람을 하시지 못하게 되어 불편을 끼쳐 드린 점 사과
										말씀드립니다.<br> <br> 금일 상영 중단된 상영관 및 이후 예매하신 예매 티켓을
										일괄적으로 취소 진행하였습니다.<br> 익일 2~7관 1회차 예매 티켓 또한 일괄적으로 취소
										진행하였습니다.&nbsp;<br> <br> 현장에서 현금&amp;상품권 결제하신 고객님의 경우<br>
										메가박스 홈페이지 지점 1:1 문의글을 통해 문의주시면 관련 안내 드릴 수 있도록 하겠습니다.<br>
										_______________________________________________________________________________________________________________<br>
										&nbsp;&nbsp;&nbsp;&nbsp;- 인터넷(모바일)예매 고객 : 일괄 취소<br>
										&nbsp;&nbsp;&nbsp;&nbsp;- 극장 內 카드 발권 고객 : 익일 일괄 취소<br>
										&nbsp;&nbsp;&nbsp;&nbsp;- 극장 內 현금 발권 고객 : 메가박스 고객센터 1:1 지점문의로
										접수<br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&gt; 티켓
										미 소지 고객은 현장에서 발권 내역확인 후 안내진행<br>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;※ 현금 환불기간 :
										~22.08.31<br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;※
										현장 매표소 티켓구매, 예매정보 불일치 고객의 경우 1:1 문의글을 통해 문의<br>
										______________________________________________________________________________________________________________<br>
										<br> 추후 문의사항은 홈페이지 &amp; 어플 내 1:1문의를 통해<br> 문의주시면
										자세한 안내 도와드리겠습니다.<br> <br> 영화관람에 불편을 드려 다시 한번 더
										사과말씀드립니다.<br> 더 나은 서비스로 보답해 드리는 강남지점이 되겠습니다.<br>
										감사합니다.
									</div></li>

								<li><div class="title ">
										<a href="#" title="[강남] 7월 9일 긴급점검으로 인한 운영중단 및  취소 안내 ">
											<div class="cont-tit">[강남] 7월 9일 긴급점검으로 인한 운영중단 및 취소 안내
											</div>
											<p class="cont-admin">강남</p>
											<p class="cont-date">2022.07.09</p>
										</a>
									</div>
									<div class="content" style="display: none">
										안녕하세요.<br> 메가박스 강남지점입니다.<br> &nbsp;<br> 2022년
										07월 9일 건물내 이슈로 인한 긴급점검으로 금일 저녁 상영이 중단되었으며,<br> 7/11(월) 까지
										불가피하게 운영이 불가하오니 참고부탁드리며,<br> 빠른 점검완료를 통해 고객님들 불편을
										최소화하겠습니다.<br> 일정 변동 사항이 있을 경우 별도 홈페이지 공지를 통해 안내드릴 수 있도록
										하겠습니다.<br> <br> 즐거운 마음으로 저희 강남지점을 예매해 주셨으나,<br>
										부득이한 사유로 인하여 영화관람을 하시지 못하게 되어 불편을 끼쳐 드린 점 사과 말씀드립니다.<br>
										<br> 금일 저녁 및 7/10~7/11일자의 예매하신 영화티켓은 익일 중으로 일괄적으로
										취소예정입니다.<br> 현장에서 현금&amp;상품권 결제하신 고객님의 경우<br> 메가박스
										홈페이지 지점 1:1 문의글을 통해 문의주시면 관련 안내 드릴 수 있도록 하겠습니다.<br>
										________________________________________________________________________________________________________________<br>
										&nbsp;&nbsp;&nbsp;&nbsp;- 인터넷(모바일)예매 고객 : 익일 일괄 취소 예정<br>
										&nbsp;&nbsp;&nbsp;&nbsp;- 극장 內 카드 발권 고객 : 익일 일괄 취소 예정<br>
										&nbsp;&nbsp;&nbsp;&nbsp;- 극장 內 현금 발권 고객 : 메가박스 고객센터 1:1 지점문의로
										접수<br> &nbsp; &nbsp; &nbsp; &nbsp;&gt; 티켓 미 소지 고객은 현장에서
										발권 내역확인 후 안내진행<br>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;※ 현금 환불기간 :
										~22.08.10<br> &nbsp; &nbsp; &nbsp; &nbsp;※ 현장 매표소 티켓구매,
										예매정보 불일치 고객의 경우 1:1 문의글을 통해 문의<br>
										______________________________________________________________________________________________________________<br>
										<br> 추후 문의사항은 홈페이지 &amp; 어플 내 1:1문의를 통해<br> 문의주시면
										자세한 안내 도와드리겠습니다.<br> <br> 영화관람에 불편을 드려 다시 한번 더
										사과말씀드립니다.<br> 더 나은 서비스로 보답해 드리는 강남지점이 되겠습니다.<br>
										감사합니다.
									</div></li>
								<li><div class="title ">
										<a href="#" title="[강남] 영화 관람요금 변경 안내">
											<div class="cont-tit">[강남] 영화 관람요금 변경 안내</div>
											<p class="cont-admin">강남</p>
											<p class="cont-date">2022.04.27</p>
										</a>
									</div>
									<div class="content" style="display: none">
										안녕하세요,&nbsp;메가박스&nbsp;강남지점입니다.<br>
										아래와&nbsp;같이&nbsp;영화&nbsp;요금제가&nbsp;변경되오니,&nbsp;이용에&nbsp;참고&nbsp;부탁&nbsp;드립니다.<br>
										<br>
										1.&nbsp;적용&nbsp;일시&nbsp;:&nbsp;2022년&nbsp;5월&nbsp;2일(월)&nbsp;상영작부터<br>
										2.&nbsp;주요&nbsp;사항&nbsp;:&nbsp;심야요금제&nbsp;폐지&nbsp;<br> <br>
										자세한&nbsp;요금&nbsp;안내는&nbsp;5월&nbsp;2일&nbsp;월요일&nbsp;이후&nbsp;지점&nbsp;안내&nbsp;페이지를&nbsp;<br>
										확인해주시기&nbsp;바랍니다.<br>
										※&nbsp;확인&nbsp;방법&nbsp;:&nbsp;홈페이지&nbsp;&gt;&nbsp;극장&nbsp;&gt;&nbsp;지점&nbsp;&gt;&nbsp;관람료<br>
										<br> 감사합니다.
									</div></li>
								<li><div class="title ">
										<a href="#" title="[강남] 운영시간 임시 조정 안내">
											<div class="cont-tit">[강남] 운영시간 임시 조정 안내</div>
											<p class="cont-admin">강남</p>
											<p class="cont-date">2020.04.03</p>
										</a>
									</div>
									<div class="content" style="display: none">
										안녕하세요.<br> 메가박스 강남지점입니다.<br> 코로나19 확산 예방에 동참하고자
										운영시간이 임시 조정되오니<br> 홈페이지나 어플 상영시간표를 참고하시어 영화관 이용 부탁드립니다.<br>
										<br> - 운영시간 조정 적용일 : 2020년 4월 1일(수) ~<br> &nbsp;(매표,
										매점 운영시간 : 13시 30분 ~ 20시 30분)<br> <br> 지속적인 방역과 소독관리를
										통해 안전한 관람 환경 조성에 최선을 다하겠습니다.<br> 감사합니다.
									</div></li>
							</ul>
						</div>
						<!--// accordion-list -->

						<!-- pagination -->
						<nav class="pagination">
							<strong class="active">1</strong> <a title="2페이지보기"
								href="javascript:void(0)" pagenum="2">2</a> <a title="3페이지보기"
								href="javascript:void(0)" pagenum="3">3</a> <a title="4페이지보기"
								href="javascript:void(0)" pagenum="4">4</a> <a title="5페이지보기"
								href="javascript:void(0)" pagenum="5">5</a> <a title="6페이지보기"
								href="javascript:void(0)" pagenum="6">6</a>
						</nav>
						<!--// pagination -->
					</div>







				</div>

				<div id="tab02" class="tab-cont">
					<a href="#" class="ir">상영시간표 탭 화면 입니다.</a>
					<h2 class="tit small" style="">무대인사</h2>
					<div class="movie-greeting">
						<ul>
							<li>
								<div class="theater-movie-tit">
									<p class="movie-grade age-12"></p>
									<p>30일</p>
								</div>

								<p class="greeting-date">2023.10.02</p>
								<div class="greeting-infomation" brch-no="1372"
									play-schdl-no="2310021372001" rpst-movie-no="23069600"
									theab-no="01" play-de="20231002" play-seq="1"
									netfnl-adopt-at="Y">
									<p class="greeting-location">1관</p>
									<p class="greeting-time">14:40~16:49</p>
									<p class="greeting-moment">상영후</p>
									<p class="greeting-person">강하늘, 정소민, 남대중 감독</p>
									<p class="btn">
										<a href="#" class="button purple" title="바로예매">바로예매</a>
									</p>
								</div>

								<div class="greeting-infomation" brch-no="1372"
									play-schdl-no="2310021372002" rpst-movie-no="23069600"
									theab-no="03" play-de="20231002" play-seq="1"
									netfnl-adopt-at="Y">
									<p class="greeting-location">3관</p>
									<p class="greeting-time">14:50~16:59</p>
									<p class="greeting-moment">상영후</p>
									<p class="greeting-person">강하늘, 정소민, 남대중 감독</p>
									<p class="btn">
										<a href="https://www.megabox.co.kr/theater?brchNo=1372"
											class="button purple" title="바로예매">바로예매</a>
									</p>
								</div>
								<div class="greeting-infomation" brch-no="1372"
									play-schdl-no="2310021372003" rpst-movie-no="23069600"
									theab-no="01" play-de="20231002" play-seq="2"
									netfnl-adopt-at="Y">
									<p class="greeting-location">1관</p>
									<p class="greeting-time">17:10~19:09</p>
									<p class="greeting-moment">상영전</p>
									<p class="greeting-person">강하늘, 정소민, 남대중 감독</p>
									<p class="btn">
										<a href="https://www.megabox.co.kr/theater?brchNo=1372"
											class="button purple" title="바로예매">바로예매</a>
									</p>
								</div>
							</li>
						</ul>
						<ul>

						</ul>
						<div class="btn-more" style="display: none;">
							<button type="button" class="btn">
								<span>닫기</span> <i class="iconset ico-btn-more-arr"></i>
							</button>
						</div>
					</div>

					<h2 class="tit small mt40">상영시간표</h2>
					<div class="time-schedule mb30">
						<div class="wrap">
							<button type="button" title="이전 날짜 보기" class="btn-pre"
								disabled="true">
								<i class="iconset ico-cld-pre"></i> <em>이전</em>
							</button>

							<div class="date-list">
								<div class="year-area">
									<div class="year" style="left: 30px; z-index: 1; opacity: 1;">2023.09</div>
									<div class="year" style="left: -40px; z-index: 1; opacity: 1;">2023.10</div>
								</div>

								<div class="date-area">
									<div class="wrap"
										style="position: relative; width: 2100px; border: none; left: -70px;">

										<button class="disabled" type="button" date-data="2023.09.19"
											month="8" tabindex="-1">
											<span class="ir">상영시간표 탭 화면 입니다.</span> <em
												style="pointer-events: none;">19<span
												style="pointer-events: none;" class="ir">상영시간표 탭 화면
													입니다.</span>
											</em> <span class="day-kr"
												style="pointer-events: none; display: inline-block">화</span>
											<span class="day-en"
												style="pointer-events: none; display: none">Tue</span>
										</button>

										<button class="on" type="button" date-data="2023.09.20"
											month="8">
											<span class="ir">상영시간표 탭 화면 입니다.</span> <em
												style="pointer-events: none;">20<span
												style="pointer-events: none;" class="ir">상영시간표 탭 화면
													입니다.</span>
											</em> <span class="day-kr"
												style="pointer-events: none; display: inline-block">오늘</span>
											<span class="day-en"
												style="pointer-events: none; display: none">Wed</span>
										</button>

										<button class="" type="button" date-data="2023.09.21"
											month="8">
											<span class="ir">상영시간표 탭 화면 입니다.</span> <em
												style="pointer-events: none;">21<span
												style="pointer-events: none;" class="ir">상영시간표 탭 화면
													입니다.</span>
											</em> <span class="day-kr"
												style="pointer-events: none; display: inline-block">내일</span>
											<span class="day-en"
												style="pointer-events: none; display: none">Thu</span>
										</button>

										<button class="" type="button" date-data="2023.09.22"
											month="8">
											<span class="ir">상영시간표 탭 화면 입니다.</span> <em
												style="pointer-events: none;">22<span
												style="pointer-events: none;" class="ir">상영시간표 탭 화면
													입니다.</span></em> <span class="day-kr"
												style="pointer-events: none; display: inline-block">금</span>
											<span class="day-en"
												style="pointer-events: none; display: none">Fri</span>
										</button>

										<button class="sat" type="button" date-data="2023.09.23"
											month="8">
											<span class="ir">상영시간표 탭 화면 입니다.</span> <em
												style="pointer-events: none;">23<span
												style="pointer-events: none;" class="ir">상영시간표 탭 화면
													입니다.</span></em> <span class="day-kr"
												style="pointer-events: none; display: inline-block">토</span>
											<span class="day-en"
												style="pointer-events: none; display: none">Sat</span>
										</button>

										<button class="holi" type="button" date-data="2023.09.24"
											month="8">
											<span class="ir">상영시간표 탭 화면 입니다.</span> <em
												style="pointer-events: none;">24<span
												style="pointer-events: none;" class="ir">상영시간표 탭 화면
													입니다.</span></em> <span class="day-kr"
												style="pointer-events: none; display: inline-block">일</span>
											<span class="day-en"
												style="pointer-events: none; display: none">Sun</span>
										</button>

										<button class="" type="button" date-data="2023.09.25"
											month="8">
											<span class="ir">상영시간표 탭 화면 입니다.</span> <em
												style="pointer-events: none;">25<span
												style="pointer-events: none;" class="ir">상영시간표 탭 화면
													입니다.</span></em> <span class="day-kr"
												style="pointer-events: none; display: inline-block">월</span>
											<span class="day-en"
												style="pointer-events: none; display: none">Mon</span>
										</button>

										<button class="" type="button" date-data="2023.09.26"
											month="8">
											<span class="ir">상영시간표 탭 화면 입니다.</span> <em
												style="pointer-events: none;">26<span
												style="pointer-events: none;" class="ir">상영시간표 탭 화면
													입니다.</span></em> <span class="day-kr"
												style="pointer-events: none; display: inline-block">화</span>
											<span class="day-en"
												style="pointer-events: none; display: none">Tue</span>
										</button>

										<button class="" type="button" date-data="2023.09.27"
											month="8">
											<span class="ir">상영시간표 탭 화면 입니다.</span> <em
												style="pointer-events: none;">27<span
												style="pointer-events: none;" class="ir">상영시간표 탭 화면
													입니다.</span></em> <span class="day-kr"
												style="pointer-events: none; display: inline-block">수</span>
											<span class="day-en"
												style="pointer-events: none; display: none">Wed</span>
										</button>

										<button class="disabled" type="button" date-data="2023.09.28"
											month="8">
											<span class="ir">상영시간표 탭 화면 입니다.</span> <em
												style="pointer-events: none;">28<span
												style="pointer-events: none;" class="ir">상영시간표 탭 화면
													입니다.</span></em> <span class="day-kr"
												style="pointer-events: none; display: inline-block">목</span>
											<span class="day-en"
												style="pointer-events: none; display: none">Thu</span>
										</button>

										<button class="disabled" type="button" date-data="2023.09.29"
											month="8">
											<span class="ir">상영시간표 탭 화면 입니다.</span> <em
												style="pointer-events: none;">29<span
												style="pointer-events: none;" class="ir">상영시간표 탭 화면
													입니다.</span></em> <span class="day-kr"
												style="pointer-events: none; display: inline-block">금</span>
											<span class="day-en"
												style="pointer-events: none; display: none">Fri</span>
										</button>

										<button class="disabled sat" type="button"
											date-data="2023.09.30" month="8">
											<span class="ir">상영시간표 탭 화면 입니다.</span> <em
												style="pointer-events: none;">30<span
												style="pointer-events: none;" class="ir">상영시간표 탭 화면
													입니다.</span></em> <span class="day-kr"
												style="pointer-events: none; display: inline-block">토</span>
											<span class="day-en"
												style="pointer-events: none; display: none">Sat</span>
										</button>

										<button class="disabled holi" type="button"
											date-data="2023.10.01" month="9">
											<span class="ir">상영시간표 탭 화면 입니다.</span> <em
												style="pointer-events: none;">1<span
												style="pointer-events: none;" class="ir">상영시간표 탭 화면
													입니다.</span></em> <span class="day-kr"
												style="pointer-events: none; display: inline-block">일</span>
											<span class="day-en"
												style="pointer-events: none; display: none">Sun</span>
										</button>

										<button class="" type="button" date-data="2023.10.02"
											month="9">
											<span class="ir">상영시간표 탭 화면 입니다.</span> <em
												style="pointer-events: none;">2<span
												style="pointer-events: none;" class="ir">상영시간표 탭 화면
													입니다.</span></em> <span class="day-kr"
												style="pointer-events: none; display: inline-block">월</span>
											<span class="day-en"
												style="pointer-events: none; display: none">Mon</span>
										</button>

										<button class="disabled" type="button" date-data="2023.10.03"
											month="9">
											<span class="ir">상영시간표 탭 화면 입니다.</span> <em
												style="pointer-events: none;">3<span
												style="pointer-events: none;" class="ir">상영시간표 탭 화면
													입니다.</span></em> <span class="day-kr"
												style="pointer-events: none; display: inline-block">화</span>
											<span class="day-en"
												style="pointer-events: none; display: none">Tue</span>
										</button>

										<button class="disabled" type="button" date-data="2023.10.04"
											month="9" tabindex="-1">
											<span class="ir">상영시간표 탭 화면 입니다.</span> <em
												style="pointer-events: none;">4<span
												style="pointer-events: none;" class="ir">상영시간표 탭 화면
													입니다.</span></em> <span class="day-kr"
												style="pointer-events: none; display: inline-block">수</span>
											<span class="day-en"
												style="pointer-events: none; display: none">Wed</span>
										</button>
									</div>
								</div>
							</div>

							<button type="button" title="다음 날짜 보기" class="btn-next"
								disabled="true">
								<i class="iconset ico-cld-next"></i> <em>다음</em>
							</button>

							<div class="bg-line">
								<input type="hidden" name="datePicker" id="dp1695203252089"
									class="hasDatepicker" value="2023.09.20">
								<button type="button" class="btn-calendar-large" title="달력보기">
									달력보기</button>
							</div>
						</div>
					</div>

					<div class="movie-option mb20">
						<div class="option">
							<ul>
								<li><i class="iconset ico-stage" title="무대인사"></i>무대인사</li>
								<li><i class="iconset ico-user" title="회원시사"></i>회원시사</li>
								<li><i class="iconset ico-open" title="오픈시사"></i>오픈시사</li>
								<li><i class="iconset ico-goods" title="굿즈패키지"></i>굿즈패키지</li>
								<li><i class="iconset ico-singalong" title="싱어롱"></i>싱어롱</li>
								<li><i class="iconset ico-gv" title="GV"></i>GV</li>
								<li><i class="iconset ico-sun" title="조조"></i>조조</li>
								<li><i class="iconset ico-brunch" title="브런치"></i>브런치</li>
								<li><i class="iconset ico-moon" title="심야"></i>심야</li>
							</ul>
						</div>
						<div class="rateing-lavel">
							<a href="https://www.megabox.co.kr/theater?brchNo=1372" class=""
								title="관람등급안내">관람등급안내</a>
						</div>
					</div>
					<div class="reserve theater-list-box">
						<div class="tab-block tab-layer mb30" style="display: none;">
							<ul>

							</ul>
						</div>
						<div class="theater-list">
							<div class="theater-tit">
								<p class="movie-grade age-12"></p>
								<p>
									<a
										href="https://www.megabox.co.kr/movie-detail?rpstMovieNo=23059800"
										title="그란 투리스모 상세보기">그란 투리스모</a>
								</p>
								<p class="infomation">
									<span>상영중</span>/상영시간 134분
								</p>
							</div>
							<div class="theater-type-box">
								<div class="theater-type">
									<p class="theater-name">1관</p>
									<p class="chair">총 232석</p>
								</div>
								<div class="theater-time">
									<div class="theater-type-area">2D(자막)</div>
									<div class="theater-time-box">
										<table class="time-list-table">
											<caption>상영시간을 보여주는 표 입니다.</caption>
											<colgroup>
												<col style="width: 99px;">
												<col style="width: 99px;">
												<col style="width: 99px;">
												<col style="width: 99px;">
												<col style="width: 99px;">
												<col style="width: 99px;">
												<col style="width: 99px;">
												<col style="width: 99px;">
											</colgroup>
											<tbody>
												<tr>
													<td class="" brch-no="1372" play-schdl-no="2309201372054"
														rpst-movie-no="23059800" theab-no="01" play-de="20230920"
														play-seq="5" netfnl-adopt-at="N">
														<div class="td-ab">
															<div class="txt-center">
																<a href="https://www.megabox.co.kr/theater?brchNo=1372"
																	title="영화예매하기">
																	<div class="ico-box">
																		<i class="iconset ico-off"></i>
																	</div>
																	<p class="time">21:00</p>
																	<p class="chair">229석</p>
																	<div class="play-time">
																		<p>21:00~23:24</p>
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
							<div class="theater-type-box">
								<div class="theater-type">
									<p class="theater-name">7관</p>
									<p class="chair">총 104석</p>
								</div>
								<div class="theater-time">
									<div class="theater-type-area">2D(자막)</div>
									<div class="theater-time-box">
										<table class="time-list-table">
											<caption>상영시간을 보여주는 표 입니다.</caption>
											<colgroup>
												<col style="width: 99px;">
												<col style="width: 99px;">
												<col style="width: 99px;">
												<col style="width: 99px;">
												<col style="width: 99px;">
												<col style="width: 99px;">
												<col style="width: 99px;">
												<col style="width: 99px;">
											</colgroup>
											<tbody>
												<tr>
													<td class="" brch-no="1372" play-schdl-no="2309201372090"
														rpst-movie-no="23059800" theab-no="07" play-de="20230920"
														play-seq="5" netfnl-adopt-at="N">
														<div class="td-ab">
															<div class="txt-center">
																<a href="https://www.megabox.co.kr/theater?brchNo=1372"
																	title="영화예매하기">
																	<div class="ico-box">
																		<i class="iconset ico-off"></i>
																	</div>
																	<p class="time">20:00</p>
																	<p class="chair">97석</p>
																	<div class="play-time">
																		<p>20:00~22:24</p>
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

						<div class="theater-list">
							<div class="theater-tit">
								<p class="movie-grade age-15"></p>
								<p>
									<a
										href="https://www.megabox.co.kr/movie-detail?rpstMovieNo=23055700"
										title="잠 상세보기">잠</a>
								</p>
								<p class="infomation">
									<span>상영중</span>/상영시간 94분
								</p>
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
											<colgroup>
												<col style="width: 99px;">
												<col style="width: 99px;">
												<col style="width: 99px;">
												<col style="width: 99px;">
												<col style="width: 99px;">
												<col style="width: 99px;">
												<col style="width: 99px;">
												<col style="width: 99px;">
											</colgroup>
											<tbody>
												<tr>
													<td class="" brch-no="1372" play-schdl-no="2309201372046"
														rpst-movie-no="23055700" theab-no="02" play-de="20230920"
														play-seq="6" netfnl-adopt-at="N">
														<div class="td-ab">
															<div class="txt-center">
																<a href="https://www.megabox.co.kr/theater?brchNo=1372"
																	title="영화예매하기">
																	<div class="ico-box">
																		<i class="iconset ico-off"></i>
																	</div>
																	<p class="time">20:30</p>
																	<p class="chair">81석</p>
																	<div class="play-time">
																		<p>20:30~22:14</p>
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
							<div class="theater-tit">
								<p class="movie-grade age-12"></p>
								<p>
									<a
										href="https://www.megabox.co.kr/movie-detail?rpstMovieNo=23036200"
										title="베니스 유령 살인사건 상세보기">베니스 유령 살인사건</a>
								</p>
								<p class="infomation">
									<span>상영중</span>/상영시간 103분
								</p>
							</div>
							<div class="theater-type-box">
								<div class="theater-type">
									<p class="theater-name">4관</p>
									<p class="chair">총 103석</p>
								</div>
								<div class="theater-time">
									<div class="theater-type-area">2D(자막)</div>
									<div class="theater-time-box">
										<table class="time-list-table">
											<caption>상영시간을 보여주는 표 입니다.</caption>
											<colgroup>
												<col style="width: 99px;">
												<col style="width: 99px;">
												<col style="width: 99px;">
												<col style="width: 99px;">
												<col style="width: 99px;">
												<col style="width: 99px;">
												<col style="width: 99px;">
												<col style="width: 99px;">
											</colgroup>
											<tbody>
												<tr>
													<td class="" brch-no="1372" play-schdl-no="2309201372085"
														rpst-movie-no="23036200" theab-no="04" play-de="20230920"
														play-seq="5" netfnl-adopt-at="N">
														<div class="td-ab">
															<div class="txt-center">
																<a href="https://www.megabox.co.kr/theater?brchNo=1372"
																	title="영화예매하기">
																	<div class="ico-box">
																		<i class="iconset ico-off"></i>
																	</div>
																	<p class="time">19:00</p>
																	<p class="chair">84석</p>
																	<div class="play-time">
																		<p>19:00~20:53</p>
																		<p>5회차</p>
																	</div>
																</a>
															</div>
														</div>
													</td>
													<td class="" brch-no="1372" play-schdl-no="2309201372086"
														rpst-movie-no="23036200" theab-no="04" play-de="20230920"
														play-seq="6" netfnl-adopt-at="N">
														<div class="td-ab">
															<div class="txt-center">
																<a href="https://www.megabox.co.kr/theater?brchNo=1372"
																	title="영화예매하기">
																	<div class="ico-box">
																		<i class="iconset ico-off"></i>
																	</div>
																	<p class="time">21:15</p>
																	<p class="chair">98석</p>
																	<div class="play-time">
																		<p>21:15~23:08</p>
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
							<div class="theater-tit">
								<p class="movie-grade age-15"></p>
								<p>
									<a
										href="https://www.megabox.co.kr/movie-detail?rpstMovieNo=23049000"
										title="오펜하이머 상세보기">오펜하이머</a>
								</p>
								<p class="infomation">
									<span>상영중</span>/상영시간 180분
								</p>
							</div>
							<div class="theater-type-box">
								<div class="theater-type">
									<p class="theater-name">3관</p>
									<p class="chair">총 232석</p>
								</div>
								<div class="theater-time">
									<div class="theater-type-area">2D(자막)</div>
									<div class="theater-time-box">
										<table class="time-list-table">
											<caption>상영시간을 보여주는 표 입니다.</caption>
											<colgroup>
												<col style="width: 99px;">
												<col style="width: 99px;">
												<col style="width: 99px;">
												<col style="width: 99px;">
												<col style="width: 99px;">
												<col style="width: 99px;">
												<col style="width: 99px;">
												<col style="width: 99px;">
											</colgroup>
											<tbody>
												<tr>
													<td class="" brch-no="1372" play-schdl-no="2309201372080"
														rpst-movie-no="23049000" theab-no="03" play-de="20230920"
														play-seq="4" netfnl-adopt-at="N">
														<div class="td-ab">
															<div class="txt-center">
																<a href="https://www.megabox.co.kr/theater?brchNo=1372"
																	title="영화예매하기">
																	<div class="ico-box">
																		<i class="iconset ico-off"></i>
																	</div>
																	<p class="time">20:10</p>
																	<p class="chair">226석</p>
																	<div class="play-time">
																		<p>20:10~23:20</p>
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
						</div>
						<div class="theater-list">
							<div class="theater-tit">
								<p class="movie-grade age-all"></p>
								<p>
									<a
										href="https://www.megabox.co.kr/movie-detail?rpstMovieNo=23047000"
										title="[워너필소] 구니스 상세보기">[워너필소] 구니스</a>
								</p>
								<p class="infomation">
									<span>상영중</span>/상영시간 114분
								</p>
							</div>
							<div class="theater-type-box">
								<div class="theater-type">
									<p class="theater-name">5관</p>
									<p class="chair">총 96석</p>
								</div>
								<div class="theater-time">
									<div class="theater-type-area">2D(자막)</div>
									<div class="theater-time-box">
										<table class="time-list-table">
											<caption>상영시간을 보여주는 표 입니다.</caption>
											<colgroup>
												<col style="width: 99px;">
												<col style="width: 99px;">
												<col style="width: 99px;">
												<col style="width: 99px;">
												<col style="width: 99px;">
												<col style="width: 99px;">
												<col style="width: 99px;">
												<col style="width: 99px;">
											</colgroup>
											<tbody>
												<tr>
													<td class="" brch-no="1372" play-schdl-no="2309201372049"
														rpst-movie-no="23047000" theab-no="05" play-de="20230920"
														play-seq="5" netfnl-adopt-at="N">
														<div class="td-ab">
															<div class="txt-center">
																<a href="https://www.megabox.co.kr/theater?brchNo=1372"
																	title="영화예매하기">
																	<div class="ico-box">
																		<i class="iconset ico-off"></i>
																	</div>
																	<p class="time">21:10</p>
																	<p class="chair">90석</p>
																	<div class="play-time">
																		<p>21:10~23:14</p>
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
						<div class="theater-list">
							<div class="theater-tit">
								<p class="movie-grade age-15"></p>
								<p>
									<a
										href="https://www.megabox.co.kr/movie-detail?rpstMovieNo=23047600"
										title="콘크리트 유토피아 상세보기">콘크리트 유토피아</a>
								</p>
								<p class="infomation">
									<span>상영중</span>/상영시간 130분
								</p>
							</div>
							<div class="theater-type-box">
								<div class="theater-type">
									<p class="theater-name">6관</p>
									<p class="chair">총 103석</p>
								</div>
								<div class="theater-time">
									<div class="theater-type-area">2D</div>
									<div class="theater-time-box">
										<table class="time-list-table">
											<caption>상영시간을 보여주는 표 입니다.</caption>
											<colgroup>
												<col style="width: 99px;">
												<col style="width: 99px;">
												<col style="width: 99px;">
												<col style="width: 99px;">
												<col style="width: 99px;">
												<col style="width: 99px;">
												<col style="width: 99px;">
												<col style="width: 99px;">
											</colgroup>
											<tbody>
												<tr>
													<td class="" brch-no="1372" play-schdl-no="2309201372095"
														rpst-movie-no="23047600" theab-no="06" play-de="20230920"
														play-seq="5" netfnl-adopt-at="N">
														<div class="td-ab">
															<div class="txt-center">
																<a href="https://www.megabox.co.kr/theater?brchNo=1372"
																	title="영화예매하기">
																	<div class="ico-box">
																		<i class="iconset ico-off"></i>
																	</div>
																	<p class="time">20:35</p>
																	<p class="chair">91석</p>
																	<div class="play-time">
																		<p>20:35~22:55</p>
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
											<th scope="col">요일</th>
											<th scope="col">상영시간</th>
											<th scope="col">일반</th>
											<th scope="col">청소년</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<th scope="rowgroup" rowspan="2">월~목</th>
											<td>조조 (06:00~)</td>
											<td>10,000</td>
											<td>8,000</td>
										</tr>
										<tr>
											<td>일반 (10:01~)</td>
											<td>14,000</td>
											<td>12,000</td>
										</tr>
										<tr>
											<th scope="rowgroup" rowspan="2">금~일<br>공휴일
											</th>
											<td>조조 (06:00~)</td>
											<td>11,000</td>
											<td>9,000</td>
										</tr>
										<tr>
											<td>일반 (10:01~)</td>
											<td>15,000</td>
											<td>13,000</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						
					</div>
					<span style="color: #503396"> <span style="font-size: 22px">요금제</span>
					</span> <br> <br> • <span style="color: #01738b">청소년 요금</span>&nbsp;
					만7세~ 만18세 : 초등학생~고등학생(학생증, 교복, 청소년증, 의료보험증, 주민등록 등/초본, 그 외 청소년 확인
					가능 서류)<br> • 48개월 미만의 경우 증빙원(예 : 의료보험증, 주민등록 초/등본 등) 지참 시에만 무료
					관람 가능<br> <br> <br> <span style="font-size: 22px"><span
						style="color: #503396">우대적용</span></span><br> <br> • <span
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