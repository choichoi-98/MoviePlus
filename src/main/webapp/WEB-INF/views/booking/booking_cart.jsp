<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- saved from url=(0046)https://www.megabox.co.kr/store?prdtClCd=CPC02 -->
<html lang="ko">
<!--<![endif]-->
<head>
<style>
.container {
	margin: 0; /* 마진을 0으로 설정 */
	padding: 0; /* 패딩을 0으로 설정 */
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function() {
    var couponOpen = false; // 초기 상태는 닫혀있음
    $('#grp_coupon').click(function()  {
        if (couponOpen) {
            // 탑다운이 열려있으면 닫음
            $('#movieWonLi').removeClass('on');
            $('#mega_point').hide();
            couponOpen = false;
        } else {
            // 탑다운이 닫혀있으면 엶
            $('#movieWonLi').addClass('on');
            $('#mega_point').show();
            couponOpen = true;
        }
    });

    var ticketOpen = false; // 초기 상태는 닫혀있음
    $('#grp_ticket').click(function()  {
        if (ticketOpen) {
            // 탑다운이 열려있으면 닫음
            $('#movieWonLi2').removeClass('on');
            $('#mobile_coupon').hide();
            ticketOpen = false;
        } else {
            // 탑다운이 닫혀있으면 엶
            $('#movieWonLi2').addClass('on');
            $('#mobile_coupon').show();
            ticketOpen = true;
        }
    });
});
</script>

</head>
<body>
	<!-- header -->
	<jsp:include page="/WEB-INF/views/header.jsp" />

	<!-- container -->
	<div class="container" style="padding-bottom: 240px;">
		<div class="page-util" style="">
			<div class="inner-wrap">
				<div class="location">
					<span>Home</span> <a href="#"
						title="예매 페이지로 이동">예매</a> <a
						href="#" title="빠른예매 페이지로 이동">빠른예매</a>
				</div>
			</div>
		</div>

		<!-- <div style="overflow:hidden; display:block; height:630px;">-->
		<div id="bokdMPayBooking"
			style="overflow: hidden; height: 788px; display: block; width: 100%; height: 778px;">
			<div class="inner-wrap"
				style="padding-top: 40px; padding-bottom: 100px;">
				<!-- seat-select-section -->
				<div class="seat-select-section">
					<!-- seat-section -->
					<div class="seat-section h-auto">

						<div class="tit-util">
							<h3 class="tit small">
								관람권 및 할인적용
								<!-- 관람권 및 할인적용-->
							</h3>
							<div class="right">
								<button type="button" class="button gray-line small"
									id="btn_booking_init">
									<i class="iconset ico-reset-small"></i>초기화
									<!-- 초기화 -->
								</button>
							</div>
						</div>
						<!-- discout-setting -->
						<div class="discout-setting">
							<div class="discout-list">
								<ul>
									<li id="movieWonLi" class=""><a
										href="#"
										class="tit" id="grp_coupon" name="grp_mega_dc"
										title="메가박스 포인트/쿠폰"> 쿠폰/할인권
										<i class="iconset ico-btn-more-arr"></i>
									</a>
										<div id="mega_point" class="cont-down">
											<div class="coupon-box">
												<div class="item col-1">
													<a
														href="#"
														w-data="600" h-data="550" class="btn-modal-open"
														name="btn_pay_memp" id="btn_pay_memp" title="메가박스 멤버십 포인트">
														<span class="txt">메가박스 멤버십 포인트 <!-- 메가박스 멤버십 포인트 --></span>
													</a>
													<button type="button" class="btn-cancel"
														id="btn_cancel_memp" method="memp">
														취소
														<!-- 취소 -->
													</button>
												</div>
												<div class="item col-1">
													<a
														href="#"
														w-data="600" h-data="550" class="btn-modal-open"
														name="btn_pay_dcoupon" id="btn_pay_dcoupon"
														title="메가박스 할인쿠폰"> <span class="txt">메가박스 할인쿠폰
															<!-- 메가박스 할인쿠폰 -->
													</span> <em class="tooltip01 hidden" id="movieWonEm"></em>
													</a>
													<button type="button" class="btn-cancel"
														id="btn_cancel_dcoupon" method="dcoupon">
														취소
														<!-- 취소 -->
													</button>
												</div>
											</div>
										</div>
									</li>
									<li id="movieWonLi2" class=""> <!-- class="praddbox" -->
									<a  href="#"
										class="tit" id="grp_ticket" name="grp_mega_dc"
										title="관람권"> 관람권 
										<i class="iconset ico-btn-more-arr"></i>
									</a>
										<div id="mobile_coupon" class="cont-down">
											<div class="coupon-box">
												<div class="item col-1">
													<a href="#"
													   w-data="600" h-data="600" class="btn-modal-open"
													   name="btn_pay_mcoupon" id="btn_pay_mcoupon"
													   title="메가박스 관람권"> <span class="txt">메가박스 관람권 <!-- 메가박스 관람권 --></span>
													</a>

													<button type="button" class="btn-cancel"
														id="btn_cancel_mcoupon" method="mcoupon">
														취소
														<!-- 취소 -->
													</button>
												</div>
												<div class="item col-1">
													<a
														href="#"
														w-data="600" h-data="560" class="btn-modal-open"
														name="btn_pay_scoupon" id="btn_pay_scoupon" title="스토어교환권">
														<span class="txt">스토어교환권 <!-- 스토어교환권 --></span>
													</a>

													<button type="button" class="btn-cancel"
														id="btn_cancel_scoupon" method="scoupon">
														취소
														<!-- 취소 -->
													</button>
												</div>

												<div class="item col-1">
													<a
														href="#"
														w-data="600" h-data="550" class="btn-modal-open"
														name="btn_pay_mgfcard" id="btn_pay_mgfcard"
														title="모바일 관람권"> <span class="txt">모바일 관람권 <!-- 모바일 상품권 --></span>
													</a>

													<button type="button" class="btn-cancel"
														id="btn_cancel_mgfcard" method="mgfcard">
														취소
														<!-- 취소 -->
													</button>
												</div>
											</div>
										</div>
										<div class="pointtxt">기프티콘, 기프티쇼, 아이넘버, 도넛북, 스마트콘, 스마일콘,
											G마켓 예매권은 [모바일 관람권]에서 사용하실 수 있습니다.</div></li>
								</ul>
							</div>
						</div>

						<!--// discout-setting -->

						<div class="tit-util mt40">
							<h3 class="tit small">
								결제수단선택
								<!-- 결제수단선택 -->
							</h3>

							<div class="right">
								<input type="checkbox" id="same_use_payment"> <label
									for="same_use_payment" id="label_use_payment">다음에도 이
									결제수단 사용 <!-- 다음에도 이 결제수단 사용 -->
								</label>
							</div>
						</div>
						<!--
					체크 표시 on 클래스 추가

					<button type="button">

					<button type="button" class="on">
				-->
						<div class="select-payment ty2">
							<div class="radio-group">
								<span class="bg-chk small"> <input type="radio"
									name="radio_payment" id="rdo_pay_credit" value="credit">
									<label for="rdo_pay_credit">신용/체크카드</label>
								</span> <span class="bg-chk small"> <input type="radio"
									name="radio_payment" id="rdo_pay_mobile" value="mobile">
									<label for="rdo_pay_mobile">휴대폰 결제</label>
								</span> <span class="bg-chk small"> <input type="radio"
									name="radio_payment_easypay" id="rdo_pay_easypay"
									value="easypay"> <label for="rdo_pay_easypay">간편결제</label>
								</span> <span class="bg-chk small"> <input type="radio"
									name="radio_payment" id="rdo_pay_settlebank" value="settlebank">
									<label for="rdo_pay_settlebank">내통장결제</label>
								</span>

							</div>

							<div class="select-payment-card">
								<label for="card_select">결제 선택 <!-- 카드사 선택 --></label>
								<input type="radio" name="rdo_card_select" id="app_card"
									class="ml20" checked="" value="01"> 
									<label for="app_card" id="lab_app_card">카카오페이</label> 
									<input type="radio" name="rdo_card_select" id="general_card"
									class="ml20" value="00"> 
									<label for="general_card" id="lab_general_card">일반결제</label> 
									<input type="radio" name="rdo_card_select" id="sepecial_card"
									value="02" style="display: none;"> 
									<label for="sepecial_card" id="lab_sepecial_card"
									style="display: none;">포인트사용</label>
							</div>
						</div>
					</div>
					<!--// seat-section -->

					<!-- seat-result -->
					<div class="seat-result">
						<div class="wrap">
							<div class="tit-area type2">
							<!--
							관람 등급 표시
							<span class="movie-grade small age-all">전체 관람가</span>
							<span class="movie-grade small age-12">12세 이상 관람가</span>
							<span class="movie-grade small age-15">15세 이상 관람가</span>
							<span class="movie-grade small age-19">청소년 관람 불가</span>
							<span class="movie-grade small age-no">미정</span>
							-->
								<span class="movie-grade small age-${movie.grade_data}" id="admisClassNm"></span>

								<p class="tit" id="movieNm">${movie.movie_Title}</p>
								<p class="cate" id="playKindNm">${ts.THEATER_NAME}</p>
								<p class="theater" id="brchNm">${ts.THEATER_ROOM_NAME}</p>
								<p class="date">
									<span id="playDe">${ts.THEATER_SCHEDULE_DATE}</span><em id="dowNm"></em> <span
										class="time" id="playTime"><i
										class="iconset ico-clock-white"></i>${ts.THEATER_SCHEDULE_START}~${ts.THEATER_SCHEDULE_END}</span>
								</p>
							</div>
							<div class="price-process">
								<div class="box">
									<div class="data">
										<span class="tit">성인 <em>2</em></span><span class="price">${price}</span>
									</div>
									<!--
							<div class="data">
								<span class="tit">일반 <em>1</em></span>
								<span class="price">20,000</span>
							</div>

							<div class="data">
								<span class="tit">어린이 <em>2</em></span>
								<span class="price">6,000</span>
							</div>
							-->
									<div class="all">
										<span class="tit">금액 <!-- 금액 --></span> <span class="price"><em>${price}</em>
											<span>원 <!-- 원 --></span></span>
									</div>
								</div>

								<div class="box discout-box">

									<div class="all">
										<span class="tit">할인적용 <!-- 할인적용 --></span> <span
											class="price"><em>0</em> 원 <!-- 원 --></span>
									</div>
								</div>
							</div>

							<div class="pay-area">
								<div class="add-thing">
									<p class="tit">
										추가차액
										<!-- 추가금액 -->
									</p>

									<div class="money">0</div>
								</div>
								<div class="pay">
									<p class="tit">
										최종결제금액
										<!-- 최종결제금액 -->
									</p>

									<div class="money">
										<em>${price}</em> <span>원 <!-- 원 --></span>
									</div>
								</div>
								<div class="payment-thing">
									<span class="tit">결제수단 <!-- 결제수단 --></span> <span class="thing">신용/체크카드</span>
								</div>
							</div>

							<div class="btn-group">
								<a
									href="#"
									class="button" id="btn_booking_back" title="이전">이전 <!-- 이전 --></a>
								<a
									href="#"
									w-data="600" h-data="400" class="button active btn-modal-open"
									id="btn_booking_pay" onclick="startPay()" title="결제">결제</a>
							</div>
						</div>
					</div>
					<!--// seat-result -->
				</div>
				<!--// seat-select-section -->
			</div>
		</div>
	</div>
	<!--// container -->
</body>
</html>