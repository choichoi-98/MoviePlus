<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="${pageContext.request.contextPath}/resources/js/jquery-3.7.0.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/moviestory.js"></script>
<title>MoviePlus: 모두를 위한 영화관</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp" />
	<jsp:include page="/WEB-INF/views/mypage_sidebar.jsp" />


	<!-- 컨텐츠 영역 -->
	<div id="contents">
		<h2 class="tit">나의 무비스토리</h2>



		<div class="tab-block mb30">
			<ul>
				<li class=""><a
					href="#" class="btn"
					data-tab="tab-mp" title="무비포스트 탭으로 이동">무비포스트</a></li>
				<li class=""><a
					href="#" class="btn"
					data-tab="tab-mc" title="관람평 탭으로 이동">관람평</a></li>
				<li class=""><a
					href="#" class="btn"
					data-tab="tab-sm" title="본영화 탭으로 이동">본영화</a></li>
				<li class=""><a
					href="#" class="btn"
					data-tab="tab-wm" title="보고싶어 탭으로 이동">보고싶어</a></li>
			</ul>
		</div>

		<!-- 나의 무비포스트 -->
		<div id="tab-mp" class="my-movie-post myMoviePost myMovieStory moviestory_tab"
			style="display: block;">

			<!-- movie-list-util -->
			<div class="movie-list-util">
				<p class="result-count  line32">
					<strong>총 <b class="font-gblue" id="myMoviePostCnt">0</b>
						건
					</strong>
				</p>
			</div>
			<!--// movie-list-util -->

			<div class="movie-post-list" id="moviePostList">
				<div class="no-moviepost">등록된 무비포스트가 없습니다.</div>
			</div>
		</div>
		<!--// 나의 무비포스트 -->

	
		
		<!-- 나의 한줄평 -->
		<div id="tab-mc" class="board-list-util myOne myMovieStory moviestory_tab" style="display: none;">
			<p class="result-count">
				<strong>총 <b class="font-gblue" id="myOneCnt">0</b> 건
				</strong>
			</p>
		</div>

		
		<div class="my-appraisal myOne myMovieStory" style="display: none;">
			<ul id="myAppraisal">
				<li class="no-result">등록된 한줄평이 없습니다.</li>
			</ul>
		</div>

		<!--// 나의 한줄평 -->


		<!-- 나의 본영화 -->
		<div id="tab-sm" class="mypage-infomation mt20 mySeenMovie myMovieStory moviestory_tab"
			style="display: block;">

		</div>

		<div class="board-list-util mySeenMovie myMovieStory"
			style="display: none;">
			<p class="result-count">
				<strong>총 <b class="font-gblue" id="mySeenMovieCnt">0</b> 건
				</strong>
			</p>
		</div>

		<!-- my-saw-movie -->
		<div class="my-saw-movie mt10 mySeenMovie myMovieStory"
			style="display: none;">
			<ul id="mySawMovie">
				<li class="no-result">관람 내역이 없습니다.</li>
			</ul>
		</div>
		<!--// my-saw-movie -->
		<!--// 나의 본영화 -->



		<!--// 나의 보고싶어 -->
		<!-- my-movie-list -->
		<div id="tab-wm" class="my-movie-list myLikeMovie myMovieStory moviestory_tab"
			style="display: none;">
			<div class="board-list-util">
				<p class="result-count">
					<strong>총 <b class="font-gblue" id="totalCnt">0</b>건
					</strong>
				</p>
			</div>

			<div class="movie-list myLikeMovie myMovieStory"
				style="display: none;">
				<ol class="list" id="movieList"></ol>
			</div>

			<div class="more-movie-list pt30 myLikeMovie myMovieStory"
				style="display: none;">
				<button type="button" class="button btn-more-like-list">
					더보기 <i class="iconset ico-btn-more-arr"></i>
				</button>
			</div>

		</div>
		<!--// my-movie-list -->

		<!-- 보고싶어 영화 없을 때 -->
		<div class="no-my-movie-list myLikeMovie myMovieStory" id="noDataDiv"
			style="display: none;">
			<i class="iconset ico-movie-see"></i>
			<p>보고싶은 영화를 담아주세요.</p>
		</div>
		<!--// 나의 보고싶어 -->
	</div>

	</div>
	</div>


	<jsp:include page="/WEB-INF/views/footer.jsp" />
</body>
</html>