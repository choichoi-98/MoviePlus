<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
.listBtn {
	pointer-events: none;
}
</style>
<script
	src="${pageContext.request.contextPath}/resources/js/jquery-3.7.0.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/moviePost_view.js"></script>


<title></title>

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


						<li><a href="#" class="top5Btn" data-no="더 퍼스트 슬램덩크"
							title="더 퍼스트 슬램덩크 무비포스트 보기">
								<p class="lank">1</p>

								<div class="post-count">
									<p class="tit">POST</p>
									<p class="count">877</p>
								</div>

								<p class="img">
									<img
										src="./모든영화 _ 무비포스트 _ MEET PLAY SHARE, 메가박스_files/XzaJQVMME9uYLyqeXsmasMOIHOV5ccOB_150.jpg"
										alt="더 퍼스트 슬램덩크">
								</p>
						</a></li>



						<li><a href="#" class="top5Btn" data-no="스즈메의 문단속"
							title="스즈메의 문단속 무비포스트 보기">
								<p class="lank">2</p>

								<div class="post-count">
									<p class="tit">POST</p>
									<p class="count">761</p>
								</div>

								<p class="img">
									<img
										src="./모든영화 _ 무비포스트 _ MEET PLAY SHARE, 메가박스_files/jpVJy55iJTCzSxRk3NhLedZQnBo3xtVl_150.jpg"
										alt="스즈메의 문단속">
								</p>
						</a></li>


					</ol>
					<!--// post-lank -->














					<!-- mypost-box -->
					<div class="mypost-box">
						<!-- 로그인 전 -->
						<sec:authorize access="isAnonymous()">
							<div class="before">
								<div class="post-count">
									<p class="tit">MY POST</p>
									<a href="#" class="txt-login" title="로그인하기">로그인하기</a>
								</div>
							</div>
						</sec:authorize>

						<sec:authorize access="isAuthenticated()">
							<div class="after">
								<p class="lank">My</p>
								<div class="post-count">
									<p class="tit">MY POST</p>
									<p class="count">0</p>
								</div>
								<div class="txt-info">
									작성된 포스트가<br> 없습니다.
								</div>
							</div>
						</sec:authorize>


					</div>
					<!--// mypost-box -->

					<!-- add-post -->
					<div class="add-post">
						<a href="${pageContext.request.contextPath}/moviepost/selectMovie"
							class="button purple" title="무비포스트 작성" style="background">무비포스트 작성</a>
					</div>
					<!--// add-post -->
				</div>
			</div>
			<!--// post lank -->

			<!--content:Start -->
			<div class="inner-wrap mt30">
				<div class="board-list-util">
					<p class="result-count">
						<strong>전체 <b class="result-count-cnt">217,171</b>건
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
											<img id="modal-profile" src="/static/pc/images/common/bg/bg-noimage-notmain.png"
												alt="님의 무비포스트">
										</p>

										<p id="modal-user-id" class="user-id">Pty873**</p>

										<p id="modal-date" class="user-write-time">42 분전</p>
									</div>



									<!-- post-funtion -->
									<div class="post-funtion">
										<div class="wrapper">
											<button type="button" class="">삭제하기</button>
											<!--// 말풍선 -->
										</div>
									</div>
									<!--// post-funtion -->
								</div>
								<!--// post-top-area -->

								<div class="post-cont-area">
									<!-- post 내용  -->
									<div class="section-area">
										<div class="section">
											<img id="modal-still"
												src=""
												alt="">
											<p id="modal-content" class="p-caption"></p>
										</div>
									</div>
									<!--// post 내용 -->
								</div>

								<!-- comment count -->
								<div class="count">
									<button id="modal-like-btn" type="button" class="btn" data-postNum="236678">
										<i title="좋아요 설정 안함" class="iconset ico-like"></i> 0
									</button>

									<!-- 코멘트 등록 영역으로 이동 -->

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
										<span class="text-count">0</span> / 100
									</p>
									<div class="btn">
										<button type="button" id="btnPostRly">등록</button>
									</div>
								</div>
							</div>
						</div>
						<!--// comment input-->

						<!-- comment list -->
						<div class="comment-list" id="commentList">



							<form id="movieForm" method="get"></form>


						</div>
						<!--// comment list -->

						<div class="mb50"></div>

					</div>
				</div>
				<button type="button" id="post-modal-close" class="btn-modal-close2">레이어 닫기</button>
			</div>
			<div class="bg-modal2" style="opacity: 1;"></div>
		</section>
		<!-- // ################# 무비포스트 상세 레이어팝업으로 변경 ###########################  -->
		<!-- //무비포스트 상세 레이어팝업 -->
	</div>



	<jsp:include page="/WEB-INF/views/footer.jsp" />


</body>
</html>