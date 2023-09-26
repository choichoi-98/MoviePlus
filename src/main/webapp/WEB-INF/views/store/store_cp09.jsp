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

<!-- 탭 클릭 시 이벤트 처리 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="static/store_tabs.js"></script>
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
							href="/movieplus/store_cp02" title="메가티켓 탭으로 이동">영화 티켓</a></li>
						<li id="storeTab_CPC05" class=""><a
							href="/movieplus/store_cp05" title="팝콘/음료/굿즈 탭으로 이동">팝콘/음료/굿즈</a>
						</li>
						<li id="storeTab_CPC09" class="on"><a
							href="/movieplus/store_cp09" title="금액권 탭으로 이동">금액권</a></li>
						<li id="storeTab_CPC07" class=""><a
							href="/movieplus/store_cp07" title="포인트몰 탭으로 이동"> <span
								class="pointmall">포인트몰</span>
						</a></li>
					</ul>
				</div>

				<!-- 카테고리 별 상품 -->
				<div id="divCategoryPrdtArea_CPC02" style="display: none">
					<!-- store-list -->
					<div class="store-list mt30">
						<ul class="list">
						</ul>
					</div>
					<!--// store-list -->
				</div>

				<div id="divCategoryPrdtArea_CPC05" style="display: none">
					<!-- store-list -->
					<div class="store-list mt30">
						<ul class="list">
						</ul>
					</div>
					<!--// store-list -->
				</div>

				<div id="divCategoryPrdtArea_CPC09" style="">
					<!-- store-list -->
					<div class="store-list mt30">
						<ul class="list">
						
							<li class=""><a
								href="javascript:fn_storeDetail(&#39;1764&#39;);"
								title="메가박스 금액권(2만원권) 상세보기">
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
											<p class="name">메가박스 금액권(2만원권)</p>

											<!-- 제품구성 최대 2줄 -->
											<p class="bundle">메가박스 금액권(2만원권)</p>
										</div>
										<div class="price">
											<p class="original"></p>
											<p class="sale">
												<em>20,000</em> <span>원</span>
											</p>
											<p class="ea"></p>
										</div>
									</div>
							</a></li>

							<li class=""><a
								href="javascript:fn_storeDetail(&#39;1765&#39;);"
								title="메가박스 금액권(3만원권) 상세보기">
									<div class="soldout">SOLD OUT</div>




									<div class="label new">NEW</div>








									<div class="img">
										<img
											src="./MEET PLAY SHARE, 메가박스_cp9_files/UhUaGPc8CkaIn0wdjvdz6yhunnOzYdaP_280.png"
											alt="" onerror="noImg(this);">
									</div>

									<div class="info">
										<div class="tit">
											<!-- 제품명 최대 2줄 -->
											<p class="name">메가박스 금액권(3만원권)</p>

											<!-- 제품구성 최대 2줄 -->
											<p class="bundle">메가박스 금액권(3만원권)</p>
										</div>

										<div class="price">
											<p class="original"></p>



											<p class="sale">
												<em>30,000</em> <span>원</span>
											</p>



											<p class="ea"></p>

										</div>
									</div>
							</a></li>








							<li class=""><a
								href="javascript:fn_storeDetail(&#39;1766&#39;);"
								title="메가박스 금액권(5만원권) 상세보기">
									<div class="soldout">SOLD OUT</div>




									<div class="label new">NEW</div>








									<div class="img">
										<img
											src="./MEET PLAY SHARE, 메가박스_cp9_files/SvDPUHovAC2t5VdkHNby25qYMYGNp3tN_280.png"
											alt="" onerror="noImg(this);">
									</div>

									<div class="info">
										<div class="tit">
											<!-- 제품명 최대 2줄 -->
											<p class="name">메가박스 금액권(5만원권)</p>

											<!-- 제품구성 최대 2줄 -->
											<p class="bundle">메가박스 금액권(5만원권)</p>
										</div>

										<div class="price">
											<p class="original"></p>



											<p class="sale">
												<em>50,000</em> <span>원</span>
											</p>



											<p class="ea"></p>

										</div>
									</div>
							</a></li>





						</ul>
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