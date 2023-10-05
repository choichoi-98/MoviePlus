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
<!-- 탭 클릭 시 이벤트 처리 -->
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
						<li id="storeTab_CPC02" class="on"><a
							href="/movieplus/store/cp02" title="메가티켓 탭으로 이동">영화 티켓</a></li>
						<li id="storeTab_CPC05" class=""><a
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

				<div id="divCategoryPrdtArea_CPC02" style="">
					<!-- store-list -->
					<div class="store-list mt30">
						<ul class="list">
							<li class=""><a
								href="javascript:fn_storeDetail(&#39;2005&#39;);"
								title="[한가위] 연인 패키지 상세보기">
									<div class="soldout">SOLD OUT</div>
									<div class="label event">EVENT</div>
									<div class="img">
										<img
											src="./MEET PLAY SHARE, 메가박스_files/akIeaYOCBjFLqxbO6lt4VOcAJ4YttCvM_280.jpg"
											alt="" onerror="noImg(this);">
									</div>
									<div class="info">
										<div class="tit">
											<!-- 제품명 최대 2줄 -->
											<p class="name">연인 패키지</p>

											<!-- 제품구성 최대 2줄 -->
											<p class="bundle">2인관람권 + 러브콤보 [팝콘(L)1 + 탄산음료(R)2]</p>
										</div>

										<div class="price">
											<p class="original">36,000원</p>
											<p class="sale">
												<em>23,000</em> <span>원</span>
											</p>
											<p class="ea"></p>
										</div>
									</div>
							</a></li>

							<li class="sold-out"><a
								href="javascript:fn_storeDetail(&#39;2006&#39;);"
								title="[한가위] 친구 패키지 상세보기">
									<div class="soldout">SOLD OUT</div>
									<div class="label event">EVENT</div>
									<div class="img">
										<img
											src="./MEET PLAY SHARE, 메가박스_files/iAymxNnDf53SSTbaB4ekEm77DyJh0nUP_280.jpg"
											alt="" onerror="noImg(this);">
									</div>
									<div class="info">
										<div class="tit">
											<!-- 제품명 최대 2줄 -->
											<p class="name">친구 패키지</p>
											<!-- 제품구성 최대 2줄 -->
											<p class="bundle">3인관람권 + 더블콤보 [팝콘(R)2 + 탄산음료(R)2]</p>
										</div>
										<div class="price">
											<p class="original">51,000원</p>
											<p class="sale">
												<em>31,900</em> <span>원</span>
											</p>
											<p class="ea"></p>
										</div>
									</div>
							</a></li>
							<li class=""><a
								href="javascript:fn_storeDetail(&#39;1747&#39;);"
								title="일반관람권(2D) 상세보기">
									<div class="soldout">SOLD OUT</div>
									<div class="label hot">대표상품</div>





									<div class="img">
										<img
											src="./MEET PLAY SHARE, 메가박스_files/OzjTPmOIAocfyQnas3x8Vo9JDRRnHeKf_280.png"
											alt="" onerror="noImg(this);">
									</div>

									<div class="info">
										<div class="tit">
											<!-- 제품명 최대 2줄 -->
											<p class="name">일반관람권(2D)</p>

											<!-- 제품구성 최대 2줄 -->
											<p class="bundle">일반 관람권</p>
										</div>

										<div class="price">
											<p class="original">13,000원</p>
											<p class="sale">
												<em>12,000</em> <span>원</span>
											</p>
											<p class="ea"></p>
										</div>
									</div>
							</a></li>

							<li class=""><a
								href="javascript:fn_storeDetail(&#39;1748&#39;);"
								title="더 부티크 전용관람권 상세보기">
									<div class="soldout">SOLD OUT</div>








									<div class="label"></div>




									<div class="img">
										<img
											src="./MEET PLAY SHARE, 메가박스_files/rxCDUuqHT9RostRRQYeu1mr1knFyHxWr_280.png"
											alt="" onerror="noImg(this);">
									</div>

									<div class="info">
										<div class="tit">
											<!-- 제품명 최대 2줄 -->
											<p class="name">더 부티크 전용관람권</p>

											<!-- 제품구성 최대 2줄 -->
											<p class="bundle">2D 더 부티크 전용 관람권</p>
										</div>

										<div class="price">
											<p class="original">16,000원</p>



											<p class="sale">
												<em>15,000</em> <span>원</span>
											</p>



											<p class="ea"></p>

										</div>
									</div>
							</a></li>








							<li class=""><a
								href="javascript:fn_storeDetail(&#39;1749&#39;);"
								title="더 부티크 스위트 전용관람권 상세보기">
									<div class="soldout">SOLD OUT</div>





									<div class="label push">추천</div>







									<div class="img">
										<img
											src="./MEET PLAY SHARE, 메가박스_files/M8qiScDr6orSchgFPCRCcCtLPVenv6tm_280.png"
											alt="" onerror="noImg(this);">
									</div>

									<div class="info">
										<div class="tit">
											<!-- 제품명 최대 2줄 -->
											<p class="name">더 부티크 스위트 전용관람권</p>

											<!-- 제품구성 최대 2줄 -->
											<p class="bundle">더 부티크 스위트 전용 관람권</p>
										</div>

										<div class="price">
											<p class="original"></p>



											<p class="sale">
												<em>40,000</em> <span>원</span>
											</p>



											<p class="ea"></p>

										</div>
									</div>
							</a></li>








							<li class=""><a
								href="javascript:fn_storeDetail(&#39;1750&#39;);"
								title="MX 전용관람권 상세보기">
									<div class="soldout">SOLD OUT</div>








									<div class="label"></div>




									<div class="img">
										<img
											src="./MEET PLAY SHARE, 메가박스_files/Yk3B0T93JXWbbjrrwVxbmTT9Iij5Tszv_280.png"
											alt="" onerror="noImg(this);">
									</div>

									<div class="info">
										<div class="tit">
											<!-- 제품명 최대 2줄 -->
											<p class="name">MX 전용관람권</p>

											<!-- 제품구성 최대 2줄 -->
											<p class="bundle">2D MX 전용 관람권</p>
										</div>

										<div class="price">
											<p class="original">17,000원</p>



											<p class="sale">
												<em>16,000</em> <span>원</span>
											</p>



											<p class="ea"></p>

										</div>
									</div>
							</a></li>








							<li class=""><a
								href="javascript:fn_storeDetail(&#39;1751&#39;);"
								title="Dolby Cinema 전용관람권 상세보기">
									<div class="soldout">SOLD OUT</div>





									<div class="label push">추천</div>







									<div class="img">
										<img
											src="./MEET PLAY SHARE, 메가박스_files/XxKX38rQAArz5GGaFCs7KwvYyUz5oQFC_280.png"
											alt="" onerror="noImg(this);">
									</div>

									<div class="info">
										<div class="tit">
											<!-- 제품명 최대 2줄 -->
											<p class="name">Dolby Cinema 전용관람권</p>

											<!-- 제품구성 최대 2줄 -->
											<p class="bundle">Dolby Cinema 전용 관람권(2D)</p>
										</div>

										<div class="price">
											<p class="original">18,000원</p>



											<p class="sale">
												<em>17,000</em> <span>원</span>
											</p>



											<p class="ea"></p>

										</div>
									</div>
							</a></li>

							<li class=""><a
								href="javascript:fn_storeDetail(&#39;1753&#39;);"
								title="러브콤보패키지 상세보기">
									<div class="soldout">SOLD OUT</div>
									<div class="label event">BEST</div>
									<div class="img">
										<img
											src="./MEET PLAY SHARE, 메가박스_files/ZVX4FRDP8NLYto5HL0gAtxr6u4ZCmwOP_280.png"
											alt="" onerror="noImg(this);">
									</div>

									<div class="info">
										<div class="tit">
											<!-- 제품명 최대 2줄 -->
											<p class="name">러브콤보패키지</p>

											<!-- 제품구성 최대 2줄 -->
											<p class="bundle">2D 일반관람권 2매 + 러브콤보 [팝콘(L)1 + 탄산음료(R)2]</p>
										</div>

										<div class="price">
											<p class="original">36,000원</p>



											<p class="sale">
												<em>30,000</em> <span>원</span>
											</p>



											<p class="ea"></p>

										</div>
									</div>
							</a></li>
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
	<jsp:include page="/WEB-INF/views/footer.jsp" />
</body>
</html>