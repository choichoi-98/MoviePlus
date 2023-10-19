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
				<li class=""><a href="#" class="btn" data-tab="tab-mp"
					title="무비포스트 탭으로 이동">무비포스트</a></li>
				<li class=""><a href="#" class="btn" data-tab="tab-mc"
					title="관람평 탭으로 이동">관람평</a></li>
				<li class=""><a href="#" class="btn" data-tab="tab-sm"
					title="본영화 탭으로 이동">본영화</a></li>
				<li class=""><a href="#" class="btn" data-tab="tab-wm"
					title="보고싶어 탭으로 이동">보고싶어</a></li>
			</ul>
		</div>

		<!-- 나의 무비포스트 -->
		<div id="tab-mp"
			class="my-movie-post myMoviePost myMovieStory moviestory_tab"
			style="display: none;">

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

		<div id="tab-mc" class="moviestory_tab" style="display: none;">
			<div class="board-list-util myOne myMovieStory"
				style="display: block;">
				<p class="result-count">
					<strong>총 <b class="font-gblue" id="myOneCnt">0</b> 건
					</strong>
				</p>
			</div>


			<div class="my-appraisal myOne myMovieStory" style="display: block;">
				<ul id="myAppraisal">
					<!-- <li class="no-result">등록된 한줄평이 없습니다.</li> -->
					<li>
						<p class="img posterImg" data-mno="01573800"
							style="cursor: pointer">
							<img
								src="https://img.megabox.co.kr/SharedImg/asis/system/mop/poster/2019/08/2A0450-B477-4367-A065-85236F25C540.medium.jpg"
								onerror="noImg(this)" alt="(자막) 토이 스토리 4">
						</p>
						<div class="cont">
							<p class="tit">
								<a href="javaScript:void(0)" title="한줄평 상세보기">(자막) 토이 스토리 4</a>
							</p>
							<div class="rate">
								<p class="num review">10</p>
								<div class="case">
									<p>스토리</p>
								</div>
							</div>
							<p class="txt oneData">chlrhldml dudghk cncjsgkqslek.</p>
							<div class="modify-area updateData" style="display: none;">
								<textarea rows="5" cols="30" title="한줄평 수정 내용 입력"
									class="input-textarea">chlrhldml dudghk cncjsgkqslek.</textarea>
							</div>
							<div class="util">
								<div class="left">
									<button type="button" title="좋아요 수" class="like likeBtn"
										data-no="2475551" data-cd="PREV">
										<i class="iconset ico-like"></i> 0
									</button>
									<p class="date">2 일전</p>
								</div>
								<div class="right">
									<span><button type="button" id="updateRealCommentBtn"
											class="btn modify updateBtn" data-no="2475551"
											data-mno="01573800" data-cd="PREV">수정</button></span> <span><button
											type="button" class="btn del deleteBtn" data-no="2475551"
											data-mno="01573800" data-cd="PREV">삭제</button></span>
								</div>
							</div>
						</div>
					</li>
				</ul>
			</div>
		</div>

		<!--// 나의 한줄평 -->


		<!-- 나의 본영화 -->
		<div id="tab-sm"
			class="mypage-infomation mt20 mySeenMovie myMovieStory moviestory_tab"
			style="display: none;">

			<div class="board-list-util mySeenMovie myMovieStory"
				style="display: block;">
				<p class="result-count">
					<strong>총 <b class="font-gblue" id="mySeenMovieCnt">0</b>
						건
					</strong>
				</p>
			</div>

			<!-- my-saw-movie -->
			<div class="my-saw-movie mt10 mySeenMovie myMovieStory"
				style="display: block;">
				<ul id="mySawMovie">
					<!-- <li class="no-result">관람 내역이 없습니다.</li> -->
					<li>
						<p class="img posterImg" data-mno="01671700"
							style="cursor: pointer">
							<img
								src="https://img.megabox.co.kr/SharedImg/asis/system/mop/poster/2020/6F/7D3A85-E138-4D71-859F-2FF5A853BC32.medium.jpg"
								alt="[S] 타오르는 여인의 초상">
						</p>
						<div class="cont">
							<p class="tit">
								<a href="javaScript:void(0)" title="[S] 타오르는 여인의 초상 상세보기">[S]
									타오르는 여인의 초상</a>
							</p>
							<div class="theater">
								<p>동대문</p>
								<p>8관</p>
								<p>2020.01.24(금) 17:35 (5회차)</p>
							</div>
						</div>
						<div class="btn-group">
							<a href="#" class="btn review moveOneBtn" title="관람평쓰기"
								data-no="01671700" data-at="N"><i class="iconset ico-pencil"></i>
								관람평쓰기</a> <a href="#" class="btn post movePostBtn" title="포스트쓰기"
								data-no="01671700" data-postno="null"><i
								class="iconset ico-pencil"></i>포스트쓰기</a>
							<button type="button" class="btn del deleteBtn"
								data-no="81046932">삭제</button>
						</div>
					</li>
				</ul>
			</div>
		</div>
		<!--// my-saw-movie -->
		<!--// 나의 본영화 -->



		<!--// 나의 보고싶어 -->
		<!-- my-movie-list -->
		<div id="tab-wm"
			class="my-movie-list myLikeMovie myMovieStory moviestory_tab"
			style="display: none;">
			<div class="board-list-util">
				<p class="result-count">
					<strong>총 <b class="font-gblue" id="totalCnt">${ms_movieCnt}</b>건
					</strong>
				</p>
			</div>

			<div class="movie-list myLikeMovie myMovieStory"
				style="display: block;">
				<ol class="list" id="movieList">
					<c:forEach var="ms_movie" items="${ms_movieList}">
						<li tabindex="0" class="no-img">
							<div class="movie-list-info">
								<img src="${ms_movie.movie_Poster}"
									alt="${ms_movie.movie_Title}" class="poster lozad"> <a
									href="${pageContext.request.contextPath}/movie/movieDetail?movieCode=${ms_movie.movie_Code}"
									class="wrap movieBtn" data-movieCode="${ms_movie.movie_Code}"
									title="${ms_movie.movie_Title} 상세보기"> </a>
							</div>
							<div class="tit-area">
								<p class="movie-grade age-all">,</p>
								<p title="${ms_movie.movie_Title}" class="tit">
									<a
										href="${pageContext.request.contextPath}/movie/movieDetail?movieCode=${ms_movie.movie_Code}"
										title="${ms_movie.movie_Title}">${ms_movie.movie_Title}</a>
								</p>
							</div>
							<div class="btn-util">
								<button type="button" class="button btn-like"
									data-movieCode="${ms_movie.movie_Code}">
									<i title="보고싶어 함" class="iconset ico-heart-toggle-gray on"></i>
									<span>3.3k</span>
								</button>
								<div class="case movieStat4" style="">
									<a
										href="${pageContext.request.contextPath}/booking?movieCode=${ms_movie.movie_Code}"
										class="button purple bokdBtn"
										data-movieCode="${ms_movie.movie_Code}" title="영화 예매하기">예매</a>
								</div>
							</div>
						</li>
					</c:forEach>


				</ol>
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