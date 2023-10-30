<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<!DOCTYPE html>
<html>
<!--<![endif]-->
<head>
<style>
.container {
	margin: 0; /* 마진을 0으로 설정 */
	padding: 0; /* 패딩을 0으로 설정 */
}
/* 모달 초기 숨김 상태 */
/* #myModal {
	display: none;
} */
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.0.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/booking_cart.js"></script>
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
									id="btn_booking_init" onClick="window.location.reload()">
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
										title="메가박스 포인트/쿠폰"> 쿠폰/포인트
										<i class="iconset ico-btn-more-arr"></i>
									</a>
										<div id="mega_point" class="cont-down">
											<div class="coupon-box">
												<div class="item col-1">
													<a
														href="#"
														w-data="600" h-data="550" class=""
														name="btn_pay_memp" id="btn_pay_mcoupon" title="무비플러스 포인트">
														<span class="txt">무비플러스 포인트</span>
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
														w-data="600" h-data="550" class=""
														name="btn_pay_dcoupon" id="btn_pay_mcoupon"
														title="무비플러스 할인쿠폰"> <span class="txt">무비플러스 쿠폰
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
										title="관람권"> 할인/관람권
										<i class="iconset ico-btn-more-arr"></i>
									</a>
										<div id="mobile_coupon" class="cont-down">
											<div class="coupon-box">
												<div class="item col-1">
													<a href="#"
													   w-data="600" h-data="600" class=""
													   name="btn_pay_mcoupon" id="btn_pay_mcoupon" title="메가박스 관람권"> 
													   <span class="txt">스토어교환권</span>
													</a>

													<button type="button" class="btn-cancel"
														id="btn_cancel_mcoupon" method="mcoupon">
														취소
														<!-- 취소 -->
													</button>
												</div>
												<div class="item col-1">
													<!-- <a
														href="#myModal"
														w-data="600" h-data="560" class=""
														name="btn_pay_scoupon" id="btn_pay_mcoupon" title="스토어교환권">
														<span class="txt">스토어교환권</span>
													</a> -->

													<button type="button" class="btn-cancel"
														id="btn_cancel_scoupon" method="scoupon">
														취소
														<!-- 취소 -->
													</button>
												</div>
											</div>
										</div>
									<div class="pointtxt">기프티콘, 기프티쇼, 아이넘버, 도넛북, 스마트콘, 스마일콘,
										G마켓 예매권은 [모바일 관람권]에서 사용하실 수 있습니다.</div>
									</li>
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
									name="radio_payment" id="rdo_pay_credit" value="credit" checked="checked">
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
							<c:set var="totalPrice" value="0"/>
									<div class="all">
										<span class="tit">금액 <!-- 금액 --></span> <span class="price"><em>${price}</em>
											<span>원 <!-- 원 --></span></span>
									</div>
								</div>

								<div class="box discout-box">

									<div class="all">
										<span class="tit">할인적용<!-- 할인적용 --></span> 
										<span class="price" id="discountPrice"><em>0</em> 원 <!-- 원 --></span>
									</div>
								</div>
							</div>

							<div class="pay-area">
								<div class="add-thing">
									<p class="tit">
										추가차액
										<!-- 추가금액 -->
									</p>

									<div class="money"></div>
								</div>
								<c:set var="totalPrice" value="${totalPrice + price}"/>
								<div class="pay">
									<p class="tit">
										최종결제금액
										<!-- 최종결제금액 -->
									</p>

									<div class="money">
										<em id="Checker" data-amount="${totalPrice}"
										data-sid="${scheduleId}" data-cnt="${seatCnt}"
										data-seatinfo="${seatInfo}">${totalPrice}</em> <span>원<!-- 원 --></span>
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
									href="javascript:void(0);"
									w-data="600" h-data="400" class="button active "
									id="btn_booking_pay"  title="결제">결제</a>
									<!-- onclick="startPay()" -->
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
	
	<section id="layer_dcoupon" class="modal-layer" style="z-index: 505;"><a href="#" class="focus">레이어로 포커스 이동 됨</a>
	<div class="wrap" style="width: 600px; height: 550px; margin-left: -300px; margin-top: 0px; top: 80px;">
		<header class="layer-header">
			<h3 class="tit">메가플러스 할인쿠폰<!-- 메가박스 할인쿠폰 --></h3>
		</header>

		<div class="layer-con" style="height: 465px;">
			<div class="pop-tit">사용할 쿠폰을 선택해주세요.<!-- 사용할 쿠폰을 선택해주세요. --></div>

			<div class="popup-gray mid-info-box mb20">
				<div class="pop-search-area">
					<p class="sh-txt reset mr08"><span class="label">쿠폰번호<!-- 쿠폰번호 --></span></p>

					<div class="sh-input">
						<input id="couponCode" type="text" title="쿠폰 코드 입력" placeholder="" 
							   class="input-text" style="width:250px;" maxlength="50" onchange="noSpaceForm(this);">
					</div>

					<div class="sh-btn gray">
						<button type="button" class="button small gray" id="btn_coupon_search">쿠폰조회</button>
				   <!-- <button type="button" class="button small gray" id="btn_reg_dcoupon">쿠폰등록</button> -->
					</div>
				</div>
			</div>

			<div class="table-wrap divide">
				<table class="board-list line">
					<caption>쿠폰명, 쿠폰번호, 유효기간, 사용 항목을 가진 메가박스 영화할인쿠폰 목록의 제목 표<!-- 쿠폰명, 쿠폰번호, 유효기간, 사용 항목을 가진 메가박스 영화할인쿠폰 목록의 제목 표 --></caption>
					<colgroup>
						<col>
						<col style="width:115px;">
						<col style="width:60px;">
					</colgroup>
					<thead>
						<tr>
							<th scope="col">쿠폰명<!-- 쿠폰명 --></th>
							<th scope="col">유효기간<!-- 유효기간 --></th>
							<th scope="col">사용<!-- 사용 --></th>
						</tr>
					</thead>
				</table>

				<div class="scroll" style="min-height:171px; max-height:171px;">
					<table class="board-list line" id="data_table">
						<caption>쿠폰명, 쿠폰번호, 유효기간, 사용 항목을 가진 메가박스 영화할인쿠폰 목록의 내용 표<!-- 쿠폰명, 쿠폰번호, 유효기간, 사용 항목을 가진 메가박스 영화할인쿠폰 목록의 내용 표 --></caption>
						<colgroup>
							<col>
							<col style="width:115px;">
							<col style="width:60px;">
						</colgroup>
						
						<tbody id="1coupon">
						</tbody>
					</table>
				</div>

				<div class="box-border v1 use-guide mt15">
					<p class="tit">이용안내<!-- 이용안내 --></p>

					<ul class="dot-list gray">
						<li>사용 가능한 쿠폰만 노출됩니다.<!-- 사용 가능한 쿠폰만 노출됩니다. --></li>
						<li>전체 쿠폰 목록은 나의 정보 &gt; 할인쿠폰에서 확인 가능합니다.<!-- 전체 쿠폰 목록은 나의 메가박스 > 할인쿠폰에서 확인 가능합니다. --></li>
						<li>보유하신 쿠폰은 등록 후 이용하실 수 있습니다.<!-- 보유하신 쿠폰은 등록 후 이용하실 수 있습니다. --></li>
						<li>카드사 제휴쿠폰은 타 쿠폰 및 제휴포인트와 중복 적용 불가합니다.<!-- 카드사 제휴쿠폰은 타 쿠폰 및 제휴포인트와 중복 적용 불가합니다.. --></li>
					</ul>
				</div>
			</div>
		</div>

		<div class="btn-group-fixed">
			<button type="button" class="button small close-layer" id="btn_close_dcoupon">닫기<!-- 닫기 --></button>
			<button type="button" class="button small purple" id="btn_cancel_apply_dcoupon" style="display:none;">적용취소<!-- 적용취소 --></button>
			<button type="button" class="button small purple" id="btn_apply_dcoupon">적용<!-- 적용 --></button>
		</div>

		<button type="button" class="btn-modal-close" id="btn_close_modal_dcoupon">레이어 닫기<!-- 레이어 닫기 --></button>
	</div>
</section>

<jsp:include page="/WEB-INF/views/footer.jsp" />	
</body>
</html>