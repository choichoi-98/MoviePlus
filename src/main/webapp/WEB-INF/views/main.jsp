<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MoviePlus: 모두를 위한 영화관</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/main.css"
	media="all">
<style>
#header.main-header {
	top: 0px;
}

.button.gblue {
	color: #fff;
	line-height: 36px;
	border: 0;
	background: #792828;
}
</style>

<script>
$(function() {
    $("#btnSearch").click(function() {
        $("#searchForm").submit();
    });
});

</script>
</head>

</head>
<body>
	<!-- 
document.ready
-> ajax로 처리
	url 주소를 http://localhost:9000/movieplus/movie로
 -->
	<jsp:include page="/WEB-INF/views/header.jsp" />

	<div class="container main-container area-ad">

		<!-- contents -->
		<div id="contents">

			<!-- main-page -->
			<div class="main-page">

				<!-- section main-movie : 영화 -->
				<div id="main_section01" class="section main-movie on">
					<div class="bg">
						<div class="bg-pattern"></div>
					</div>

					<!-- cont-area  -->
					<div class="cont-area">

						<!-- tab-sorting -->
						<div class="tab-sorting" style="margin-top: 130px">
							<button type="button" class="on" sort="boxoRankList"
								name="btnSort">박스오피스</button>
						</div>
						<!-- tab-sorting -->

						<a href="https://www.megabox.co.kr/movie" class="more-movie"
							title="더 많은 영화보기" style="top: 140px;"> 더 많은 영화보기 <i
							class="iconset ico-more-corss gray"></i>
						</a>

						<!-- main-movie-list -->
						<div class="main-movie-list">
							<ol class="list">
								<!-- 3개의 list를  loop 한다-->
								<!-- 박스오피스 시작 -->
								<!-- 각 map 별 첫번째 li 에 first클래스 추가 -->

								<!-- 각 map 별 첫번째 li 에 first클래스 추가 -->
								<c:forEach var="m" items="${movieList}" begin="0" end="3"
									varStatus="loop">
									<li name="li_boxoRankList" class="first"
										style="border-right-width: 50px‒; padding-right: 0px; border-right-width: 50px; margin-right: 30px;">
										<a href="javascript:gfn_moveDetail('${m.movie_Code}')"
										class="movie-list-info" title="영화상세 보기">
											<div class="screen-type2">
												<p></p>
											</div>
											<p class="rank">${loop.index + 1}<span class="ir">위</span>
											</p> <!-- to 개발 : alt 값에 영화 제목 출력 --> 
											<img
											src="${fn:split(m.movie_Poster, '|')[0]}"
											alt="${m.movie_Title}" class="poster"
											onerror="noImg(this, 'main');">
											<div class="wrap" style="display: none; opacity: 1;">
												<div class="summary">${m.movie_Plot}</div>
												<div class="score">
													<div class="preview">
														<p class="tit">관람평</p>
														<p class="number">
															0<span class="ir">점</span>
														</p>
													</div>
												</div>
												
											</div>
									</a>
										<div class="btn-util">
											<button type="button" class="button btn-like"
												rpst-movie-no="${m.movie_Code}">
												<c:if test="${empty m.MOVIE_DIBS_OBJECT }">
													<img class="dibs_img"
														src="${pageContext.request.contextPath}/resources/image/movie/heart_empty.png"
														style="width: 15px">
												</c:if>
												<c:if test="${!empty m.MOVIE_DIBS_OBJECT }">
													<img class="dibs_img"
														src="${pageContext.request.contextPath}/resources/image/movie/heart_full.png"
														style="width: 15px">
												</c:if>
											</button>
											<div class="case">
												<!-- 개봉 예매가능 기본-->
												<a href="javascript:moveBokdPage('${m.movie_Code}');"
													class="button gblue" title="영화 예매하기">예매</a>
											</div>
										</div>
									</li>
								</c:forEach>

								<!-- 박스오피스 종료 -->
							</ol>
						</div>
						<!--// main-movie-list -->

						<div class="search-link">
							<div class="cell">
							<form action="${pageContext.request.contextPath}/movie/movieListPage" method="get" id="searchForm">
								<div class="search">
									<input type="text" title="영화명을 입력하세요" 
									 id="search_word" name="search_word"
									  placeholder="영화명 검색" class="input-text" value="${search_word}">
									<button type="button" class="btn" id="btnSearch">
										<i class="iconset ico-search-w"></i> 검색
									</button>
								</div>
							</form>
							</div>

							<div class="cell">
								<a href="https://www.megabox.co.kr/booking/timetable"
									title="상영시간표 보기"><i class="iconset ico-schedule-main"></i>
									상영시간표</a>
							</div>
							<div class="cell">
								<a href="https://www.megabox.co.kr/movie" title="박스오피스 보기"><i
									class="iconset ico-boxoffice-main"></i> 박스오피스</a>
							</div>
							<div class="cell">
								<a href="https://www.megabox.co.kr/booking" title="빠른예매 보기"><i
									class="iconset ico-quick-reserve-main"></i> 빠른예매</a>
							</div>
						</div>

					</div>
					<!--// cont-area  -->
				</div>
				<!--// section main-movie : 영화 -->


				<!-- section main-info : 메가박스 안내 -->
				<div id="main_section04" class="section main-info">

					<h2 class="tit">메가박스 안내</h2>

					<div
						class="swiper-container info-special swiper-container-initialized swiper-container-horizontal">
						<div class="swiper-wrapper">
							<div class="swiper-slide special-cell swiper-slide-active"
								style="width: 170px; margin-right: 16px;">
								<a href="https://www.megabox.co.kr/specialtheater/dolby"
									title="DOLBY CINEMA 페이지로 이동" class="bg-dolby">DOLBY CINEMA</a>
							</div>
							<div class="swiper-slide special-cell swiper-slide-next"
								style="width: 170px; margin-right: 16px;">
								<a
									href="https://www.megabox.co.kr/specialtheater/boutique/private"
									title="THE BOUTIQUE PRIVATE 페이지로 이동" class="bg-private">THE
									BOUTIQUE PRIVATE</a>
							</div>
							<div class="swiper-slide special-cell"
								style="width: 170px; margin-right: 16px;">
								<a href="https://www.megabox.co.kr/specialtheater/boutique"
									title="THE BOUTIQUE 페이지로 이동" class="bg-boutique">THE
									BOUTIQUE</a>
							</div>
							<div class="swiper-slide special-cell"
								style="width: 170px; margin-right: 16px;">
								<a href="https://www.megabox.co.kr/specialtheater/mx"
									title="MX 페이지로 이동" class="bg-mx">MX</a>
							</div>
							<div class="swiper-slide special-cell"
								style="width: 170px; margin-right: 16px;">
								<a href="https://www.megabox.co.kr/specialtheater/comfort"
									title="COMFORT 페이지로 이동" class="bg-comfort">COMFORT</a>
							</div>
							<div class="swiper-slide special-cell"
								style="width: 170px; margin-right: 16px;">
								<a href="https://www.megabox.co.kr/specialtheater/puppy"
									title="PUPPY CINEMA 페이지로 이동" class="bg-puppy new">PUPPY
									CINEMA</a>
							</div>
							<div class="swiper-slide special-cell"
								style="width: 170px; margin-right: 16px;">
								<a href="https://www.megabox.co.kr/specialtheater/megakids"
									title="MEGABOX KIDS 페이지로 이동" class="bg-kids">MEGABOX KIDS</a>
							</div>
						</div>
						<span class="swiper-notification" aria-live="assertive"
							aria-atomic="true"></span>
					</div>

					<div class="special-control">
						<button type="button" class="special-prev swiper-button-disabled"
							tabindex="0" role="button" aria-label="Previous slide"
							aria-disabled="true"></button>
						<button type="button" class="special-next" tabindex="0"
							role="button" aria-label="Next slide" aria-disabled="false"></button>
					</div>
					<!-- info-notice -->
					<div class="info-notice">
						<div class="wrap">
							<p class="tit">메가박스</p>
							<p class="link">
								<a
									href="https://www.megabox.co.kr/support/notice/detail?artiNo=10966&amp;bbsNo=9"
									title="공지사항 상세보기"> <strong> [공지] </strong> [메가박스 앱] iOS 12
									버전 지원중단 안내
								</a>
							</p>

							<p class="date">2023.09.19</p>

							<p class="more">
								<a href="https://www.megabox.co.kr/support/notice"
									title="전체공지 더보기">더보기 <i class="iconset ico-arr-right-gray"></i></a>
							</p>
						</div>
					</div>
					<!--// info-notice -->

					<!-- info-link -->
					<div class="info-link">
						<div class="table">
							<div class="cell">
								<a href="https://www.megabox.co.kr/support" title="고객센터 페이지로 이동">
									<i class="iconset ico-main-customer"></i> <span>고객센터</span>
								</a>
							</div>

							<div class="cell">
								<a href="https://www.megabox.co.kr/support/faq"
									title="자주 묻는 질문 페이지로 이동"> <i class="iconset ico-main-faq"></i>
									<span>자주 묻는 질문</span>
								</a>
							</div>

							<div class="cell">
								<a href="https://www.megabox.co.kr/support/inquiry"
									title="1:1 문의 페이지로 이동"> <i class="iconset ico-main-qna"></i>
									<span>1:1 문의</span>
								</a>
							</div>

							<div class="cell">
								<a href="https://www.megabox.co.kr/support/rent"
									title="단체/대관문의 페이지로 이동"> <i class="iconset ico-main-group"></i>
									<span>단체/대관문의</span>
								</a>
							</div>

							<div class="cell">
								<a href="https://www.megabox.co.kr/support/lost"
									title="분실물 문의/접수 페이지로 이동"> <i class="iconset ico-main-lost"></i>
									<span>분실물 문의/접수</span>
								</a>
							</div>

							<div class="cell">
								<a href="https://www.megabox.co.kr/booking/privatebooking"
									title="더 부티크 프라이빗 대관예매 페이지로 이동"> <i
									class="iconset ico-main-boutique"></i> <span>더 부티크 프라이빗<br>대관예매
								</span>
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

	<jsp:include page="/WEB-INF/views/footer.jsp" />
</body>
</html>