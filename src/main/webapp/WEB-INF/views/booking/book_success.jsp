<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="pinfo" />
</sec:authorize>
<!DOCTYPE html>
<!-- saved from url=(0046)https://www.megabox.co.kr/store?prdtClCd=CPC02 -->
<html>
<!--<![endif]-->
<head>
<title>MoviePlus: 모두를 위한 영화관</title>
<style>
.container {
	margin: 0; /* 마진을 0으로 설정 */
	padding: 0; /* 패딩을 0으로 설정 */
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.0.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/book_success.js"></script>
</head>
<body>
	<!-- header -->
	<jsp:include page="/WEB-INF/views/header.jsp" />
    <div class="body-wrap">
      
<!--  ko_KR -->
<!-- container -->
<div class="container">
	
		<div class="page-util">
			<div class="inner-wrap">
				<div class="location">
					<span>Home</span>
					<a href="https://www.megabox.co.kr/booking" title="예매 페이지로 이동">예매 <!-- 예매 --></a>
					<a class="no-link" title="예매완료">예매완료 <!-- 예매완료 --></a>
				</div>
			</div>
		</div>
	
	<!--// page-tit-area -->
	<c:if test="${pinfo.MEMBER_ID eq BookingList[0].MEMBER_ID or pinfo.MEMBER_ID=='admin'}">
	<!-- contents -->
	<div id="contents" class="">
		<!-- inner-wrap -->
		<div class="inner-wrap">
			<!-- quick-reserve -->
			<div class="quick-reserve">
				<h2 class="tit" style="color: black">예매완료 <!-- 예매완료 --></h2>
				<%-- <c:forEach var="b" items="${BookingList}" varStatus="loop"> --%>
				<!-- reserve-finish -->
				<div class="reserve-finish">
					<!-- reserve-ininfomation-box -->
					<div class="reserve-ininfomation-box">
						<div class="movie-poster-area">
							<p>
								티켓 예매코드 <!-- 티켓 예매번호 -->
								<span class="roboto">mplus${BookingList[0].KPAY_NUM}</span>
							</p>
							<img src="${fn:split(BookingList[0].MOVIE_POSTER, '|')[0]}"
								 alt="${BookingList[0].MOVIE_TITLE}" onerror="noImg(this);">
						</div>

						<!-- movie-infomation-area -->
						<div class="movie-infomation-area">
							<div class="movie-info-top">
								<p class="tit">
									<strong>예매가 완료되었습니다 <!-- 예매가 완료되었습니다 --><i>!</i></strong>
										<span class="righten"> <i class="iconset ico-circle-point"></i> 
										고객님의 상영익일 적립예정 포인트는 
										<em><fmt:formatNumber value="${BookingList[0].KPAY_AMOUNT/100}" type="number" pattern="###,###" />P
										</em>입니다. 
										</span>
								</p>
							</div>

							<div class="movie-info-middle">
								<ul class="dot-list gray">
									<li><span>예매영화 <!-- 예매영화 --></span> ${BookingList[0].MOVIE_TITLE}</li>
									<li><span>관람극장 <!-- 관람극장/상영관 --></span> ${BookingList[0].THEATER_NAME}</li>
									<%-- <li><span>상영관 </span> &nbsp;${BookingList[0].THEATER_ROOM_NAME}</li> --%>
									<li><span>관람일시 <!-- 관람일시 --></span> ${BookingList[0].THEATER_SCHEDULE_DATE} &nbsp; ${BookingList[0].THEATER_SCHEDULE_START}</li>
									<li><span>관람인원 <!-- 관람인원 --></span> 성인 ${BookingList[0].KPAY_SEAT_CNT}명</li>
									<li><span>좌석번호 <!-- 좌석번호 --></span> ${BookingList[0].KPAY_OCCUPIED_SEAT}</li>
									<li>
										<span>결제정보 <!-- 결제정보 --></span>
										<strong class="roboto" style="color: #fff">${BookingList[0].KPAY_AMOUNT}</strong> 원 <!-- 원 --><br>
										<em></em>
									</li>
								</ul>
							</div>

							<!-- movie-info-bottom -->
							
								<div class="movie-info-bottom">
									<div class="add-send">
										예매정보 추가 발송 <!-- 예매정보 추가 발송 -->
										<a href="" class="tooltip hover" title="입력하신 번호로 예매정보를 추가발송합니다.">
											<span><i class="iconset ico-question-white">&nbsp;</i></span>
											<div class="ir" id="tooltip01_01" data-width="220">
												입력하신 번호로 예매정보를 추가발송합니다. <!-- 입력하신 번호로 예매정보를 추가발송합니다. -->
											</div>
										</a>
										
										<input type="text" title="연락처 입력" class="input-text w150px ml10" maxlength="11" id="inp_sms_rcv_no">
										<button type="button" class="button" id="btn_re_send_sms">전송 <!-- 전송 --></button>
									</div>
								</div>
							<!--// movie-info-bottom -->
							<%-- </c:forEach> --%>
						</div>
						<!--// movie-infomation-area -->
					</div>
					<!--// reserve-ininfomation-box -->
				</div>
				<!--// reserve-finish -->

				<div class="btn-group pt30">
					<a href="" class="button large" w-data="600" h-data="600" id="btn_ticket_print" title="교환권출력" style="color: black">교환권출력 <!-- 교환권출력 --></a>
																				
							<a href="#" class="button large" id="btn_bill_print" title="영수증출력" style="display: none;">영수증출력 <!-- 영수증출력 --></a>
							<a href="success" class="button purple large" title="예매내역 페이지로 이동" style="background: #792828">예매내역 <!-- 예매내역 --></a>
				</div>
					<div class="box-border v1 mt10">
						<ul class="dot-list gray">
								<li>
									상영안내 <!-- 상영안내 -->
									<ul class="dash-list">
											<li>쾌적한 관람 환경을 위해 상영시간 이전에 입장 부탁드립니다.</li>
											<li>지연입장에 의한 관람불편을 최소화하고자 본 영화는 10분 후 시작됩니다.</li>
											<li>상영시간 20분전까지 취소 가능하며, 캡쳐화면으로는 입장하실 수 없습니다.</li>
									</ul>
								</li>
							
								<li class="mt20">
									주차안내 <!-- 주차안내 -->
									<ul class="dash-list">
											<li>매표소에 당일 영화 티켓 인증 후, 차량 번호 할인 등록. 3시간 -&gt; 3,000원 (지하 3층 정산소에서 결제)</li>
											<li>주차 공간이 협소하므로 가급적이면 대중교통을 이용 바랍니다.</li>
									</ul>
								</li>
						</ul>
					</div>
			</div>
			<!--// quick-reserve -->
		</div>
		<!--// inner-wrap -->
	</div>
	<!--// contents -->
	</c:if>
</div>
<!--// container -->
<!-- 		</div> -->
	<!--// container -->
	<jsp:include page="/WEB-INF/views/footer.jsp" />
</body>
</html>