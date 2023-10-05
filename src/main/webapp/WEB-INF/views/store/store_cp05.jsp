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
							href="/movieplus/store/cp02" title="메가티켓 탭으로 이동">영화 티켓</a></li>
						<li id="storeTab_CPC05" class="on"><a
							href="/movieplus/store/cp05" title="팝콘/음료/굿즈 탭으로 이동">팝콘/음료/굿즈</a>
						</li>
						<li id="storeTab_CPC09" class=""><a
							href="/movieplus/store/cp09" title="금액권 탭으로 이동">금액권</a></li>
						<li id="storeTab_CPC07" class=""><a
							href="/movieplus/store/cp07" title="포인트몰 탭으로 이동"> <span
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

				<div id="divCategoryPrdtArea_CPC05" style="">
					<!-- store-list -->
					<div class="store-list mt30">
						<ul class="list">

							<li class=""><a
								href="javascript:fn_storeDetail(&#39;1970&#39;);"
								title="메가박스 미니 시네마 (단품) 상세보기">
									<div class="soldout">SOLD OUT</div>




									<div class="label new">NEW</div>








									<div class="img">
										<img
											src="./MEET PLAY SHARE, 메가박스_cp5_files/hApRC44t2qBnFmLMlpthyuJTLlsC2qzz_280.jpg"
											alt="" onerror="noImg(this);">
									</div>

									<div class="info">
										<div class="tit">
											<!-- 제품명 최대 2줄 -->
											<p class="name">메가박스 미니 시네마 (단품)</p>

											<!-- 제품구성 최대 2줄 -->
											<p class="bundle">미니 시네마 (단품)</p>
										</div>

										<div class="price">
											<p class="original"></p>



											<p class="sale">
												<em>23,000</em> <span>원</span>
											</p>



											<p class="ea">

												<span>1,526</span>개 남음

											</p>

										</div>
									</div>
							</a></li>








							<li class=""><a
								href="javascript:fn_storeDetail(&#39;1971&#39;);"
								title="메가박스 미니 시네마(러브콤보 세트) 상세보기">
									<div class="soldout">SOLD OUT</div>




									<div class="label new">NEW</div>








									<div class="img">
										<img
											src="./MEET PLAY SHARE, 메가박스_cp5_files/muo0f1sDqziR7MdCuNZiO7cQb5qDrdmP_280.jpg"
											alt="" onerror="noImg(this);">
									</div>

									<div class="info">
										<div class="tit">
											<!-- 제품명 최대 2줄 -->
											<p class="name">메가박스 미니 시네마(러브콤보 세트)</p>

											<!-- 제품구성 최대 2줄 -->
											<p class="bundle">미니 시네마+팝콘L 1+콜라R 2</p>
										</div>

										<div class="price">
											<p class="original"></p>



											<p class="sale">
												<em>28,000</em> <span>원</span>
											</p>



											<p class="ea">

												<span>1,747</span>개 남음

											</p>

										</div>
									</div>
							</a></li>








							<li class=""><a
								href="javascript:fn_storeDetail(&#39;1728&#39;);"
								title="러브콤보 상세보기">
									<div class="soldout">SOLD OUT</div>







									<div class="label hot">대표상품</div>





									<div class="img">
										<img
											src="./MEET PLAY SHARE, 메가박스_cp5_files/qB1IVqlOLCV7hOOEAJp4J9iG3J5oVWjv_280.png"
											alt="" onerror="noImg(this);">
									</div>

									<div class="info">
										<div class="tit">
											<!-- 제품명 최대 2줄 -->
											<p class="name">러브콤보</p>

											<!-- 제품구성 최대 2줄 -->
											<p class="bundle">팝콘(L) 1 + 탄산음료(R) 2</p>
										</div>

										<div class="price">
											<p class="original"></p>



											<p class="sale">
												<em>10,000</em> <span>원</span>
											</p>



											<p class="ea"></p>

										</div>
									</div>
							</a></li>








							<li class=""><a
								href="javascript:fn_storeDetail(&#39;1729&#39;);"
								title="더블콤보 상세보기">
									<div class="soldout">SOLD OUT</div>



									<div class="label event">BEST</div>









									<div class="img">
										<img
											src="./MEET PLAY SHARE, 메가박스_cp5_files/ERDC5wGVMC0YZPIRUsuuaJuAGRyqeDjC_280.png"
											alt="" onerror="noImg(this);">
									</div>

									<div class="info">
										<div class="tit">
											<!-- 제품명 최대 2줄 -->
											<p class="name">더블콤보</p>

											<!-- 제품구성 최대 2줄 -->
											<p class="bundle">팝콘(R) 2 + 탄산음료(R) 2</p>
										</div>

										<div class="price">
											<p class="original"></p>



											<p class="sale">
												<em>13,000</em> <span>원</span>
											</p>



											<p class="ea"></p>

										</div>
									</div>
							</a></li>





						</ul>
					</div>
					<!--// store-list -->
				</div>

				<div id="divCategoryPrdtArea_CPC09" style="display: none">
					<!-- store-list -->
					<div class="store-list mt30">
						<ul class="list">
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