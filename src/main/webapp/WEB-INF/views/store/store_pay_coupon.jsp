<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
.
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.0.js"></script>
<%-- <script src="${pageContext.request.contextPath}/resources/js/coupon.js"></script> --%>
<script>
$(function() {
    let token = $("meta[name='_csrf']").attr("content");
    let header = $("meta[name='_csrf_header']").attr("content");

    $(document).on('click', '.regibtn', function(e) {
        e.preventDefault(); // 기본 동작인 링크 이동을 막기

        const row = $(this).closest('tr'); // 클릭된 버튼의 부모 <tr> 요소를 찾기
        const payNum = row.find('.regibtn').data('paynum'); // 해당 행의 PAY_NUM 값을 추출
        console.log('Clicked on button with payNum: ' + payNum); // 디버깅 출력

        // alert('payNum:' + payNum);

        $.ajax({
            url: 'coupon',
            method: 'POST',
            contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
            data: {
                "payNum": payNum
            },
            dataType: 'json',
            beforeSend: function(xhr) {
                xhr.setRequestHeader(header, token);
            },
            success: function(data) {
                // alert("등록 성공, payNum: " + payNum);
                window.location.reload();
            },
            error: function(error) {
                // alert("등록 실패, payNum: " + payNum);
                window.location.reload();
            }
        });
    });
});
</script>

</head>
<body>
	<!-- header -->
	<jsp:include page="/WEB-INF/views/header.jsp" />
	<jsp:include page="/WEB-INF/views/mypage_sidebar.jsp" />
	<!-- container -->
	<div class="container">
		<div id="storePay">
			<!--  ko_KR -->
			<!-- contents -->
			<form name="payForm" id="payForm" method="post">
				<input type="hidden" name="completeYn" id="completeYn" value="">
				<input type="hidden" name="prepareYn" id="prepareYn" value="Y">
				<input type="hidden" name="lastPayMethod" id="lastPayMethod">
				<input type="hidden" name="preDisc" id="preDisc" value=""> <input
					type="hidden" name="discType" id="discType" value="">
			</form>
			<!-- 사파리브라우저에서는 새창으로 target 호출시 method가 POST일경우 세션이 유실됨 -->
			<form name="ifrm" method="GET" target="FD_PAY_FRAME"
				action="https://www.megabox.co.kr/on/oh/ohz/PayStore/applyCreditCard.do">
				<input type="hidden" name="transNo" id="ifrm_transNo"> <input
					type="hidden" name="useAmt" id="ifrm_useAmt"> <input
					type="hidden" name="methodName" id="ifrm_methodName"> <input
					type="hidden" name="selectCard" id="ifrm_selectCard"> <input
					type="hidden" name="pointDmode" id="ifrm_pointDmode">
			</form>

			<!--  <div id="contents" class="location-fixed"> -->
			<div id="contents">
				<div class="inner-wrap">
					<!-- store-payment -->
					<div class="store-payment">
						<h2 class="tit">쿠폰/할인권 등록</h2>
						<div class="table-wrap" style="width: 80%">
							<table class="board-list">
								<caption>주문상품정보 목록 표</caption>
								<colgroup>
									<col style="width: 120px;">
									<col>
									<col style="width: 150px;">
									<col style="width: 80px;">
									<col style="width: 200px;">
								</colgroup>
								<thead>
									<tr>
										<th scope="colgroup" colspan="2">코드</th>
										<th scope="col">결제상품</th>
										<th scope="col">금액</th>
										<th scope="col">쿠폰/할인원 등록</th>
									</tr>
								</thead>

								<tbody>
									<c:forEach var="p" items="${couponList}" varStatus="loop">
										<c:if
											test="${pinfo.MEMBER_ID eq p.MEMBER_ID or pinfo.MEMBER_ID=='admin'}">
											<c:if
												test="${fn:contains(p.PAY_MENU, 'ticket') || fn:contains(p.PAY_MENU, 'voucher')}">
												<tr>
													<td class="a-c">${p.PAY_DATE}</td>
													<th scope="row">
														<div class="">
															<p class="">
																<a href="javascript:fn_storeDetail();">${p.COUPON_CODE}</a>
															</p>
															<p class=""></p>
														</div>

														<div class="mt10">
															<span id="acptBrchView" class="font-gblue"></span> <em
																id="acptBrchChoiValView"></em>
														</div>
													</th>
													<td><c:choose>
															<c:when test="${fn:contains(p.PAY_MENU, 'ticket')}">
																<div class="">
																	<p class="">
																		<a href="javascript:fn_storeDetail();">티켓</a>
																	</p>
																	<p class=""></p>
																</div>
															</c:when>
															<c:when test="${fn:contains(p.PAY_MENU, 'voucher')}">
																<div class="">
																	<p class="">
																		<a href="javascript:fn_storeDetail();">금액권</a>
																	</p>
																	<p class=""></p>
																</div>
															</c:when>
															<c:otherwise>
																<div class="goods-info">
																	<p class="name">
																		<a href="javascript:fn_storeDetail();">${p.PAY_NAME}</a>
																	</p>
																	<p class="bundle"></p>
																</div>
															</c:otherwise>
														</c:choose></td>
													<c:choose>
														<c:when test="${fn:contains(p.PAY_MENU, 'ticket')}">
															<td><em id="purcQtyView">12000</em><span>원</span></td>
														</c:when>
														<c:when test="${fn:contains(p.PAY_MENU, 'voucher')}">
															<td><em id="purcQtyView">10000</em><span>원</span></td>
														</c:when>
													</c:choose>
													<td><a
														href="http://localhost:9000/movieplus/store/cart?ITEM_CODE="
														class="a-link regibtn" name="brchList" title="삭제"
														data-paynum="${p.PAY_NUM}">등록</a>
													</td>
												</tr>
											</c:if>
										</c:if>
									</c:forEach>
									<c:if test="${empty couponList}">
										<tr>
											<td colspan="5">등록할 쿠폰/할인권이 없습니다.</td>
										</tr>
									</c:if>
								</tbody>
							</table>
						</div>
					</div>
					<!--// store-payment -->
				</div>
			</div>
			<!--// contents -->
			<!-- 레이어 : 구인증 -->
			<!-- 레이어 : -->
		</div>
	</div>

	</div>
	</div>
	<!--// container -->
	<jsp:include page="/WEB-INF/views/footer.jsp" />
</body>
</html>