<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<sec:authorize access="isAuthenticated()">
         <sec:authentication property="principal" var="pinfo"/>
</sec:authorize>
<!DOCTYPE html>
<!-- saved from url=(0046)https://www.megabox.co.kr/store?prdtClCd=CPC02 -->
<!--<![endif]-->
<html>
<link rel="icon" href="${pageContext.request.contextPath}/resources/image/favico.png" type="image/x-icon">
<title>MoviePlus: 모두를 위한 영화관</title>
<head>
<style>
.container {
	margin: 0; /* 마진을 0으로 설정 */
	padding: 0; /* 패딩을 0으로 설정 */
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.0.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/item_select.js"></script>

</head>
<body>
	<!-- header -->
	<jsp:include page="/WEB-INF/views/header.jsp" />

	<!-- container -->
	<div class="container">

		<div class="page-util">
			<div class="inner-wrap">
				<div class="location">
					<span>Home</span> <a href="#"
						title="스토어">스토어</a> <a
						href="#"
						title="스토어상세">스토어상세</a>
				</div>
			</div>
		</div>
		
		<div id="storeDtl">
			<form id="loginForm" method="post">
				<input type="hidden" name="menuId"> <input type="hidden"
					name="mappingId"> <input type="hidden" name="rtnParam"
					value="prdtNo:1747">
			</form>
			<form id="storeDtlForm" method="post">
				<input type="hidden" name="btnId" id="btnId">
			</form>
			<input type="hidden" name="prdtExpoAmt" id="prdtExpoAmt"
				value="12000"> <input type="hidden"
				name="prdtPurcCancelAbleAt" id="prdtPurcCancelAbleAt" value="Y">

			<!-- 2019.08.12 hjchoi 수량제한 체크 -->
			<input type="hidden" id="prdtTotSellLmtQty" name="prdtTotSellLmtQty"
				value="-1">
			<!-- contents -->
			<div id="contents">
				<div class="inner-wrap">
					<!-- store-view -->
					<div class="store-view">
						<h2 class="tit">${selecteditem.ITEM_NAME}</h2>
						<div class="sub-info">
							<p class="bundle">${selecteditem.ITEM_MENU}</p>
						</div>
						<!-- box-store-view -->
						<div class="box-store-view">
							<div class="left">
								<div class="img">
									<p>
										<img
											src="${pageContext.request.contextPath}/upload/${i.ITEM_FILE}"
											alt="${selecteditem.ITEM_NAME}" onerror="noImg(this);">
									</p>
								</div>
								<p class="origin"></p>
							</div>
							<!-- right -->
							<div class="right">
								<!-- goods-info -->
								<div class="goods-info">
									<div class="line">
										<p class="tit">
											<span class="line32">사용극장</span>
										</p>
										<div class="cont">
											<a
												href="#"
												class="a-link" name="brchList" style="color: #792828">사용가능극장</a>
										</div>
									</div>
									<div class="line">
										<p class="tit">유효기간</p>
										<div class="cont">
											<p class="txt">구매일로부터 24개월 이내 사용 가능</p>
											<p class="txt min">예매 가능 유효기간은 구매일로부터 2년입니다.</p>
											<p></p>
										</div>
									</div>
									<div class="line">
										<p class="tit">판매수량</p>
										<div class="cont">
											<div class="sale-count">
												<span> - </span>
											</div>
										</div>
									</div>
									<div class="line">
										<p class="tit">구매 후 취소</p>
										<div class="cont">
											<p class="txt">구매일로부터 10일 이내 취소 가능하며, 부분취소는 불가능합니다.</p>
											<p class="txt min">구매일로부터 10일 이내 취소 가능하며, 부분취소는 불가능합니다.</p>
										</div>
									</div>
								</div>
								<!-- type -->
								<div class="type">
									<!-- 수량 금액 일 때 -->
									<!--// 수량 금액 일 때 -->
									<!-- 기프트카드  -->
									<div class="receipt">
										<div class="line">
											<p class="tit">
												<span class="line32">수량/금액</span>
											</p>
											<div class="cont">
												<button type="button" class="btn minus" title="수량감소">
													<i class="iconset ico-minus"></i>
												</button>
												<input type="text" title="수량 입력" class="input-text"
													   id="quantity" value="1"  readonly="readonly">
												<button type="button" class="btn plus" title="수량증가">
													<i class="iconset ico-plus"></i>
												</button>
												<div class="money">
													<em id="prdtSumAmt" data-test="${selecteditem.ITEM_CODE}"
														data-price="${selecteditem.ITEM_PRICE}">${selecteditem.ITEM_PRICE}
													</em><span>원</span>
													<%-- <em id="prdtSumAmt" data-test="${selecteditem.ITEM_CODE}"
													data-price="${selecteditem.ITEM_PRICE}">${selecteditem.ITEM_PRICE}</em> <span>원</span> --%>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="btn-group">
									<a href="#" id="btnGift" class="button large" 
   									 w-data="500" h-data="410" title="장바구니" 
   									 style="color: black"
   									 data-test="${selecteditem.ITEM_CODE}">장바구니
									</a> 
									<a href="cart" id="btnPurc" class="button purple large" 
									   w-data="500" h-data="410" title="구매" style="background: #792828">구매
									</a>
								</div>
							</div>
							<!--// right -->
						</div>
						<!--// box-store-view -->
					</div>
					<!--// store-view -->
					<!-- 레이어 : 극장확인 -->
					<section id="layer_chk01" class="modal-layer"></section>
					<!--// 레이어 : 극장확인 -->
					<!-- 레이어 : 지점확인 -->
					<section id="layer_chk02" class="modal-layer"></section>
					<!--// 레이어 : 지점확인 -->
					<!-- 레이어 : 취소불가 -->
					<section id="layer_chk03" class="modal-layer"></section>
					<!--// 레이어 : 지점확인 -->
					<!-- box-pulldown -->
					<div class="box-pulldown">
						<div class="tit">
							<button type="button" class="btn-toggle">
								구매 후 취소 <i class="iconset ico-arr-toggle-down"></i>
							</button>
						</div>
					</div>
					<!--// box-pulldown -->
					<!-- box-pulldown -->
					<div class="box-pulldown">
						<div class="tit">
							<button type="button" class="btn-toggle">
								상품이용안내 <i class="iconset ico-arr-toggle-down"></i>
							</button>
						</div>
					</div>
					<!--// box-pulldown -->
				</div>
			</div>
			<!--// contents -->
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/footer.jsp" />
	<!--// container -->
</body>
</html>