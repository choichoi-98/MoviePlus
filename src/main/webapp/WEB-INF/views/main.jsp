<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MoviePlus: 모두를 위한 영화관 </title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css" media="all">
<style>
#header.main-header{
	top:0px;
}
</style>

<script>
	//document.ready를 사용하여 main페이지 로드 시 ajax 요청 보내기 
	$(document).ready(function(){
		$.ajax({
			url:"http://localhost:9000/movieplus/movie", //영화목록 api 처리 주소
			type:"GET",
			success: function(response){
				console.log("영화 데이터 가져오기 성공!");
			},
			error: function(){
				consol.log("영화 데이터 가져오기 실패");
			}
		});
	});
</script>
</head>
<body>
<!-- 
document.ready
-> ajax로 처리
	url 주소를 http://localhost:9000/movieplus/movie로
 -->
	<jsp:include page="/WEB-INF/views/header.jsp"/>
	
<div class="container main-container area-ad">

	<!-- contents -->
	<div id="contents">

		<!-- main-page -->
		<div class="main-page">
			
			<!-- section main-movie : 영화 -->
			<div id="main_section01" class="section main-movie on">
				<div class="bg">
					<div class="bg-pattern"></div>
					<img src="./MEET PLAY SHARE, 메가박스_files/pvp0aae1G11CUCBtP2ynLNg5hRCiKqeq_380.jpg" alt="거미집 티저 포스터_개봉일.jpg" onerror="noImg(this, &#39;main&#39;);">
					</div>

				<!-- cont-area  -->
				<div class="cont-area">

					<!-- tab-sorting -->
					<div class="tab-sorting" style="margin-top:130px">
						<button type="button" class="on" sort="boxoRankList" name="btnSort">박스오피스</button>
						<!-- 2020.03.16. 김민영K 삭제요청.
						<button type="button" sort="accmAdncList" name="btnSort">누적관객순</button>
						<button type="button" sort="megaScoreList" name="btnSort">메가스코어순</button>
						-->
					</div>
					<!-- tab-sorting -->

					<a href="https://www.megabox.co.kr/movie" class="more-movie" title="더 많은 영화보기">
						더 많은 영화보기 <i class="iconset ico-more-corss gray"></i>
					</a>

					<!-- main-movie-list -->
					<div class="main-movie-list">
						<ol class="list">
							<!-- 3개의 list를  loop 한다-->
							<!-- 박스오피스 시작 -->
									<!-- 각 map 별 첫번째 li 에 first클래스 추가 -->

										<!-- 각 map 별 첫번째 li 에 first클래스 추가 -->
										<li name="li_boxoRankList" class="first">
											<a href="javascript:gfn_moveDetail(&#39;23069500&#39;)" class="movie-list-info" title="영화상세 보기">
												<div class="screen-type2">
													<p></p>
													</div>
												<p class="rank">1<span class="ir">위</span></p>
												<!-- to 개발 : alt 값에 영화 제목 출력 -->
										      	<img src="./MEET PLAY SHARE, 메가박스_files/k9kf8YndGJvv0ce7mc9AHEUdZeGhVYpF_420.jpg" alt="거미집" class="poster" onerror="noImg(this, &#39;main&#39;);">
							                      	<div class="wrap" style="display: none; opacity: 1;">
													<div class="summary">
														“결말만 바꾸면 걸작이 된다, 딱 이틀이면 돼!”<br><br>1970년대 꿈도 예술도 검열당하던 시대<br>성공적이었던 데뷔작 이후, 악평과 조롱에 시달리던 김감독(송강호)은<br>촬영이 끝난 영화 ‘거미집’의 새로운 결말에 대한 영감을 주는 꿈을 며칠째 꾸고 있다.<br>그대로만 찍으면 틀림없이 걸작이 된다는 예감, 그는 딱 이틀 간의 추가 촬영을 꿈꾼다.<br>그러나 대본은 심의에 걸리고, 제작자 백회장(장영남)은 촬영을 반대한다.<br>제작사 후계자인 신미도(전여빈)를 설득한 김감독은 베테랑 배우 이민자(임수정), 톱스타 강호세(오정세),<br>떠오르는 스타 한유림(정수정)까지 불러 모아 촬영을 강행하지만, 스케줄 꼬인 배우들은 불만투성이다.<br>설상가상 출장 갔던 제작자와 검열 담당자까지 들이닥치면서 현장은 아수라장이 되는데…<br><br>과연 ‘거미집’은 세기의 걸작으로 완성될 수 있을까?</div>
													<!--
														관람 전이 더 높을 때
														<div class="my-score small">

														관람 후가 더 높을 때
														<div class="my-score big">

														관람 후가 더 같을 때
														<div class="my-score equal">
													 -->
													<div class="score">
														<div class="preview">
															<p class="tit">관람평</p>
															<p class="number">0<span class="ir">점</span></p>
														</div>
													</div>
												</div>
											</a>
											<div class="btn-util">
                                                <button type="button" class="button btn-like" rpst-movie-no="23069500">
													<i title="보고싶어 설정 안함" class="iconset ico-heart-toggle-gray"></i>
														398</button>
                                                <div class="case">
                                                    <!-- 개봉 예매가능 기본-->
                                                            <a href="javascript:moveBokdPage(&#39;23069500&#39;);" class="button gblue" title="영화 예매하기">예매</a>
                                                        </div>
                                                </div>
										</li>
									<!-- 각 map 별 첫번째 li 에 first클래스 추가 -->

										<!-- 각 map 별 첫번째 li 에 first클래스 추가 -->
										<li name="li_boxoRankList" class="">
											<a href="javascript:gfn_moveDetail(&#39;23066600&#39;)" class="movie-list-info" title="영화상세 보기">
												<div class="screen-type2">
													</div>
												<p class="rank">2<span class="ir">위</span></p>
												<!-- to 개발 : alt 값에 영화 제목 출력 -->
										      	<img src="./MEET PLAY SHARE, 메가박스_files/PEbT2IGu2i6X3Q4UyYUU6hyMpHkcr2O5_420.jpg" alt="천박사 퇴마 연구소: 설경의 비밀" class="poster" onerror="noImg(this, &#39;main&#39;);">
							                      	<div class="wrap">
													<div class="summary">
														<br>대대로 마을을 지켜 온 당주집 장손이지만<br>정작 귀신은 믿지 않는 가짜 퇴마사 ‘천박사’(강동원).<br> <br>사람의 마음을 꿰뚫는 통찰력으로 가짜 퇴마를 하며, 의뢰받은 사건들을 해결해 오던 그에게<br>귀신을 보는 의뢰인 ‘유경’(이솜)이 찾아와 거액의 수임료로 거절하기 힘든 제안을 한다.<br> <br>‘천박사’는 파트너 ‘인배’(이동휘)와 함께 ‘유경’의 집으로 향하고 그곳에서 벌어지는 사건을 쫓으며<br>자신과 얽혀 있는 부적인 ‘설경’의 비밀을 알게 되는데…<br> <br>귀신을 믿지 않는 가짜 퇴마사!<br>그의 세계를 흔드는 진짜 사건이 나타났다!</div>
													<!--
														관람 전이 더 높을 때
														<div class="my-score small">

														관람 후가 더 높을 때
														<div class="my-score big">

														관람 후가 더 같을 때
														<div class="my-score equal">
													 -->
													<div class="score">
														<div class="preview">
															<p class="tit">관람평</p>
															<p class="number">0<span class="ir">점</span></p>
														</div>
													</div>
												</div>
											</a>
											<div class="btn-util">
                                                <button type="button" class="button btn-like" rpst-movie-no="23066600">
													<i title="보고싶어 설정 안함" class="iconset ico-heart-toggle-gray"></i>
														745</button>
                                                <div class="case">
                                                    <!-- 개봉 예매가능 기본-->
                                                            <a href="javascript:moveBokdPage(&#39;23066600&#39;);" class="button gblue" title="영화 예매하기">예매</a>
                                                        </div>
                                                </div>
										</li>
									<!-- 각 map 별 첫번째 li 에 first클래스 추가 -->

										<!-- 각 map 별 첫번째 li 에 first클래스 추가 -->
										<li name="li_boxoRankList" class="">
											<a href="javascript:gfn_moveDetail(&#39;23069400&#39;)" class="movie-list-info" title="영화상세 보기">
												<div class="screen-type2">
													</div>
												<p class="rank">3<span class="ir">위</span></p>
												<!-- to 개발 : alt 값에 영화 제목 출력 -->
										      	<img src="./MEET PLAY SHARE, 메가박스_files/DtYArhrGFL9P8Z9mA7zEBRfjbtYqCZEY_420.jpg" alt="1947 보스톤" class="poster" onerror="noImg(this, &#39;main&#39;);">
							                      	<div class="wrap" style="display: none; opacity: 1;">
													<div class="summary">
														“나라가 독립을 했으면 당연히 우리 기록도 독립이 되어야지!”<br><br>1936년 베를린 올림픽, 세계 신기록을 세운 마라톤 금메달리스트 ‘손기정’.<br>기미가요가 울려 퍼지는 시상대에서 화분으로 가슴에 단 일장기를 가렸던 그는<br>하루아침에 민족의 영웅으로 떠올랐지만<br>일제의 탄압으로 더 이상 달릴 수 없게 된다.<br><br>광복 이후 1947년 서울,<br>제2의 손기정으로 촉망받는 ‘서윤복’에게 ‘손기정’이 나타나고<br>밑도 끝도 없이 ‘보스톤 마라톤 대회’에 나가자는 제안을 건넨다.<br>일본에 귀속된 베를린 올림픽의 영광을 되찾기 위해<br>처음으로 태극마크를 가슴에 새기고 달려 보자는 것!<br><br>운동화 한 켤레 살 돈도 없던 대한의 마라토너들은<br>미국 보스톤으로 잊을 수 없는 여정을 시작하는데…</div>
													<!--
														관람 전이 더 높을 때
														<div class="my-score small">

														관람 후가 더 높을 때
														<div class="my-score big">

														관람 후가 더 같을 때
														<div class="my-score equal">
													 -->
													<div class="score">
														<div class="preview">
															<p class="tit">관람평</p>
															<p class="number">9.6<span class="ir">점</span></p>
														</div>
													</div>
												</div>
											</a>
											<div class="btn-util">
                                                <button type="button" class="button btn-like" rpst-movie-no="23069400">
													<i title="보고싶어 설정 안함" class="iconset ico-heart-toggle-gray"></i>
														348</button>
                                                <div class="case">
                                                    <!-- 개봉 예매가능 기본-->
                                                            <a href="javascript:moveBokdPage(&#39;23069400&#39;);" class="button gblue" title="영화 예매하기">예매</a>
                                                        </div>
                                                </div>
										</li>
									<!-- 각 map 별 첫번째 li 에 first클래스 추가 -->

										<!-- 각 map 별 첫번째 li 에 first클래스 추가 -->
										<li name="li_boxoRankList" class="">
											<a href="javascript:gfn_moveDetail(&#39;23059800&#39;)" class="movie-list-info" title="영화상세 보기">
												<div class="screen-type2">
													</div>
												<p class="rank">4<span class="ir">위</span></p>
												<!-- to 개발 : alt 값에 영화 제목 출력 -->
										      	<img src="./MEET PLAY SHARE, 메가박스_files/yLY9RqwIM1iJLSTnNXrqdI4NDSNN6JLp_420.jpg" alt="그란 투리스모" class="poster" onerror="noImg(this, &#39;main&#39;);">
							                      	<div class="wrap">
													<div class="summary">
														“게임이나 하던 애를 데려다 시속 320km 로켓에 앉히겠다고?”<br><br> <br><br>레이싱 게임 ‘그란 투리스모’의 덕후 ‘잔 마든보로’<br><br>스피드라고는 게임으로만 만족해야 했던 그에게<br><br>레이싱 선수 발굴을 목표로 만들어진 ‘그란 투리스모 콘테스트’라는 기회가 찾아온다.<br><br> <br><br>앉아서 게임만 하던 그의 앞에 닥친 혹독한 훈련과 치열한 경쟁.<br><br>뛰어난 잠재력을 입증해 프로 레이싱 팀에 합류하는데 성공하지만<br><br>상대팀 선수들은 게이머 출신인 그를 인정하지 않고,<br><br>프로 레이싱의 세계는 그를 더욱 거칠게 몰아붙이는데...<br><br> <br><br>리셋 버튼 없는 목숨을 건 실전!<br><br>게이머에서 레이서가 된 소년의 흥미로운 스토리가 스크린에서 펼쳐진다!</div>
													<!--
														관람 전이 더 높을 때
														<div class="my-score small">

														관람 후가 더 높을 때
														<div class="my-score big">

														관람 후가 더 같을 때
														<div class="my-score equal">
													 -->
													<div class="score">
														<div class="preview">
															<p class="tit">관람평</p>
															<p class="number">8.9<span class="ir">점</span></p>
														</div>
													</div>
												</div>
											</a>
											<div class="btn-util">
                                                <button type="button" class="button btn-like" rpst-movie-no="23059800">
													<i title="보고싶어 설정 안함" class="iconset ico-heart-toggle-gray"></i>
														435</button>
                                                <div class="case">
                                                    <!-- 개봉 예매가능 기본-->
                                                            <a href="javascript:moveBokdPage(&#39;23059800&#39;);" class="button gblue" title="영화 예매하기">예매</a>
                                                        </div>
                                                </div>
										</li>
									<!-- 박스오피스 종료 -->
								</ol>
					</div>
					<!--// main-movie-list -->

					<div class="search-link">
						<div class="cell">
							<div class="search">
								<input type="text" placeholder="영화명을 입력해 주세요" title="영화 검색" class="input-text" id="movieName">
								<button type="button" class="btn" id="btnSearch"><i class="iconset ico-search-w"></i> 검색</button>
							</div>
						</div>

						<div class="cell"><a href="https://www.megabox.co.kr/booking/timetable" title="상영시간표 보기"><i class="iconset ico-schedule-main"></i> 상영시간표</a></div>
						<div class="cell"><a href="https://www.megabox.co.kr/movie" title="박스오피스 보기"><i class="iconset ico-boxoffice-main"></i> 박스오피스</a></div>
						<div class="cell"><a href="https://www.megabox.co.kr/booking" title="빠른예매 보기"><i class="iconset ico-quick-reserve-main"></i> 빠른예매</a></div>
					</div>
					<!-- 2019-02-22 추가 : 마우스 아이콘 영역 추가 -->
					<div class="moving-mouse">
						<!--  <i class="iconset ico-mouse"></i> -->
						<img class="iconset" alt="" src="./MEET PLAY SHARE, 메가박스_files/ico-mouse.png" style="top: 2px;">
					</div>
					<!--// 2019-02-22 추가 : 마우스 아이콘 영역 추가 -->
				</div>
				<!--// cont-area  -->
			</div>
			<!--// section main-movie : 영화 -->


			<!-- section main-info : 메가박스 안내 -->
			<div id="main_section04" class="section main-info">

				<h2 class="tit">메가박스 안내</h2>

				<div class="swiper-container info-special swiper-container-initialized swiper-container-horizontal">
						<div class="swiper-wrapper">
							<div class="swiper-slide special-cell swiper-slide-active" style="width: 170px; margin-right: 16px;">
											<a href="https://www.megabox.co.kr/specialtheater/dolby" title="DOLBY CINEMA 페이지로 이동" class="bg-dolby">DOLBY CINEMA</a>
										</div>
									<div class="swiper-slide special-cell swiper-slide-next" style="width: 170px; margin-right: 16px;">
										<a href="https://www.megabox.co.kr/specialtheater/boutique/private" title="THE BOUTIQUE PRIVATE 페이지로 이동" class="bg-private">THE BOUTIQUE PRIVATE</a>
									</div>
								<div class="swiper-slide special-cell" style="width: 170px; margin-right: 16px;">
											<a href="https://www.megabox.co.kr/specialtheater/boutique" title="THE BOUTIQUE 페이지로 이동" class="bg-boutique">THE BOUTIQUE</a>
										</div>
									<div class="swiper-slide special-cell" style="width: 170px; margin-right: 16px;">
											<a href="https://www.megabox.co.kr/specialtheater/mx" title="MX 페이지로 이동" class="bg-mx">MX</a>
										</div>
									<div class="swiper-slide special-cell" style="width: 170px; margin-right: 16px;">
											<a href="https://www.megabox.co.kr/specialtheater/comfort" title="COMFORT 페이지로 이동" class="bg-comfort">COMFORT</a>
										</div>
									<div class="swiper-slide special-cell" style="width: 170px; margin-right: 16px;">
											<a href="https://www.megabox.co.kr/specialtheater/puppy" title="PUPPY CINEMA 페이지로 이동" class="bg-puppy new">PUPPY CINEMA</a>
										</div>
									<div class="swiper-slide special-cell" style="width: 170px; margin-right: 16px;">
											<a href="https://www.megabox.co.kr/specialtheater/megakids" title="MEGABOX KIDS 페이지로 이동" class="bg-kids">MEGABOX KIDS</a>
										</div>
									</div>
				<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>

				<div class="special-control">
					<button type="button" class="special-prev swiper-button-disabled" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
					<button type="button" class="special-next" tabindex="0" role="button" aria-label="Next slide" aria-disabled="false"></button>
				</div>
				<!-- info-notice -->
				<div class="info-notice">
						<div class="wrap">
							<p class="tit">메가박스</p>
							<p class="link">
								<a href="https://www.megabox.co.kr/support/notice/detail?artiNo=10966&amp;bbsNo=9" title="공지사항 상세보기">
									<strong>
										[공지]
									</strong>
									 [메가박스 앱] iOS 12 버전 지원중단 안내</a>
							</p>

							<p class="date">2023.09.19</p>

							<p class="more">
								<a href="https://www.megabox.co.kr/support/notice" title="전체공지 더보기">더보기 <i class="iconset ico-arr-right-gray"></i></a>
							</p>
						</div>
					</div>
				<!--// info-notice -->

				<!-- info-link -->
				<div class="info-link">
					<div class="table">
						<div class="cell">
							<a href="https://www.megabox.co.kr/support" title="고객센터 페이지로 이동">
								<i class="iconset ico-main-customer"></i>
								<span>고객센터</span>
							</a>
						</div>

						<div class="cell">
							<a href="https://www.megabox.co.kr/support/faq" title="자주 묻는 질문 페이지로 이동">
								<i class="iconset ico-main-faq"></i>
								<span>자주 묻는 질문</span>
							</a>
						</div>

						<div class="cell">
							<a href="https://www.megabox.co.kr/support/inquiry" title="1:1 문의 페이지로 이동">
								<i class="iconset ico-main-qna"></i>
								<span>1:1 문의</span>
							</a>
						</div>

						<div class="cell">
							<a href="https://www.megabox.co.kr/support/rent" title="단체/대관문의 페이지로 이동">
								<i class="iconset ico-main-group"></i>
								<span>단체/대관문의</span>
							</a>
						</div>

						<div class="cell">
							<a href="https://www.megabox.co.kr/support/lost" title="분실물 문의/접수 페이지로 이동">
								<i class="iconset ico-main-lost"></i>
								<span>분실물 문의/접수</span>
							</a>
						</div>

						<div class="cell">
							<a href="https://www.megabox.co.kr/booking/privatebooking" title="더 부티크 프라이빗 대관예매 페이지로 이동">
								<i class="iconset ico-main-boutique"></i>
								<span>더 부티크 프라이빗<br>대관예매</span>
							</a>
						</div>
					</div>
				</div>
				<!--// info-link -->
			</div>
			<!--// section main-info : 메가박스 안내 -->

		</div>
	</div>
	<!--// contents -->

</div>
<!--// container -->
	
	<jsp:include page="/WEB-INF/views/footer.jsp"/>
</body>
</html>