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
	src="${pageContext.request.contextPath}/resources/js/moviePost_view.js"></script>

<title>MoviePlus: 모두를 위한 영화관</title>

<style>
#modal-delete-btn {
	background: #792828;
	padding: 4px 12px;
	font-size: 12px;
	text-decoration: none;
	color: white;
	border: 1px solid rgba(0, 0, 0, 0.21);
	border-bottom: 4px solid rgba(0, 0, 0, 0.21);
	border-radius: 4px;
	text-shadow: 0 1px 0 rgba(0, 0, 0, 0.15);
	margin: 5px;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp" />

	<div class="container">
		<!-- page-tit-area -->
		<div class="page-util">
			<div class="inner-wrap">
				<div class="location">
					<span>Home</span> <a href="#" title="영화 페이지로 이동">영화</a> <a href="#"
						title="무비포스트 페이지로 이동">무비포스트</a>
				</div>


			</div>
		</div>
		<!--// page-tit-area -->

		<!-- contents -->
		<div id="contents" class="pt00">
			<!-- post lank  -->
			<div class="post-lank-box">
				<div class="inner-wrap">
					<h2 class="tit">무비포스트</h2>
					<!-- post-lank -->
					<ol class="post-lank">

						<c:forEach begin="0" end="4" var="mp_movie"
							items="${mp_movieList}" varStatus='status'>
							<li><a href="#" class="top5Btn"
								data-movieTitle="${mp_movie.movie_Title}"
								title="${mp_movie.movie_Title} 무비포스트 보기">
									<p class="lank">${status.index}</p>

									<div class="post-count">
										<p class="tit">POST</p>
										<p class="count">${mp_movie.post_Count}</p>
									</div>

									<p class="img">
										<img src="${mp_movie.movie_Poster}"
											alt="${mp_movie.movie_Title}">
									</p>
							</a></li>
						</c:forEach>



					</ol>
					<!--// post-lank -->

					<!-- mypost-box -->
					<div class="mypost-box">
						<!-- 로그인 전 -->
						<sec:authorize access="isAnonymous()">
							<div class="before">
								<div class="post-count">
									<p class="tit">MY POST</p>
									<a id="moviepost-login" href="#" class="txt-login"
										title="로그인하기">로그인하기</a>
								</div>
							</div>
						</sec:authorize>

						<sec:authorize access="isAuthenticated()">
							<sec:authentication property="principal" var="pinfo" />
							<div class="after">
								<p class="lank">My</p>
								<div class="post-count">
									<p class="tit">MY POST</p>
									<p class="count">${myPostCnt}</p>
								</div>
								<div class="txt-info">
									<c:choose>
										<c:when test="${myPostCnt > 0}">
											<a
												href="${pageContext.request.contextPath}/member/mypage/moviestory"
												style="color: white;">내 글보기로 이동</a>
										</c:when>
										<c:otherwise>
											작성된 포스트가<br> 없습니다.
										</c:otherwise>
									</c:choose>

								</div>
							</div>
						</sec:authorize>


					</div>
					<!--// mypost-box -->

					<!-- add-post -->
					<sec:authorize access="isAnonymous()">
						<div class="add-post">
							<a id="add-moviepost-none-login"
								href="${pageContext.request.contextPath}/moviepost/selectMovie"
								class="button purple" title="무비포스트 작성" style="">무비포스트 작성</a>
						</div>
					</sec:authorize>
					<sec:authorize access="isAuthenticated()">
						<div class="add-post">
							<a id=""
								href="${pageContext.request.contextPath}/moviepost/selectMovie"
								class="button purple" title="무비포스트 작성" style="">무비포스트 작성</a>
						</div>
					</sec:authorize>

					<!--// add-post -->
				</div>
			</div>
			<!--// post lank -->

			<!--content:Start -->
			<div class="inner-wrap mt30">
				<div class="board-list-util">
					<p class="result-count">
						<strong>전체 <b id="totalCnt" class="result-count-cnt">${totalCnt}</b>건
						</strong>
					</p>

					<div class="sorting" id="sortTab">
						<span><button type="button" class="btn on"
								id="sort-date-btn">최신순</button></span> <span><button
								type="button" class="btn" id="sort-like-btn">공감순</button></span>
					</div>

					<div class="board-search">
						<input type="text" id="ibxMovieNmSearch" name="ibxMovieNmSearch"
							title="검색어를 입력해 주세요." placeholder="영화 제목" class="input-text"
							value=""> <input type="hidden" id="moviePostId"
							name="moviePostId" value="">
						<button type="button" class="btn-search-input" id="btnSearch">검색</button>
					</div>
				</div>



				<!-- movie-post-list -->
				<div class="movie-post-list" id="moviePostList"
					style="position: relative; height: 1300px;">
					<!--  -->

				</div>


				<div class="btn-more" style="">
					<button type="button" class="btn" id="btnAddMovie">
						더보기 <i class="iconset ico-btn-more-arr"></i>
					</button>
				</div>

			</div>
			<!--content:End -->
		</div>
		<!--// contents -->

		<!-- 무비포스트 상세 레이어팝업 -->

		<!--################# 무비포스트 상세 레이어팝업으로 변경 ###########################  -->
		<section id="layer_post_detail" class="modal-layer2"
			style="z-index: 501;">
			<a href="" class="focus">레이어로 포커스 이동 됨</a>
			<div class="wrap"
				style="width: 850px; margin-left: -425px; margin-top: 0px; margin-bottom: 100px; top: 100px;">
				<header class="layer-header">
					<h3 class="tit">무비포스트 상세</h3>
				</header>

				<div class="layer-con">

					<div class="post-detail">
						<div class="tit-area mb30">
							<p id="modal-movie-title" class="tit"></p>
						</div>


						<div class="user-post-box mb40">
							<div class="user-post-case">
								<!-- post-top-area -->
								<div class="post-top-area">

									<div class="user-info">
										<p class="photo">
											<img id="modal-profile"
												src="/static/pc/images/common/bg/bg-noimage-notmain.png"
												alt="님의 무비포스트">
										</p>

										<p id="modal-user-id" class="user-id"></p>

										<p id="modal-date" class="user-write-time"></p>
									</div>



									<!-- post-funtion -->
									<div class="post-funtion">
										<div class="wrapper">
											<input type="hidden" id="hidden-member-id"
												value="${pinfo.MEMBER_ID}">
											<button id="modal-delete-btn" type="button" class=""
												style="display: none">삭제하기</button>
										</div>
									</div>
									<!--// post-funtion -->
								</div>
								<!--// post-top-area -->

								<div class="post-cont-area">
									<!-- post 내용  -->
									<div class="section-area">
										<div class="section">
											<img id="modal-still" src="" alt="">
											<p id="modal-content" class="p-caption"></p>
										</div>
									</div>
									<!--// post 내용 -->
								</div>

								<!-- comment count -->
								<div class="count">
									<button id="modal-like-btn" type="button" class="btn"
										data-postNum="">
										<i id="modal-like-icon" title="좋아요 설정 안함"
											class="iconset ico-like"></i> <span id="modal-like-cnt">0</span>
									</button>


								</div>
								<!--// comment count -->



							</div>
						</div>


						<!-- share -->
						<!-- comment input -->
						<div class="comment-write mb40" id="rly">
							<div class="comment-util mb20">
								<p>
									<span id="rlyCnt">댓글 (0)</span>
								</p>
								<input type="hidden" id="rlyCntTop" value="0"> <input
									type="hidden" id="hdnMoviePostNo" value="236678">
							</div>

							<div class="comment" id="input-comment">
								<textarea class="input-textarea" cols="5" rows="5"
									id="postRlyCn" title="댓글 입력" name="postRlyCn" maxlength="100"></textarea>

								<div class="comment-function">
									<p class="reset">
										<span id="comm-length" class="text-count">0</span> / 100
									</p>
									<div class="btn">
										<button type="button" id="btnPostRly">등록</button>
									</div>
								</div>
							</div>
						</div>
						<!--// comment input-->

						<!-- comment list -->
						<div class="comment-list" id="commentList"></div>
						<!--// comment list -->

						<div class="mb50"></div>

					</div>
				</div>
				<button type="button" id="post-modal-close" class="btn-modal-close2">레이어
					닫기</button>
			</div>
			<div class="bg-modal2" style="opacity: 1;"></div>
		</section>
		<!-- // ################# 무비포스트 상세 레이어팝업으로 변경 ###########################  -->
		<!-- //무비포스트 상세 레이어팝업 -->
	</div>



	<jsp:include page="/WEB-INF/views/footer.jsp" />


</body>
</html>