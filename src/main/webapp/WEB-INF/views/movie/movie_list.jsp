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
<script src="${pageContext.request.contextPath}/resources/js/movie_list.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/main.css"
	media="all">
<style>
#header.main-header {
	top: 0px;
}
.movie-list ol li .btn-util .case .button {
    background: #792828;
    color: #fff;
}
.movie-list ol li .btn-util .btn-like {
	background: #792828;
    color: #fff;
}
</style>
<script>
$(document).ready(function(){
	//상세정보 이동    
    $(".movieBtn").click(function(){
		
    	//moviecode 가 저장된 data-no 추출
    	var movieCode = this.getAttribute("data-no");
    	console.log("movieCode=" + movieCode);
    	var newURL = "${pageContext.request.contextPath}/movie/movieDetail?movieCode=" + movieCode;
    	
    	window.location.href =newURL;
    	
    });//$("#movieBtn").click(function(){
});
</script>
</head>
<body>

	<jsp:include page="/WEB-INF/views/header.jsp" />

	<!-- container -->
	<div class="container">
		<div class="page-util">
			<div class="inner-wrap">
				<div class="location">
					<span>Home</span> <a href="#"
						title="영화 페이지로 이동">영화</a> <a
						href="#" title="전체영화 페이지로 이동">전체영화</a>
				</div>


			</div>
		</div>

		<!-- contents -->
		<div id="contents" style="padding-top: 100px;">
			<!-- inner-wrap -->
			<div class="inner-wrap">
				<h2 class="tit">전체영화</h2>

				<div class="tab-list fixed">
					<ul id="topMenu">
						<li class="on"><a href="#"
							title="박스오피스 탭으로 이동">박스오피스</a></li>
						<!--  <li><a href="https://www.megabox.co.kr/movie/comingsoon"
							title="상영예정작 탭으로 이동">상영종료작</a></li>
						-->
					</ul>
				</div>

				<!-- movie-list-util -->
				<div class="movie-list-util mt40">
					<!-- 박스오피스 -->
					<div class="topSort" style="display: block;">
						<div class="movie-sorting sortTab">
							<!-- 						<span><button type="button" class="btn on" sort-type="ticketing">예매율순</button></span> -->
							<!-- 						<span><button type="button" class="btn" sort-type="accmAdnc">누적관객순</button></span> -->
							<!-- 						<span><button type="button" class="btn" sort-type="megaScore">메가스코어순</button></span> -->
						</div>

						
					</div>
					<!--// 박스오피스 -->


					<!-- 검색결과 없을 때 -->
					<p class="no-result-count">
						<strong id="totCnt">${fn:length(movieList)}</strong>개의 영화가 검색되었습니다.
					</p>
					<!--// 검색결과 없을 때 -->
					
					<form action="${pageContext.request.contextPath}/movie/movieListPage" method="get" id="searchForm">
					    <div class="movie-search">
					        <input type="text" title="영화명을 입력하세요" id="search_word" name="search_word" placeholder="영화명 검색" class="input-text" value="${search_word}">
					        <button type="button" class="btn-search-input" id="btnSearch">검색</button>
					    </div>
					</form>
				</div>
				<!--// movie-list-util -->

				<div class="bg-loading" style="display: none;">
					<div class="spinner-border" role="status">
						<span class="sr-only">Loading...</span>
					</div>
				</div>

				<!-- movie-list -->
				<div class="movie-list">
					<ol class="list" id="movieList">
					<c:choose>
					    <c:when test="${not empty movieList}">					
					<c:forEach var="m" items="${movieList }" varStatus="loop">
						<li tabindex="0" class="no-img">
							<div class="movie-list-info">
								<p class="rank" style="">
									${loop.index + 1}<span class="ir">위</span>
								</p>
								<a href="#"
										class="wrap movieBtn" data-no="${m.movie_Code}" title="${m.movie_Title} 상세보기">
								<img
									src="${fn:split(m.movie_Poster, '|')[0]}"
									alt="${m.movie_Title}" class="poster">


								<div class="movie-score">
										
										<div class="wrap1" style="display: none; opacity: 1;">
										<div class="summary">
										${m.movie_Plot}
										<div class="my-score big" >
											<div class="preview">
											
												<p class="tit">관람평</p>
												<p class="number">
													7.9<span class="ir">점</span>
												</p>
											</div>
										</div>
										</div>
										</div>
								</div>
									</a>
								
							</div>
							<div class="tit-area">
								<c:choose>
								    <c:when test="${empty m.movie_Grade or m.movie_Grade eq '전체관람가'}">
								        <c:set var="gradeClass" value="age-all" />
								    </c:when>
								    <c:when test="${m.movie_Grade eq '12세이상관람가'}">
								        <c:set var="gradeClass" value="age-12" />
								    </c:when>
								    <c:when test="${m.movie_Grade eq '15세이상관람가'}">
								        <c:set var="gradeClass" value="age-15" />
								    </c:when>
								    <c:when test="${m.movie_Grade eq '청소년관람불가'}">
								        <c:set var="gradeClass" value="age-19" />
								    </c:when>
								    <c:otherwise>
								        <c:set var="gradeClass" value="" />
								    </c:otherwise>
								</c:choose>
								<p class="movie-grade ${gradeClass}">${m.movie_Grade}</p>
								<p title="${m.movie_Title}" class="tit">${m.movie_Title}</p>
							</div>
							<div class="rate-date">
								<span class="rate">예매율 ${m.ratio}%</span> <span class="date">개봉일
									${m.movie_OpenDate}</span>
							</div>
							
							<div class="btn-util">
								<button type="button" class="button btn-like" style="color:#792828"
										rpst-movie-no="${m.movie_Code}">
												<c:if test="${empty m.interest_Status }">
													<img class="dibs_img"
														src="${pageContext.request.contextPath}/resources/image/movie/heart_empty.png"
														style="width: 15px; margin-top:10px; margin-bottom:10px;">
												</c:if>
												<c:if test="${!empty m.interest_Status }">
													<img class="dibs_img"
														src="${pageContext.request.contextPath}/resources/image/movie/heart_full.png"
														style="width: 15px; margin-top:10px; margin-bottom:10px;">
												</c:if>
								 </button>
								<div class="case movieStat4" style="display: block">
									<a href="${pageContext.request.contextPath}/booking?movieCode=${m.movie_Code}	"
										class="button bokdBtn" data-no="${m.movie_Code}" 
										title="영화 예매하기">예매</a>
								</div>
							</div>
							
						</li>
					</c:forEach>
					</c:when>
					<c:otherwise>
						<div class="movie-list-no-result" id="noDataDiv"
							style="display: block;">
							<p>현재 상영중인 영화가 없습니다.</p>
						</div>
					</c:otherwise>
					</c:choose>
					</ol>
				</div>
				<!--// movie-list -->

				<div class="btn-more v1" id="addMovieDiv" style="">
					<button type="button" class="btn" id="btnAddMovie">
						더보기 <i class="iconset ico-btn-more-arr"></i>
					</button>
				</div>

				<!-- 검색결과 없을 때 -->
				


				<!-- 검색결과 없을 때 -->
				<div class="movie-list-no-favor" id="noMyGenre"
					style="display: none;">
					<p>선호장르가 등록되지 않았습니다. 선호하시는 장르를 등록해보세요.</p>
					<div class="btn-group center">
						<a href="https://www.megabox.co.kr/mypage/additionalinfo"
							class="button large purple" title="선호장르설정하기 페이지로 이동">선호장르설정하기</a>
					</div>
				</div>


			</div>
		</div>
	</div>
	<!--// container -->

	<jsp:include page="/WEB-INF/views/footer.jsp" />
</body>
</html>