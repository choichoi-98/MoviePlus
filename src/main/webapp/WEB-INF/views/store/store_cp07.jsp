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
						<li id="storeTab_CPC05" class=""><a
							href="/movieplus/store/cp05" title="팝콘/음료/굿즈 탭으로 이동">팝콘/음료/굿즈</a>
						</li>
						<li id="storeTab_CPC09" class=""><a
							href="/movieplus/store/cp09" title="금액권 탭으로 이동">금액권</a></li>
						<li id="storeTab_CPC07" class="on"><a
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

				<div id="divCategoryPrdtArea_CPC05" style="display: none">
					<!-- store-list -->
					<div class="store-list mt30">
						<ul class="list">
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

				<div id="divCategoryPrdtArea_CPC07" style="">
					<!-- store-list -->
					<div class="store-list mt30">
						<ul class="list">
							<li class=""><a
								href="javascript:fn_storeDetail(&#39;2020&#39;);"
								title="[100P럭키딜] 돌비 시네마 관람권 (10명) 상세보기">
									<div class="soldout">SOLD OUT</div>
									<div class="label new">NEW</div>
									<div class="img">
									<img src="./MEET PLAY SHARE, 메가박스_cp7_files/zgy3tPGyTI8uBEjQXUpqLL7J4bdLiNOM_280.png"
										 alt="" onerror="noImg(this);">
									</div>
									<div class="info">
										<div class="tit">
											<!-- 제품명 최대 2줄 -->
											<p class="name">[100P럭키딜] 돌비 시네마 관람권 (10명)</p>
											<!-- 제품구성 최대 2줄 -->
											<p class="bundle">돌비 시네마 관람권 (10명)</p>
										</div>
										<div class="price">
											<p class="original"></p>
											<p class="sale">
												<em>100</em> <span>Point</span>
											</p>
											<p class="ea"></p>
										</div>
									</div>
							</a></li>

							<li class=""><a
								href="javascript:fn_storeDetail(&#39;2021&#39;);"
								title="[100P럭키딜] 더 부티크 스위트 관람권 (10명) 상세보기">
									<div class="soldout">SOLD OUT</div>
									<div class="label new">NEW</div>
									<div class="img">
										<img
											src="./MEET PLAY SHARE, 메가박스_cp7_files/UmtaHRZwWutabkOgsmzttGPDi424euYn_280.png"
											alt="" onerror="noImg(this);">
									</div>
									<div class="info">
										<div class="tit">
											<!-- 제품명 최대 2줄 -->
											<p class="name">[100P럭키딜] 더 부티크 스위트 관람권 (10명)</p>
											<!-- 제품구성 최대 2줄 -->
											<p class="bundle">더 부티크 스위트 관람권 (10명)</p>
										</div>
										<div class="price">
											<p class="original"></p>
											<p class="sale">
												<em>100</em> <span>Point</span>
											</p>
											<p class="ea"></p>
										</div>
									</div>
							</a></li>

							<li class=""><a
								href="javascript:fn_storeDetail(&#39;2018&#39;);"
								title="[특가] 영화 5천원 할인쿠폰 [포인트몰9월] 상세보기">
									<div class="soldout">SOLD OUT</div>
									<div class="label"></div>
									<div class="img">
										<img
											src="./MEET PLAY SHARE, 메가박스_cp7_files/Zwbr238BmiqOy5TLJFWFIc1L1sER5s56_280.png"
											alt="" onerror="noImg(this);">
									</div>
									<div class="info">
										<div class="tit">
											<!-- 제품명 최대 2줄 -->
											<p class="name">[특가] 영화 5천원 할인쿠폰 [포인트몰9월]</p>
											<!-- 제품구성 최대 2줄 -->
											<p class="bundle">일반/컴포트/더 부티크/MX 사용 가능</p>
										</div>

										<div class="price">
											<p class="original"></p>
											<p class="sale">
												<em>2,000</em> <span>Point</span>
											</p>
											<p class="ea">
												<span>445</span>개 남음

											</p>
										</div>
									</div>
							</a></li>

							<li class=""><a
								href="javascript:fn_storeDetail(&#39;2012&#39;);"
								title="평일 일반/컴포트/더 부티크 관람쿠폰 [포인트몰9월] 상세보기">
									<div class="soldout">SOLD OUT</div>
									<div class="label"></div>
									<div class="img">
										<img
											src="./MEET PLAY SHARE, 메가박스_cp7_files/GehM2j7Nymr52mdJUUNIWWY8GyZFVDd6_280.png"
											alt="" onerror="noImg(this);">
									</div>
									<div class="info">
										<div class="tit">
											<!-- 제품명 최대 2줄 -->
											<p class="name">평일 일반/컴포트/더 부티크 관람쿠폰 [포인트몰9월]</p>
											<!-- 제품구성 최대 2줄 -->
											<p class="bundle">일반/컴포트/더 부티크 전용 (월~금, 공휴일 제외)</p>
										</div>
										<div class="price">
											<p class="original"></p>
											<p class="sale">
												<em>9,900</em> <span>Point</span>
											</p>
											<p class="ea"></p>
										</div>
									</div>
							</a></li>

							<li class=""><a
								href="javascript:fn_storeDetail(&#39;1962&#39;);"
								title="영화 4천원 할인쿠폰 상세보기">
									<div class="soldout">SOLD OUT</div>
									<div class="label"></div>
									<div class="img">
										<img
											src="./MEET PLAY SHARE, 메가박스_cp7_files/ChSLkyxp4Pgd4zANCuTcgq79vmuealcK_280.png"
											alt="" onerror="noImg(this);">
									</div>
									<div class="info">
										<div class="tit">
											<!-- 제품명 최대 2줄 -->
											<p class="name">영화 4천원 할인쿠폰</p>

											<!-- 제품구성 최대 2줄 -->
											<p class="bundle">일반/컴포트/더 부티크/MX 사용 가능</p>
										</div>

										<div class="price">
											<p class="original"></p>
											<p class="sale">
												<em>2,000</em> <span>Point</span>
											</p>
											<p class="ea"></p>
										</div>
									</div>
							</a></li>

							<li class=""><a
								href="javascript:fn_storeDetail(&#39;1961&#39;);"
								title="영화 3천원 할인쿠폰 상세보기">
									<div class="soldout">SOLD OUT</div>
									<div class="label"></div>
									<div class="img">
										<img
											src="./MEET PLAY SHARE, 메가박스_cp7_files/6OqNJudXCW27eqi9R8vY5X3NfPzacKiI_280.png"
											alt="" onerror="noImg(this);">
									</div>
									<div class="info">
										<div class="tit">
											<!-- 제품명 최대 2줄 -->
											<p class="name">영화 3천원 할인쿠폰</p>
											<!-- 제품구성 최대 2줄 -->
											<p class="bundle">일반/컴포트/더 부티크/MX 사용 가능</p>
										</div>
										<div class="price">
											<p class="original"></p>
											<p class="sale">
												<em>1,500</em> <span>Point</span>
											</p>
											<p class="ea"></p>
										</div>
									</div>
							</a></li>

							<li class=""><a
								href="javascript:fn_storeDetail(&#39;1960&#39;);"
								title="영화 2천원 할인쿠폰 상세보기">
									<div class="soldout">SOLD OUT</div>
									<div class="label"></div>
									<div class="img">
										<img
											src="./MEET PLAY SHARE, 메가박스_cp7_files/C2fUCqaNd6cdnAttzVXSwzOVdQDFT849_280.png"
											alt="" onerror="noImg(this);">
									</div>
									<div class="info">
										<div class="tit">
											<!-- 제품명 최대 2줄 -->
											<p class="name">영화 2천원 할인쿠폰</p>

											<!-- 제품구성 최대 2줄 -->
											<p class="bundle">일반/컴포트/더 부티크/MX 사용 가능</p>
										</div>
										<div class="price">
											<p class="original"></p>
											<p class="sale">
												<em>1,000</em> <span>Point</span>
											</p>
											<p class="ea"></p>
										</div>
									</div>
							</a></li>

							<li class=""><a
								href="javascript:fn_storeDetail(&#39;1959&#39;);"
								title="영화 1천원 할인쿠폰 상세보기">
									<div class="soldout">SOLD OUT</div>
									<div class="label"></div>
									<div class="img">
										<img
											src="./MEET PLAY SHARE, 메가박스_cp7_files/Xm7KbpyCkcUlRjmP6GR7QYXm0IVcmuVD_280.png"
											alt="" onerror="noImg(this);">
									</div>
									<div class="info">
										<div class="tit">
											<!-- 제품명 최대 2줄 -->
											<p class="name">영화 1천원 할인쿠폰</p>
											<!-- 제품구성 최대 2줄 -->
											<p class="bundle">일반/컴포트/더 부티크/MX 사용 가능</p>
										</div>
										<div class="price">
											<p class="original"></p>
											<p class="sale">
												<em>500</em> <span>Point</span>
											</p>
											<p class="ea"></p>
										</div>
									</div>
							</a></li>
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