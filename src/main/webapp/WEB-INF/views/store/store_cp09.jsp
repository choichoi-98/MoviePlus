<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<!-- saved from url=(0046)https://www.megabox.co.kr/store?prdtClCd=CPC02 -->
<html>
<!--<![endif]-->
<head>
	<meta charset="utf-8">
<style>
.container {
	margin: 0; /* 마진을 0으로 설정 */
	padding: 0; /* 패딩을 0으로 설정 */
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<!-- 탭 클릭 시 이벤트 처리 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="static/store_tabs.js"></script>
<script>
    function addToCart(itemName, itemPrice) {
        // AJAX를 사용하여 서버에 요청을 보냅니다.
        $.ajax({
            type: "POST", // 또는 GET, 서버와의 통신 방식에 따라 선택
            url: "/addtocart", // 서버에서 처리할 URL 경로를 지정
            data: {
                itemName: itemName,
                itemPrice: itemPrice
            },
            success: function (response) {
                // 서버로부터의 응답을 처리합니다.
                if (response.success) {
                    // 성공적으로 장바구니에 추가되었을 때 사용자에게 알림
                    alert(itemName + "을(를) 장바구니에 추가했습니다.");
                } else {
                    // 실패 시 에러 메시지를 사용자에게 표시
                    alert("상품 추가에 실패했습니다. 다시 시도해주세요.");
                }
            },
            error: function () {
                // 서버 통신 오류 시 처리
                alert("서버와의 통신 중 오류가 발생했습니다.");
            }
        });
    }
</script>
</head>
<body>
	<!-- header -->
	<jsp:include page="/WEB-INF/views/header.jsp" />
	<!-- container -->
	<div class="container">
		<div class="page-util">
			<div class="inner-wrap">
				<div class="location">
					<span>Home</span> <a href="https://www.megabox.co.kr/store"
						title="스토어">스토어</a>
				</div>
			</div>
		</div>
		<!-- <div id="storeMainList"> -->
		<!-- contents -->
		<div id="contents" class="">
			<!-- inner-wrap -->
			<div class="inner-wrap">
				<h2 class="tit">스토어</h2>
				<div class="tab-list fixed">
					<ul>
						<li id="storeTab_CPC02" class=""><a
							href="/movieplus/store/cp02" title="메가티켓 탭으로 이동">영화 티켓</a></li>
						<li id="storeTab_CPC05" class=""><a
							href="/movieplus/store/cp05" title="팝콘/음료/굿즈 탭으로 이동">팝콘/음료/굿즈</a>
						</li>
						<li id="storeTab_CPC09" class="on"><a
							href="/movieplus/store/cp09" title="금액권 탭으로 이동">금액권</a></li>
						<li id="storeTab_CPC07" class=""><a
							href="/movieplus/store/cp07" title="포인트몰 탭으로 이동"> <span
								class="pointmall">포인트몰</span>
						</a></li>
					</ul>
				</div>

				<!-- 카테고리 별 상품 -->
				<div id="divCategoryPrdtArea_CPC09" style="">
					<!-- store-list -->
					<div class="store-list mt30">
						<c:forEach var="i" items="${voucherlist}">
						<ul class="list">
							<li class="">
								<a href="cart">
									<div class="soldout">SOLD OUT</div>
									<div class="label new">NEW</div>
									<div class="img">
										<img
											src="./MEET PLAY SHARE, 메가박스_cp9_files/OLQpuZPJ5wuIR9BqZK4sDRKN0t2O3sWV_280.png"
											alt="" onerror="noImg(this);">
									</div>
									<div class="info">
										<div class="tit">
											<!-- 제품명 최대 2줄 -->
											<p class="name">${i.ITEM_NAME}</p>
											<!-- 제품구성 최대 2줄 -->
											<p class="bundle">무비플러스 금액권</p>
										</div>
										<div class="price">
											<p class="original"></p>
											<p class="sale">
												<em>${i.ITEM_PRICE}</em> <span>원</span>
											</p>
											<p class="ea"></p>
										</div>
									</div>
								</a>
							</li>
						</ul>
						</c:forEach>
					</div>
					<!--// store-list -->
				</div>

				<div id="divCategoryPrdtArea_CPC07" style="display: none">
					<!-- store-list -->
					<div class="store-list mt30">
						<ul class="list">
						</ul>
					</div>
					<!--// store-list -->
				</div>

				<!--// 카테고리 별 상품 -->
			</div>
			<!--// inner-wrap -->
		</div>
		<!--// contents -->
	</div>
</body>
</html>