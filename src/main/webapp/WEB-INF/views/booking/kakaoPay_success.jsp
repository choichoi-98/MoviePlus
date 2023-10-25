<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="pinfo" />
</sec:authorize>
<!DOCTYPE html>
<!-- saved from url=(0046)https://www.megabox.co.kr/store?prdtClCd=CPC02 -->
<html>
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
<!-- <script src="${pageContext.request.contextPath}/resources/js/store_kakaopay.js"></script> -->
<script>
$(function() {
	let token = $("meta[name='_csrf']").attr("content");
    let header = $("meta[name='_csrf_header']").attr("content");
    
    $(document).on('click', '.delbtn', function(e) {
    	e.preventDefault(); // 기본 동작인 링크 이동을 막기
    	
    	const row = $(this).closest('tr'); // 클릭된 버튼의 부모 <tr> 요소를 찾기
        const KpayNum = row.find('.delbtn').data('kpaynum');  // 해당 행의 ITEM_CODE 값을 추출
//        alert('KpayNum:' + KpayNum);
        
        $.ajax({
            url: 'success',
            method: 'POST',
            contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
            data: { "KpayNum": KpayNum},
            dataType: 'json',
            beforeSend: function(xhr) {
                xhr.setRequestHeader(header, token);
            },
            success: function(data) {
//                alert("삭제 성공, KpayNum: " + KpayNum);
                window.location.reload();
            },
            error: function(error) {
//                alert("삭제 실패, KpayNum: " + KpayNum);
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
						<h2 class="tit">예매내역</h2>
						<div class="table-wrap">
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
										<th scope="colgroup" colspan="2">상품명</th>
										<th scope="col">결제금액</th>
										<th scope="col">선택 좌석</th>
										<th scope="col">구매취소</th>
									</tr>
								</thead>

								<tbody>
									<c:forEach var="b" items="${BookingList}" varStatus="loop">
										<c:if test="${pinfo.MEMBER_ID eq b.MEMBER_ID or pinfo.MEMBER_ID=='admin'}">
											<tr>
												<td class="a-c">
													<div class="goods-info">
														<p class="img">
															<a href="javascript:fn_bookDetail();" title="일반관람권(2D)">
																<img
																src="${fn:split(b.MOVIE_POSTER, '|')[0]}"
																alt="${m.movie_Title}" onerror="noImg(this);">
															</a>
														</p>
													</div>
												</td>
												<th scope="row">
													<div class="goods-info">
														<p class="name">
															<a href="javascript:fn_bookDetail();" title="일반관람권(2D)">${b.MOVIE_TITLE}</a>
														</p>
														<p class="bundle"></p>
													</div>

													<div class="mt10">
														<span id="acptBrchView" class="font-gblue"></span> <em
															id="acptBrchChoiValView"></em>
													</div>
												</th>
												<td>
													<div class="goods-info">
														<em id="prdtSumAmtView" class="price">${b.KPAY_AMOUNT}</em>원
													</div>
												</td>
												<td><em id="purcQtyView">${b.KPAY_OCCUPIED_SEAT}</em></td>
												<td><a
													href="http://localhost:9000/movieplus/store/cart?ITEM_CODE="
													class="a-link delbtn" name="brchList" title="삭제"
													data-kpaynum="${b.KPAY_NUM}">취소</a></td>
											</tr>
										</c:if>
									</c:forEach>
									<c:if test="${empty BookingList}">
										<tr>
											<td colspan="5">결제내역이 없습니다.</td>
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