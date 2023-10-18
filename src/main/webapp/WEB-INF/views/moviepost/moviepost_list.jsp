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
<script src="${pageContext.request.contextPath}/resources/js/theater.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/favorite_theater.js"></script>


<title></title>

</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp" />

	<div class="container">
		<!-- page-tit-area -->
		<div class="page-util">
			<div class="inner-wrap">
				<div class="location">
					<span>Home</span> <a href="#"
						title="영화 페이지로 이동">영화</a> <a
						href="#"
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


						<li><a href="#"
							class="top5Btn" data-no="더 퍼스트 슬램덩크" title="더 퍼스트 슬램덩크 무비포스트 보기">
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



						<li><a href="#"
							class="top5Btn" data-no="스즈메의 문단속" title="스즈메의 문단속 무비포스트 보기">
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
						<div class="before">
							<div class="post-count">
								<p class="tit">MY POST</p>
								<a
									href="javaScript:fn_viewLoginPopup(&#39;default&#39;,&#39;pc&#39;);"
									class="txt-login" title="로그인하기">로그인하기</a>
							</div>
						</div>


					</div>
					<!--// mypost-box -->

					<!-- add-post -->
					<div class="add-post">
						<a href="https://www.megabox.co.kr/moviepost/all#"
							class="button purple" title="무비포스트 작성">무비포스트 작성</a>
					</div>
					<!--// add-post -->
				</div>
			</div>
			<!--// post lank -->

			<!--content:Start -->
			<div class="inner-wrap mt30">
				<div class="tab-sorting mb40">
					<button type="button" class="on" data-type="all">모든영화</button>
					<button type="button" data-type="live">현재상영작</button>


				</div>

				<div class="board-list-util">
					<p class="result-count">
						<strong>전체 <b class="result-count-cnt">217,171</b>건
						</strong>
					</p>

					<div class="sorting" id="sortTab">
						<span><button type="button" class="btn on" sort-type="date">최신순</button></span>
						<span><button type="button" class="btn" sort-type="like">공감순</button></span>
					</div>

					<div class="board-search">
						<input type="text" id="ibxMovieNmSearch" name="ibxMovieNmSearch"
							title="검색어를 입력해 주세요." placeholder="제목, 장르, 감독, 배우, 아이디"
							class="input-text" value=""> <input type="hidden"
							id="moviePostId" name="moviePostId" value="">
						<button type="button" class="btn-search-input" id="btnSearch">검색</button>
					</div>
				</div>

				<!-- 2019-04-19 : 무비 포스트 완전 바뀜. 재작업 -->
				<!-- movie-post-list -->
				<div class="movie-post-list" id="moviePostList"
					style="position: relative; height: 1278.21px;">
					<div class="grid-item"
						style="position: absolute; left: 0px; top: 0px;">
						<div class="wrap">
							<div class="img">
								<a
									href="https://www.megabox.co.kr/moviepost/all#layer_post_detail"
									title="무비포스트 상세보기" class="post-detailPopup btn-modal-open2"
									w-data="850" h-data="auto" data-no="236655" data-row="1"
									data-tot="217171" data-url=""><img
									src="./모든영화 _ 무비포스트 _ MEET PLAY SHARE, 메가박스_files/wVxaffK0ilRKw19ikq2M8KCHUR8DRd46_230.jpg"
									alt="나의 행복한 결혼" onerror="noImg(this);"> /&gt;</a>
							</div>
							<div class="cont">
								<div class="writer">
									<a href="https://www.megabox.co.kr/moviepost/all#"
										title="inholee**님의 무비포스트 보기" class="moviePostId"
										data-id="AF9D0CF8-958D-4ED0-9184-5B871B32CEA3">inholee**</a>
								</div>
								<a
									href="https://www.megabox.co.kr/movie-detail?rpstMovieNo=23070800"
									title="나의 행복한 결혼 상세보기">
									<p class="tit">나의 행복한 결혼</p>
								</a> <a
									href="https://www.megabox.co.kr/moviepost/all#layer_post_detail"
									title="무비포스트 상세보기"
									class="link btn-modal-open2 post-detailPopup" w-data="850"
									h-data="auto" data-no="236655" data-row="1" data-tot="217171">
									<p class="txt">신데렐라와 일본신화적 요소가 결합된 판타지물</p>
									<p class="time">1 시간전</p>
								</a>
								<div class="condition">
									<button type="button"
										class="btn-like postLikeBtn listBtn jsMake" data-no="236655">
										<i class="iconset ico-like">좋아요 수</i> <span class="none">0</span>
									</button>
									<a
										href="https://www.megabox.co.kr/moviepost/all#layer_post_detail"
										title="댓글 작성하기"
										class="link btn-modal-open2 post-detailRlyPopup" w-data="850"
										h-data="auto" data-no="236655" data-row="1" data-tot="217171"><i
										class="iconset ico-reply">댓글 수</i> 0</a>
								</div>
							</div>
						</div>
					</div>
					<div class="grid-item"
						style="position: absolute; left: 290px; top: 0px;">
						<div class="wrap">
							<div class="img">
								<a
									href="https://www.megabox.co.kr/moviepost/all#layer_post_detail"
									title="무비포스트 상세보기" class="post-detailPopup btn-modal-open2"
									w-data="850" h-data="auto" data-no="236654" data-row="2"
									data-tot="217171" data-url=""><img
									src="./모든영화 _ 무비포스트 _ MEET PLAY SHARE, 메가박스_files/MdQhuRuYK5nkXzw7QjgaaFhocMCDsCOd_230.jpg"
									alt="30일" onerror="noImg(this);"> /&gt;</a>
							</div>
							<div class="cont">
								<div class="writer">
									<a href="https://www.megabox.co.kr/moviepost/all#"
										title="filmfutu**님의 무비포스트 보기" class="moviePostId"
										data-id="E1B96E9C-427A-4BE1-8D2B-63F8724F4EA6">filmfutu**</a>
								</div>
								<a
									href="https://www.megabox.co.kr/movie-detail?rpstMovieNo=23069600"
									title="30일 상세보기">
									<p class="tit">30일</p>
								</a> <a
									href="https://www.megabox.co.kr/moviepost/all#layer_post_detail"
									title="무비포스트 상세보기"
									class="link btn-modal-open2 post-detailPopup" w-data="850"
									h-data="auto" data-no="236654" data-row="2" data-tot="217171">
									<p class="txt">기왕 결혼했으면 싸우지 말고 잘 살자!!!</p>
									<p class="time">7 시간전</p>
								</a>
								<div class="condition">
									<button type="button"
										class="btn-like postLikeBtn listBtn jsMake" data-no="236654">
										<i class="iconset ico-like">좋아요 수</i> <span class="none">1</span>
									</button>
									<a
										href="https://www.megabox.co.kr/moviepost/all#layer_post_detail"
										title="댓글 작성하기"
										class="link btn-modal-open2 post-detailRlyPopup" w-data="850"
										h-data="auto" data-no="236654" data-row="2" data-tot="217171"><i
										class="iconset ico-reply">댓글 수</i> 1</a>
								</div>
							</div>
						</div>
					</div>
					<div class="grid-item"
						style="position: absolute; left: 580px; top: 0px;">
						<div class="wrap">
							<div class="img">
								<a
									href="https://www.megabox.co.kr/moviepost/all#layer_post_detail"
									title="무비포스트 상세보기" class="post-detailPopup btn-modal-open2"
									w-data="850" h-data="auto" data-no="236653" data-row="3"
									data-tot="217171" data-url=""><img
									src="./모든영화 _ 무비포스트 _ MEET PLAY SHARE, 메가박스_files/gypsz8NVDthYktOpxZRFz3PuGe9ai0D4_230.jpg"
									alt="거미집" onerror="noImg(this);"> /&gt;</a>
							</div>
							<div class="cont">
								<div class="writer">
									<a href="https://www.megabox.co.kr/moviepost/all#"
										title="inholee**님의 무비포스트 보기" class="moviePostId"
										data-id="AF9D0CF8-958D-4ED0-9184-5B871B32CEA3">inholee**</a>
								</div>
								<a
									href="https://www.megabox.co.kr/movie-detail?rpstMovieNo=23069500"
									title="거미집 상세보기">
									<p class="tit">거미집</p>
								</a> <a
									href="https://www.megabox.co.kr/moviepost/all#layer_post_detail"
									title="무비포스트 상세보기"
									class="link btn-modal-open2 post-detailPopup" w-data="850"
									h-data="auto" data-no="236653" data-row="3" data-tot="217171">
									<p class="txt">영화판 감독님들 싯점에서 그린 영화. 영화속 흑백영화도 볼만 합니다.</p>
									<p class="time">8 시간전</p>
								</a>
								<div class="condition">
									<button type="button"
										class="btn-like postLikeBtn listBtn jsMake" data-no="236653">
										<i class="iconset ico-like">좋아요 수</i> <span class="none">0</span>
									</button>
									<a
										href="https://www.megabox.co.kr/moviepost/all#layer_post_detail"
										title="댓글 작성하기"
										class="link btn-modal-open2 post-detailRlyPopup" w-data="850"
										h-data="auto" data-no="236653" data-row="3" data-tot="217171"><i
										class="iconset ico-reply">댓글 수</i> 0</a>
								</div>
							</div>
						</div>
					</div>
					<div class="grid-item"
						style="position: absolute; left: 870px; top: 0px;">
						<div class="wrap">
							<div class="img">
								<a
									href="https://www.megabox.co.kr/moviepost/all#layer_post_detail"
									title="무비포스트 상세보기" class="post-detailPopup btn-modal-open2"
									w-data="850" h-data="auto" data-no="236652" data-row="4"
									data-tot="217171" data-url=""><img
									src="./모든영화 _ 무비포스트 _ MEET PLAY SHARE, 메가박스_files/EXVcbMcBmehnqC2yk0zCOdw7Ahkyn2XP_230.jpg"
									alt="1947 보스톤" onerror="noImg(this);"> /&gt;</a>
							</div>
							<div class="cont">
								<div class="writer">
									<a href="https://www.megabox.co.kr/moviepost/all#"
										title="seowon**님의 무비포스트 보기" class="moviePostId"
										data-id="D068B8DB-A86E-42DB-9E01-03EA5FDB49B5">seowon**</a>
								</div>
								<a
									href="https://www.megabox.co.kr/movie-detail?rpstMovieNo=23069400"
									title="1947 보스톤 상세보기">
									<p class="tit">1947 보스톤</p>
								</a> <a
									href="https://www.megabox.co.kr/moviepost/all#layer_post_detail"
									title="무비포스트 상세보기"
									class="link btn-modal-open2 post-detailPopup" w-data="850"
									h-data="auto" data-no="236652" data-row="4" data-tot="217171">
									<p class="txt">손기정에 가려져있던 우리나라에 영웅</p>
									<p class="time">11 시간전</p>
								</a>
								<div class="condition">
									<button type="button"
										class="btn-like postLikeBtn listBtn jsMake" data-no="236652">
										<i class="iconset ico-like">좋아요 수</i> <span class="none">1</span>
									</button>
									<a
										href="https://www.megabox.co.kr/moviepost/all#layer_post_detail"
										title="댓글 작성하기"
										class="link btn-modal-open2 post-detailRlyPopup" w-data="850"
										h-data="auto" data-no="236652" data-row="4" data-tot="217171"><i
										class="iconset ico-reply">댓글 수</i> 0</a>
								</div>
							</div>
						</div>
					</div>
					<div class="grid-item"
						style="position: absolute; left: 0px; top: 426.069px;">
						<div class="wrap">
							<div class="img">
								<a
									href="https://www.megabox.co.kr/moviepost/all#layer_post_detail"
									title="무비포스트 상세보기" class="post-detailPopup btn-modal-open2"
									w-data="850" h-data="auto" data-no="236651" data-row="5"
									data-tot="217171" data-url=""><img
									src="./모든영화 _ 무비포스트 _ MEET PLAY SHARE, 메가박스_files/dhGAXx1B57INtthIGwyRiVNMJMxqkAwv_230.jpg"
									alt="5등분의 신부 스페셜" onerror="noImg(this);"> /&gt;</a>
							</div>
							<div class="cont">
								<div class="writer">
									<a href="https://www.megabox.co.kr/moviepost/all#"
										title="qkrwntls**님의 무비포스트 보기" class="moviePostId"
										data-id="4892FF6E-312C-442F-A743-2719DCC0EBB3">qkrwntls**</a>
								</div>
								<a
									href="https://www.megabox.co.kr/movie-detail?rpstMovieNo=23077100"
									title="5등분의 신부 스페셜 상세보기">
									<p class="tit">5등분의 신부 스페셜</p>
								</a> <a
									href="https://www.megabox.co.kr/moviepost/all#layer_post_detail"
									title="무비포스트 상세보기"
									class="link btn-modal-open2 post-detailPopup" w-data="850"
									h-data="auto" data-no="236651" data-row="5" data-tot="217171">
									<p class="txt">츤츤</p>
									<p class="time">13 시간전</p>
								</a>
								<div class="condition">
									<button type="button"
										class="btn-like postLikeBtn listBtn jsMake" data-no="236651">
										<i class="iconset ico-like">좋아요 수</i> <span class="none">1</span>
									</button>
									<a
										href="https://www.megabox.co.kr/moviepost/all#layer_post_detail"
										title="댓글 작성하기"
										class="link btn-modal-open2 post-detailRlyPopup" w-data="850"
										h-data="auto" data-no="236651" data-row="5" data-tot="217171"><i
										class="iconset ico-reply">댓글 수</i> 0</a>
								</div>
							</div>
						</div>
					</div>
					<div class="grid-item"
						style="position: absolute; left: 290px; top: 426.069px;">
						<div class="wrap">
							<div class="img">
								<a
									href="https://www.megabox.co.kr/moviepost/all#layer_post_detail"
									title="무비포스트 상세보기" class="post-detailPopup btn-modal-open2"
									w-data="850" h-data="auto" data-no="236650" data-row="6"
									data-tot="217171" data-url=""><img
									src="./모든영화 _ 무비포스트 _ MEET PLAY SHARE, 메가박스_files/2TkE41pHi6AYHu1R8SUXqQw52PAuHSGz_230.jpg"
									alt="화란" onerror="noImg(this);"> /&gt;</a>
							</div>
							<div class="cont">
								<div class="writer">
									<a href="https://www.megabox.co.kr/moviepost/all#"
										title="youngman10**님의 무비포스트 보기" class="moviePostId"
										data-id="903C673A-127F-4ED1-A6AA-1085833EAA43">youngman10**</a>
								</div>
								<a
									href="https://www.megabox.co.kr/movie-detail?rpstMovieNo=23074200"
									title="화란 상세보기">
									<p class="tit">화란</p>
								</a> <a
									href="https://www.megabox.co.kr/moviepost/all#layer_post_detail"
									title="무비포스트 상세보기"
									class="link btn-modal-open2 post-detailPopup" w-data="850"
									h-data="auto" data-no="236650" data-row="6" data-tot="217171">
									<p class="txt">송중기.홍사빈.김형서의 무비액션</p>
									<p class="time">13 시간전</p>
								</a>
								<div class="condition">
									<button type="button"
										class="btn-like postLikeBtn listBtn jsMake" data-no="236650">
										<i class="iconset ico-like">좋아요 수</i> <span class="none">1</span>
									</button>
									<a
										href="https://www.megabox.co.kr/moviepost/all#layer_post_detail"
										title="댓글 작성하기"
										class="link btn-modal-open2 post-detailRlyPopup" w-data="850"
										h-data="auto" data-no="236650" data-row="6" data-tot="217171"><i
										class="iconset ico-reply">댓글 수</i> 0</a>
								</div>
							</div>
						</div>
					</div>
					<div class="grid-item"
						style="position: absolute; left: 870px; top: 426.069px;">
						<div class="wrap">
							<div class="img">
								<a
									href="https://www.megabox.co.kr/moviepost/all#layer_post_detail"
									title="무비포스트 상세보기" class="post-detailPopup btn-modal-open2"
									w-data="850" h-data="auto" data-no="236649" data-row="7"
									data-tot="217171" data-url=""><img
									src="./모든영화 _ 무비포스트 _ MEET PLAY SHARE, 메가박스_files/vqza9oVMOPycZi7vudQJpeA0apGUa9I0_230.jpg"
									alt="더 퍼스트 슬램덩크" onerror="noImg(this);"> /&gt;</a>
							</div>
							<div class="cont">
								<div class="writer">
									<a href="https://www.megabox.co.kr/moviepost/all#"
										title="whitepg7**님의 무비포스트 보기" class="moviePostId"
										data-id="E5BEB6DB-7DAB-4E4B-A3F6-4015562313F9">whitepg7**</a>
								</div>
								<a
									href="https://www.megabox.co.kr/movie-detail?rpstMovieNo=22103500"
									title="더 퍼스트 슬램덩크 상세보기">
									<p class="tit">더 퍼스트 슬램덩크</p>
								</a> <a
									href="https://www.megabox.co.kr/moviepost/all#layer_post_detail"
									title="무비포스트 상세보기"
									class="link btn-modal-open2 post-detailPopup" w-data="850"
									h-data="auto" data-no="236649" data-row="7" data-tot="217171">
									<p class="txt">송태섭 사랑해</p>
									<p class="time">14 시간전</p>
								</a>
								<div class="condition">
									<button type="button"
										class="btn-like postLikeBtn listBtn jsMake" data-no="236649">
										<i class="iconset ico-like">좋아요 수</i> <span class="none">2</span>
									</button>
									<a
										href="https://www.megabox.co.kr/moviepost/all#layer_post_detail"
										title="댓글 작성하기"
										class="link btn-modal-open2 post-detailRlyPopup" w-data="850"
										h-data="auto" data-no="236649" data-row="7" data-tot="217171"><i
										class="iconset ico-reply">댓글 수</i> 0</a>
								</div>
							</div>
						</div>
					</div>
					<div class="grid-item"
						style="position: absolute; left: 580px; top: 444.264px;">
						<div class="wrap">
							<div class="img">
								<a
									href="https://www.megabox.co.kr/moviepost/all#layer_post_detail"
									title="무비포스트 상세보기" class="post-detailPopup btn-modal-open2"
									w-data="850" h-data="auto" data-no="236648" data-row="8"
									data-tot="217171" data-url=""><img
									src="./모든영화 _ 무비포스트 _ MEET PLAY SHARE, 메가박스_files/WStin6cfo9BUt1tX0vILv2ZvSJrpkbD4_230.jpg"
									alt="거미집" onerror="noImg(this);"> /&gt;</a>
							</div>
							<div class="cont">
								<div class="writer">
									<a href="https://www.megabox.co.kr/moviepost/all#"
										title="pgt121**님의 무비포스트 보기" class="moviePostId"
										data-id="76319643-1DE2-418E-9216-28A106EC4A50">pgt121**</a>
								</div>
								<a
									href="https://www.megabox.co.kr/movie-detail?rpstMovieNo=23069500"
									title="거미집 상세보기">
									<p class="tit">거미집</p>
								</a> <a
									href="https://www.megabox.co.kr/moviepost/all#layer_post_detail"
									title="무비포스트 상세보기"
									class="link btn-modal-open2 post-detailPopup" w-data="850"
									h-data="auto" data-no="236648" data-row="8" data-tot="217171">
									<p class="txt">별로 예술영화스럽지 않다 그냥 편하고 재밌게 볼 수 있는 영화</p>
									<p class="time">14 시간전</p>
								</a>
								<div class="condition">
									<button type="button"
										class="btn-like postLikeBtn listBtn jsMake" data-no="236648">
										<i class="iconset ico-like">좋아요 수</i> <span class="none">2</span>
									</button>
									<a
										href="https://www.megabox.co.kr/moviepost/all#layer_post_detail"
										title="댓글 작성하기"
										class="link btn-modal-open2 post-detailRlyPopup" w-data="850"
										h-data="auto" data-no="236648" data-row="8" data-tot="217171"><i
										class="iconset ico-reply">댓글 수</i> 0</a>
								</div>
							</div>
						</div>
					</div>
					<div class="grid-item"
						style="position: absolute; left: 0px; top: 833.944px;">
						<div class="wrap">
							<div class="img">
								<a
									href="https://www.megabox.co.kr/moviepost/all#layer_post_detail"
									title="무비포스트 상세보기" class="post-detailPopup btn-modal-open2"
									w-data="850" h-data="auto" data-no="236647" data-row="9"
									data-tot="217171" data-url=""><img
									src="./모든영화 _ 무비포스트 _ MEET PLAY SHARE, 메가박스_files/WJUPvVY12GjgktehLNlbMmNEB4vkFVOs_230.jpg"
									alt="화란" onerror="noImg(this);"> /&gt;</a>
							</div>
							<div class="cont">
								<div class="writer">
									<a href="https://www.megabox.co.kr/moviepost/all#"
										title="peeri99**님의 무비포스트 보기" class="moviePostId"
										data-id="E22C4A23-5EA0-4284-9170-C3D5E72707D0">peeri99**</a>
								</div>
								<a
									href="https://www.megabox.co.kr/movie-detail?rpstMovieNo=23074200"
									title="화란 상세보기">
									<p class="tit">화란</p>
								</a> <a
									href="https://www.megabox.co.kr/moviepost/all#layer_post_detail"
									title="무비포스트 상세보기"
									class="link btn-modal-open2 post-detailPopup" w-data="850"
									h-data="auto" data-no="236647" data-row="9" data-tot="217171">
									<p class="txt">불쌍하고 안타까운 이야기</p>
									<p class="time">15 시간전</p>
								</a>
								<div class="condition">
									<button type="button"
										class="btn-like postLikeBtn listBtn jsMake" data-no="236647">
										<i class="iconset ico-like">좋아요 수</i> <span class="none">0</span>
									</button>
									<a
										href="https://www.megabox.co.kr/moviepost/all#layer_post_detail"
										title="댓글 작성하기"
										class="link btn-modal-open2 post-detailRlyPopup" w-data="850"
										h-data="auto" data-no="236647" data-row="9" data-tot="217171"><i
										class="iconset ico-reply">댓글 수</i> 0</a>
								</div>
							</div>
						</div>
					</div>
					<div class="grid-item"
						style="position: absolute; left: 290px; top: 833.944px;">
						<div class="wrap">
							<div class="img">
								<a
									href="https://www.megabox.co.kr/moviepost/all#layer_post_detail"
									title="무비포스트 상세보기" class="post-detailPopup btn-modal-open2"
									w-data="850" h-data="auto" data-no="236646" data-row="10"
									data-tot="217171" data-url=""><img
									src="./모든영화 _ 무비포스트 _ MEET PLAY SHARE, 메가박스_files/mezx0phuwpfxNfJWJef6NJCy4vL2rXLR_230.jpg"
									alt="씰벤져스 : 용감한 바다특공대" onerror="noImg(this);"> /&gt;</a>
							</div>
							<div class="cont">
								<div class="writer">
									<a href="https://www.megabox.co.kr/moviepost/all#"
										title="gpwjd07**님의 무비포스트 보기" class="moviePostId"
										data-id="6B098A57-280B-450F-9274-5C84D53ECF4F">gpwjd07**</a>
								</div>
								<a
									href="https://www.megabox.co.kr/movie-detail?rpstMovieNo=23068300"
									title="씰벤져스 : 용감한 바다특공대 상세보기">
									<p class="tit">씰벤져스 : 용감한 바다특공대</p>
								</a> <a
									href="https://www.megabox.co.kr/moviepost/all#layer_post_detail"
									title="무비포스트 상세보기"
									class="link btn-modal-open2 post-detailPopup" w-data="850"
									h-data="auto" data-no="236646" data-row="10" data-tot="217171">
									<p class="txt">8살 아이와 봤는데 내용전개도 좋고 약간의 긴장감도 있고 재밌었어요</p>
									<p class="time">16 시간전</p>
								</a>
								<div class="condition">
									<button type="button"
										class="btn-like postLikeBtn listBtn jsMake" data-no="236646">
										<i class="iconset ico-like">좋아요 수</i> <span class="none">0</span>
									</button>
									<a
										href="https://www.megabox.co.kr/moviepost/all#layer_post_detail"
										title="댓글 작성하기"
										class="link btn-modal-open2 post-detailRlyPopup" w-data="850"
										h-data="auto" data-no="236646" data-row="10" data-tot="217171"><i
										class="iconset ico-reply">댓글 수</i> 0</a>
								</div>
							</div>
						</div>
					</div>
					<div class="grid-item"
						style="position: absolute; left: 870px; top: 833.944px;">
						<div class="wrap">
							<div class="img">
								<a
									href="https://www.megabox.co.kr/moviepost/all#layer_post_detail"
									title="무비포스트 상세보기" class="post-detailPopup btn-modal-open2"
									w-data="850" h-data="auto" data-no="236645" data-row="11"
									data-tot="217171" data-url=""><img
									src="./모든영화 _ 무비포스트 _ MEET PLAY SHARE, 메가박스_files/tbYapIiPO872Yqb51SkrDUZo759Pp4Jc_230.jpg"
									alt="1947 보스톤" onerror="noImg(this);"> /&gt;</a>
							</div>
							<div class="cont">
								<div class="writer">
									<a href="https://www.megabox.co.kr/moviepost/all#"
										title="chm1009**님의 무비포스트 보기" class="moviePostId"
										data-id="4C90C61A-6D98-4C97-AF7E-EECBDF9DBA06">chm1009**</a>
								</div>
								<a
									href="https://www.megabox.co.kr/movie-detail?rpstMovieNo=23069400"
									title="1947 보스톤 상세보기">
									<p class="tit">1947 보스톤</p>
								</a> <a
									href="https://www.megabox.co.kr/moviepost/all#layer_post_detail"
									title="무비포스트 상세보기"
									class="link btn-modal-open2 post-detailPopup" w-data="850"
									h-data="auto" data-no="236645" data-row="11" data-tot="217171">
									<p class="txt">실화지만 실화같지 않았던 영화이고 알고 있던 내용이 나와서 좋았고 감동적인
										영화이다</p>
									<p class="time">16 시간전</p>
								</a>
								<div class="condition">
									<button type="button"
										class="btn-like postLikeBtn listBtn jsMake" data-no="236645">
										<i class="iconset ico-like">좋아요 수</i> <span class="none">1</span>
									</button>
									<a
										href="https://www.megabox.co.kr/moviepost/all#layer_post_detail"
										title="댓글 작성하기"
										class="link btn-modal-open2 post-detailRlyPopup" w-data="850"
										h-data="auto" data-no="236645" data-row="11" data-tot="217171"><i
										class="iconset ico-reply">댓글 수</i> 0</a>
								</div>
							</div>
						</div>
					</div>
					<div class="grid-item"
						style="position: absolute; left: 580px; top: 870.333px;">
						<div class="wrap">
							<div class="img">
								<a
									href="https://www.megabox.co.kr/moviepost/all#layer_post_detail"
									title="무비포스트 상세보기" class="post-detailPopup btn-modal-open2"
									w-data="850" h-data="auto" data-no="236644" data-row="12"
									data-tot="217171" data-url=""><img
									src="./모든영화 _ 무비포스트 _ MEET PLAY SHARE, 메가박스_files/2vIzIiXW9CAFP3UYpaOTa5qfuHoA2Sa0_230.jpg"
									alt="30일" onerror="noImg(this);"> /&gt;</a>
							</div>
							<div class="cont">
								<div class="writer">
									<a href="https://www.megabox.co.kr/moviepost/all#"
										title="jinhana**님의 무비포스트 보기" class="moviePostId"
										data-id="28A6074B-E804-455E-A5A4-151F473DB5C9">jinhana**</a>
								</div>
								<a
									href="https://www.megabox.co.kr/movie-detail?rpstMovieNo=23069600"
									title="30일 상세보기">
									<p class="tit">30일</p>
								</a> <a
									href="https://www.megabox.co.kr/moviepost/all#layer_post_detail"
									title="무비포스트 상세보기"
									class="link btn-modal-open2 post-detailPopup" w-data="850"
									h-data="auto" data-no="236644" data-row="12" data-tot="217171">
									<p class="txt">
										연기 덕분에 살아난 코미디<br>
									</p>
									<p class="time">18 시간전</p>
								</a>
								<div class="condition">
									<button type="button"
										class="btn-like postLikeBtn listBtn jsMake" data-no="236644">
										<i class="iconset ico-like">좋아요 수</i> <span class="none">0</span>
									</button>
									<a
										href="https://www.megabox.co.kr/moviepost/all#layer_post_detail"
										title="댓글 작성하기"
										class="link btn-modal-open2 post-detailRlyPopup" w-data="850"
										h-data="auto" data-no="236644" data-row="12" data-tot="217171"><i
										class="iconset ico-reply">댓글 수</i> 0</a>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="no-moviepost" style="display: none;">등록된 무비포스트가
					없습니다.</div>

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










		<script type="text/javascript">
			var detailPopup = {
				mbNo : "",
				moviePostNo : "",
				backScreen : "",
				movieNo : ""
			};

			var moviePostRlyNo;

			$(function() {

				// 구독하기 버튼
				$('#subscribe')
						.on(
								'click',
								function() {

									$
											.ajaxMegaBox({
												url : '/on/oh/oha/Movie/mergeMoviePostSubscribe.do',
												data : JSON.stringify({
													mbNo : detailPopup.mbNo
												}),
												sessionAt : true,
												success : function(data) {
													var resultMap = data.resultMap;

													if (resultMap.msg == 'sessionFail')
														return gfn_alertMsgBox('로그인 후 이용가능한 서비스입니다.');

													if (resultMap.moviePostSbscAt == 'Y'
															|| resultMap.moviePostSbscAt == 'C') {
														gfn_alertMsgBox(
																'구독 신청이 완료 되었습니다.',
																function() {

																	// 영화 > 무비포스트 > 구독중인포스트 : 재조회
																	if ($('[data-type=subscribe].on').length == 1) {
																		$(
																				'[data-type=subscribe].on')
																				.click();
																	}
																	// 나의 무비스토리  > 구독중인포스트 : 재조회
																	else if ($('[data-type=mySubscribe].on').length == 1) {
																		$(
																				'[data-type=mySubscribe].on')
																				.click();
																	}
																});
														$('#subscribe').text(
																'구독중');
													} else if (resultMap.moviePostSbscAt == 'N') {
														gfn_alertMsgBox(
																'구독이 해제 되었습니다.',
																function() {
																	// 나의 무비스토리  > 구독중인포스트 : 재조회
																	if ($('[data-type=mySubscribe].on').length == 1) {
																		$(
																				'[data-type=mySubscribe].on')
																				.click();

																	}

																	// 영화 > 무비포스트 > 구독중인포스트 : 재조회
																	else if ($('[data-type=subscribe].on').length == 1) {
																		$(
																				'[data-type=subscribe].on')
																				.click();

																	}
																});
														$('#subscribe').text(
																'구독하기');
													} else {
														$('#subscribe').text(
																'구독하기');
													}

												}
											});
								});

				// 좋아요 버튼
				$(".layer-con").on('click', '.count .btn', function() {
					fn_addHeart(this);
				});

				// 댓글 등록
				$(".layer-con").on('click', '#btnPostRly', function() {
					var postRlyCn = $('#postRlyCn').val();

					if (gfn_isEmpty(postRlyCn))
						return gfn_alertMsgBox('내용을 입력하세요');

					fn_insertPostRlyPre();
				});

				// 더보기 버튼
				$('#btnAddMovie').on('click', function() {
					fn_moviePostRlySearch('add');
				});

				// 댓글 사이즈
				$('#postRlyCn').on('keyup', function(e) {
					var postRlyCn = $('#postRlyCn').val();

					if (postRlyCn.length < 101)
						$('.text-count').text(postRlyCn.length);
				});

				// 공유하기
				$('.btn-post-share button').off().on(
						'click',
						function(e) {
							e.preventDefault();

							var classStr = $(this).attr('class');

							if (classStr.indexOf('kakao') > -1) { // 카카오톡
								if (!MegaboxUtil.Common.isMobile()
										&& !MegaboxUtil.Common.isApp())
									MegaboxUtil.Common.alert('앱에서만 사용 가능합니다.');
								else
									MegaboxUtil.Common.alert('준비중입니다.');
							} else if (classStr.indexOf('face') > -1) { // 페이스북
								MegaboxUtil.Share.facebook();
							} else if (classStr.indexOf('band') > -1) { // 밴드
								MegaboxUtil.Share.band();
							} else if (classStr.indexOf('twitter') > -1) { // 트위터
								MegaboxUtil.Share.twitter();
							} else { // 링크 공유
								MegaboxUtil.Share.copyUrl();
							}

							$('.tooltip-layer, .tipPin').css({
								'opacity' : 0,
								'z-index' : 0
							});
						});

				// 예매 클릭
				$('#bokdLinkBtn').off().on('click', function(e) {
					e.preventDefault();

					var form = MegaboxUtil.Form.createForm();
					form.append($('<input>').attr({
						'type' : 'hidden',
						'name' : 'rpstMovieNo',
						'value' : $(this).data('no')
					}));
					form.attr('action', '/booking');
					form.submit();
				});

			});

			/*댓글목록 가져오기*/
			function fn_moviePostRlySearch(searchtype, moviePostNo, viewDiv) {

				var moviePostNo = moviePostNo;
				//var currentPage = $("#currentPage").val();
				//var recordCountPerPage = $("#recordCountPerPage").val();

				if (searchtype == "search") {
					//currentPage = "1";
				} else if (searchtype == "add") {
					//currentPage = parseInt(currentPage) + 1;
				}
				//$("#currentPage").val(currentPage+"");
				//var paramData = { moviePostNo: moviePostNo, currentPage:currentPage + "", recordCountPerPage:recordCountPerPage};
				var paramData = {
					moviePostNo : moviePostNo
				};

				$
						.ajax({
							url : "/on/oh/oha/Movie/selectMoviePostRlyList.do",
							type : "POST",
							contentType : "application/json;charset=UTF-8",
							data : JSON.stringify(paramData),
							success : function(data) {
								if (searchtype == "search") {
									$("#commentList").empty();
								}

								$("#commentList").append(data);

								if (viewDiv == "rly") { //댓글아이콘 눌러서 상세 볼 경우
									console.log(viewDiv);

									$('#postRlyCn').focus();
									$('.comment-box')[0].scrollIntoView(false); //댓글로 포커스

								} else if ($('#layer_post_detail .bg-modal-dim').length > 0) {
									// 그림, 텍스트 눌러서 포스트 상세 볼 경우
									console.log(viewDiv);
									$('#layer_post_detail .bg-modal-dim')[0]
											.scrollIntoView(true); // 레이어팝업 헤더에 포커스

								}

								//$(".link.btn-modal-open2.post-detailRlyPopup").each(function(idx){
								$(".btn-modal-open2.post-detailRlyPopup")
										.each(
												function(idx) {
													var hdnMoviePostNo = $(
															'#hdnMoviePostNo')
															.val();
													if ($.trim($(this).data(
															'no')) == hdnMoviePostNo) {
														var totCnt = $(
																'#rlyCntTop')
																.val();
														$(this)
																.html(
																		"<i class='iconset ico-reply'>댓글 수</i> "
																				+ totCnt);
													}
												});
							}
						});

			}

			/*좋아요 저장*/
			function fn_addHeart(obj) {

				var artiNo = $(obj).attr("arti-no");

				if (artiNo == null)
					return;

				var allData = {
					artiNo : artiNo,
					artiDivCd : 'MOPO'
				};

				$
						.ajaxMegaBox({
							url : "/on/oh/oha/Movie/mergeMoviePostHeart.do",
							type : "POST",
							contentType : "application/json;charset=UTF-8",
							dataType : "json",
							data : JSON.stringify(allData),
							sessionAt : true,
							success : function(data, textStatus, jqXHR) {
								var resultMap = data.resultMap;

								if (resultMap.msg == "sessionFail") {
									gfn_alertMsgBox("로그인 후 이용가능한 서비스입니다.");
									return;
								}
								var text = "";
								$(obj).html('');
								if (resultMap.rowStatCd == "D") {
									text = "<i title=\"좋아요 설정 함\" class=\"iconset ico-like\"></i>"
											+ resultMap.likeCnt;
									var artiNo = $(obj).attr("arti-no");

									$(".btn-like.listBtn")
											.each(
													function(idx) {
														if ($.trim($(this)
																.data('no')) == artiNo) {
															var oriVal = $(this)
																	.find(
																			'span')
																	.html(); //좋아요 수
															var toVal = Number(oriVal) - 1; //좋아요 -1
															$(this)
																	.find(
																			'span')
																	.html(toVal); //태그 적용
															$(this)
																	.find('i')
																	.removeClass(
																			'on'); //온클래스 제거
														}
													});
								} else {
									text = "<i title=\"좋아요 설정 안함\" class=\"iconset ico-like on\"></i>"
											+ resultMap.likeCnt;
									var artiNo = $(obj).attr("arti-no");

									$(".btn-like.listBtn")
											.each(
													function(idx) {
														if ($.trim($(this)
																.data('no')) == artiNo) {
															var oriVal = $(this)
																	.find(
																			'span')
																	.html(); //좋아요 수
															var toVal = Number(oriVal) + 1; //좋아요 +1
															$(this)
																	.find(
																			'span')
																	.html(toVal); //태그 적용
															$(this)
																	.find('i')
																	.addClass(
																			'on'); //온클래스 추가
														}
													});
								}
								$(obj).append(text);
							}
						});
			}

			/*댓글저장 전처리*/
			function fn_insertPostRlyPre() {
				var postRlyCn = $("#postRlyCn").val();

				var fn_complete = function(list) {
					if (list.length > 0) {
						//alert(list.join(","));
						gfn_alertMsgBox('허용되지 않는 단어가 포함되어 있습니다.'); //허용되지 않는 단어가 포함되어 있습니다.
					} else {
						fn_insertPostRly();
					}
				}

				gfn_chkPrhword(postRlyCn, fn_complete);
			}

			/*댓글저장*/
			function fn_insertPostRly() {

				var moviePostNo = detailPopup.moviePostNo;
				var postRlyCn = $("#postRlyCn").val();
				var allData = {
					moviePostNo : moviePostNo,
					postRlyCn : postRlyCn
				};

				/* 	if(!confirm("등록 하시겠습니까?")){
				 return;
				 }
				 */
				//20190905 한줄평, 댓글 작성시 메세지 불필요  gfn_confirmMsgBox("등록 하시겠습니까?", function(){
				$.ajaxMegaBox({
					url : "/on/oh/oha/Movie/insertPostRly.do",
					type : "POST",
					contentType : "application/json;charset=UTF-8",
					dataType : "json",
					data : JSON.stringify(allData),
					sessionAt : true,
					clickLmtChk : true, //중복클릭 방지 실행
					success : function(data, textStatus, jqXHR) {
						var resultMap = data.resultMap;

						if (resultMap.msg == "sessionFail") {
							gfn_alertMsgBox("로그인 후 이용가능한 서비스입니다.");
							return;
						}

						if (resultMap.msg == 'already')
							return gfn_alertMsgBox('이미 작성된 댓글이 있습니다.');

						//20190905 한줄평, 댓글 작성시 메세지 불필요  gfn_alertMsgBox("댓글이 등록 되었습니다.");
						$(".text-count").text("0");
						$("#postRlyCn").val("");
						fn_moviePostRlySearch("search", moviePostNo, "rly");
					},
					complete : function(xhr) {
						clearLmt(); //중복제한 초기화

					}
				});
				/////});
			}

			/*댓글 수정화면 취소버튼*/
			function fn_writeCancel(moviePostRlyNo) {
				$("#rlyWri" + moviePostRlyNo).hide();
				$("#rlyTxt" + moviePostRlyNo).show();
			}

			/*댓글 사이즈(수정화면)*/
			function fn_postRlyCnValChk(moviePostRlyNo) {
				var postRlyCn = $("#postRlyCn" + moviePostRlyNo).val();
				if (postRlyCn.length < 101) {
					$("#textCount" + moviePostRlyNo).text(postRlyCn.length);
				}
			}

			/*******************************************************************
			 * 무비포스트 상세 레이어팝업 관련 	*
			 *******************************************************************/
			function fn_moviePostList() {
				//콜백함수
				fn_moviePostRlySearch('search', detailPopup.moviePostNo);

			}

			function fn_postDetail(moviePostNo, viewDiv, backScreen) {
				console.log("MoviePostViewLayerPM.jsp");
				//console.log(moviePostNo);
				detailPopup.moviePostNo = moviePostNo;
				detailPopup.backScreen = backScreen;

				//댓글창 초기화
				$('.comment-function .reset .text-count').text(0);
				$('#postRlyCn').val('');
				$('#subscribe').css("display", "block");
				$('.balloon-space').removeClass('on');

				$
						.ajaxMegaBox({
							url : '/moviepost/layerDetail',
							type : "POST",
							contentType : "application/json;charset=UTF-8",
							dataType : "json",
							data : JSON.stringify({
								moviePostNo : moviePostNo
							}),
							success : function(data) {

								var detailInfo = data.postList[0];
								$('.post-detail .tit').html(
										detailInfo.moviePostMovieTitle); //무비포스트 제목
								$('.user-id').html(detailInfo.loginId);
								$('.user-write-time').html(detailInfo.fstRegDe);
								$('.user-post-box .user-info .photo')
										.html(
												'<img src="'
														+ data.imgSvrUrl
														+ detailInfo.profileImgPath
														+ '" alt="'
														+ detailInfo.loginId
														+ '님의 무비포스트" onerror="noImg(this)"/>');
								$('.user-write-time').html(detailInfo.fstRegDe);
								detailPopup.mbNo = detailInfo.mbNo;
								detailPopup.movieNo = detailInfo.movieNo;

								if ((detailInfo.movieStatCd == 'MSC01' || detailInfo.movieStatCd == 'MSC02')
										&& detailInfo.bokdAbleYn == 'Y') {
									$('#bokdLinkBtn').show();
									$('#bokdLinkBtn').data('no',
											detailInfo.movieNo);
									$('#bokdLinkBtn').attr('title',
											detailInfo.movieNm + ' 예매하기');
								} else {
									$('#bokdLinkBtn').hide();
								}

								if ('' != detailInfo.mbNo) { //무비포스트 쓴 회원과 홈페이지 접속한 회원이 같지 않은 경우

									$('.count .btn').attr('arti-no',
											moviePostNo); //좋아요 버튼에 무비포스트번호 셋팅

									//포스트 옵션 말풍선
									$('.balloon-space').removeClass('writer')
											.addClass('user');
									var html = "";
									html += '<div class="user">';
									html += '<p class="reset a-c">광고성 내용 및 욕설/비방하는<br />내용이 있습니까?</p>';
									html += '<button type="button" data-no3="' + moviePostNo + '">포스트 신고 <i class="iconset ico-arr-right-green"></i></button>';
									html += '</div>';
									html += '<div class="btn-close"><a href="#" title="닫기"><img src="../../../static/pc/images/common/btn/btn-balloon-close.png" alt="닫기" /></a></div>';
									$('.balloon-space.mpost .balloon-cont')
											.html(html);

									if (detailInfo.moviePostSbscAt == 'Y') { //무비포스트구독여부가 Y면
										$('#subscribe').text('구독중');
									} else {
										$('#subscribe').text('구독하기');
									}
								} else {
									$('.count .btn').attr('arti-no',
											moviePostNo); //좋아요 버튼에 무비포스트번호 셋팅

									//포스트 옵션 말풍선
									$('.balloon-space').removeClass('user')
											.addClass('writer');
									var html = "";
									html += '<div class="writer layer-pop-detail">';
									html += '<button type="button" data-no1="'+ moviePostNo +'" data-no2="'+ detailInfo.movieNo +'">수정</button>';
									html += '<button type="button" data-no1="'+ moviePostNo +'">삭제</button>';
									html += '</div>';
									html += '<div class="btn-close"><a href="#" title="닫기"><img src="../../../static/pc/images/common/btn/btn-balloon-close.png" alt="닫기" /></a></div>';

									$('.balloon-space.mpost .balloon-cont')
											.html(html);

									$('#subscribe').css("display", "none");
								}

								//포스트 내용
								if (data.postList.length > 0) {

									var metaTagImg = ""; //메타태그 이미지
									var htmlTxt = "";
									var img_Path = "";
									for (var i = 0; i < data.postList.length; i++) {
										if (i == 0) {
											metaTagImg = data.imgSvrUrl
													+ data.postList[i].imgPath
										}
										if (data.postList[i].moviePostImgDivCd == 'MIK01') { //스틸컷(포스터)
											img_Path = nvl(
													data.postList[i].imgPath)
													.posterFormat('_600');
											htmlTxt += '<div class="section">';
											htmlTxt += '<img src="'+ data.imgSvrUrl + img_Path + '"';
						htmlTxt += 'alt="" />';
											htmlTxt += '<p class="p-caption">';
											htmlTxt += data.postList[i].moviePostImgDesc
													.replaceAll('\n', '<br>');
											htmlTxt += '</p></div>';
										} else if (data.postList[i].moviePostImgDivCd == 'MIK02') { //스틸컷
											img_Path = nvl(
													data.postList[i].imgPath)
													.posterFormat('_648');
											htmlTxt += '<div class="section">';
											htmlTxt += '<img src="'+ data.imgSvrUrl+ img_Path + '"';
						htmlTxt += 'alt="" />';
											htmlTxt += '<p class="p-caption">';
											htmlTxt += data.postList[i].moviePostImgDesc
													.replaceAll('\n', '<br>');
											htmlTxt += '</p></div>';
										} else if (data.postList[i].moviePostImgDivCd == 'MIK03') { //예고편동영상
											img_Path = nvl(
													data.postList[i].imgPath)
													.posterFormat('_648');
											htmlTxt += '<div class="section">';
											htmlTxt += '<video controls poster="'
													+ data.imgSvrUrl
													+ img_Path
													+ '"';
											htmlTxt += '<source src="'+data.postList[i].moviePostVodUrl +'" type="video/mp4" /></video>';
											htmlTxt += '<p class="p-caption">';
											htmlTxt += data.postList[i].moviePostImgDesc
													.replaceAll('\n', '<br>');
											htmlTxt += '</p></div>';

										} else if (data.postList[i].moviePostImgDivCd == 'MOVIEPOST') { //내사진
											htmlTxt += '<div class="section">';
											htmlTxt += '<img src="'+ data.imgSvrUrl + data.postList[i].imgPath+ '"';
						htmlTxt += 'alt="" />';
											htmlTxt += '<p class="p-caption">';
											htmlTxt += data.postList[i].moviePostImgDesc
													.replaceAll('\n', '<br>');
											htmlTxt += '</p></div>';

										} else {
											htmlTxt += '<div class="section">';
											htmlTxt += '<img src="'+ data.imgSvrUrl + data.postList[i].imgPath+ '"';
						htmlTxt += 'alt="" />';
											htmlTxt += '<p class="p-caption">';
											htmlTxt += data.postList[i].moviePostImgDesc
													.replaceAll('\n', '<br>');
											htmlTxt += '</p></div>';

										}
									}

									$('.post-cont-area .section-area').html(
											htmlTxt);

								}

								//좋아요 아이콘
								if (detailInfo.likeYn == "Y") { //좋아요 Y

									var txt = "";

									txt += '<i title="좋아요 설정 함" class="iconset ico-like on"></i>';
									txt += ' ' + detailInfo.likeCnt;

									$('.count .btn').html(txt);

								} else { //좋아요 N

									var txt = "";

									txt += '<i title="좋아요 설정 안함" class="iconset ico-like"></i>';
									txt += ' ' + detailInfo.likeCnt;

									$('.count .btn').html(txt);

								}

								//댓글
								fn_moviePostRlySearch('search', moviePostNo,
										viewDiv);

								//무비포스트 상세 메타태그 설정
								fn_setMetaTag(detailInfo, moviePostNo,
										metaTagImg);

							}
						});
			}

			function fn_setMetaTag(detailInfo, moviePostNo, metaTagImg) {

				var attr = "";
				if (moviePostNo != null && moviePostNo != '')
					attr = '?moviePostNo=' + moviePostNo;

				var url = location.pathname + attr;
				if (detailPopup != null && detailPopup.backScreen != '')
					url = '/moviepost/all' + attr;

				metaFormat = {
					'scnTitle' : '('
							+ gfn_charToHtml(detailInfo.moviePostMovieTitle)
							+ ') 무비포스트 상세 | MEET PLAY SHARE, 메가박스',
					'metaTagTitle' : '('
							+ gfn_charToHtml(detailInfo.moviePostMovieTitle)
							+ ') 무비포스트 상세',
					'metaTagDtls' : '메가박스의 다양한 무비포스트를 확인해보세요.',
					'metaTagImg' : metaTagImg,
					'metaTagUrl' : url
				};

				//URL 변경
				history.replaceState(null, null, location.origin + url);

				//메타태그 설정
				settingMeta(metaFormat);
			}
		</script>

		<!--################# 무비포스트 상세 레이어팝업으로 변경 ###########################  -->
		<section id="layer_post_detail" class="modal-layer2">
			<a href="https://www.megabox.co.kr/moviepost/all" class="focus">레이어로
				포커스 이동 됨</a>
			<div class="wrap">
				<header class="layer-header">
					<h3 class="tit">무비포스트 상세</h3>
				</header>

				<div class="layer-con">

					<div class="post-detail">
						<div class="tit-area mb30">
							<p class="tit"></p>

							<div class="direct-link">
								<a id="bokdLinkBtn" data-no=""
									href="https://www.megabox.co.kr/moviepost/all"
									style="display: none;" title="">예매하기</a>
							</div>
						</div>


						<div class="user-post-box mb40">
							<div class="user-post-case">
								<!-- post-top-area -->
								<div class="post-top-area">

									<div class="user-info">
										<p class="photo">
											<img
												src="./모든영화 _ 무비포스트 _ MEET PLAY SHARE, 메가박스_files/img-P-MO-PO0101-user-img01.png"
												alt="userid80**님의 무비포스트">
										</p>

										<p class="user-id">
											<a href="https://www.megabox.co.kr/moviepost/all" title="ID"></a>
										</p>

										<p class="user-write-time"></p>
									</div>


									<div class="btn-util">
										<!-- 구독하기 전 -->
										<button type="button" class="button x-small gray-line"
											id="subscribe"></button>
									</div>

									<!-- post-funtion -->
									<div class="post-funtion">
										<div class="wrapper">
											<button type="button" class="btn-alert mp">옵션보기</button>
											<!--
												유저 일때
												<div class="balloon-space user">

												작성자 일때
												<div class="balloon-space writer">
												-->
											<div class="balloon-space mpost">
												<div class="balloon-cont"></div>
											</div>
											<!--// 말풍선 -->
										</div>
									</div>
									<!--// post-funtion -->
								</div>
								<!--// post-top-area -->

								<div class="post-cont-area">
									<!-- post 내용  -->
									<div class="section-area"></div>
									<!--// post 내용 -->
								</div>

								<!-- comment count -->
								<div class="count">
									<button type="button" class="btn" arti-no="">
										<i title="좋아요 설정 안함" class="iconset ico-like"></i>
									</button>

									<!-- 코멘트 등록 영역으로 이동 -->

								</div>
								<!--// comment count -->



							</div>
						</div>


						<!-- share -->
						<div class="btn-post-share">
							<!-- 								<button type="button" title="카카오톡 공유하기" class="btn kakao">카카오톡</button> -->
							<button type="button" title="페이스북 공유하기" class="btn face">페이스북</button>
							<button type="button" title="밴드 공유하기" class="btn band">밴드</button>
							<button type="button" title="트위터 공유하기" class="btn twitter">트위터</button>
							<button type="button" title="링크 공유하기" class="btn link">링크공유</button>
						</div>
						<!--// share -->

						<!-- comment input -->
						<div class="comment-write mb40" id="rly">
							<div class="comment-util mb20">
								<p>
									<span id="rlyCnt">댓글 </span>
								</p>
								<input type="hidden" id="rlyCntTop" value=""> <input
									type="hidden" id="hdnMoviePostNo" value="">
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
						<div class="comment-list" id="commentList"></div>
						<!--// comment list -->

						<div class="mb50"></div>

					</div>
				</div>
				<button type="button" class="btn-modal-close2">레이어 닫기</button>
			</div>
		</section>
		<!-- // ################# 무비포스트 상세 레이어팝업으로 변경 ###########################  -->
		<!-- //무비포스트 상세 레이어팝업 -->
	</div>



	<jsp:include page="/WEB-INF/views/footer.jsp" />
</body>
</html>