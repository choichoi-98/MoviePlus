<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MoviePlus: 모두를 위한 영화관</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/movie_detail.js"></script>
<script>
	$(document).ready(function() {

		$("#popupLink").click(function(e) {
			e.preventDefault();

			var loginId = $("#loginId").val();
			console.log("로그인 아이디: " + loginId);

			if (loginId == null) {
				e.preventDefault(); // 클릭 이벤트의 기본 동작(링크 이동)을 방지
				console.log("로그인 x");
				$("#tooltip-layer01").css("display", "block");
			} else {
				console.log("로그인 o");
				// 	    	e.preventDefault();
				$("#layer_regi_reply_review").css("display", "block");
				$('#updateBtn').prop('id', 'regOneBtn').text('등록');
			}
		});//	$("#popupLink").click(function (e) {

	});//$(document).ready(function(){
	var contextPath = "${pageContext.request.contextPath}";
</script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp" />

	<!-- contents -->
	<div id="contents" class="no-padding">


		<c:forEach var="m" items="${movieDetail }">
			<input type="hidden" id="movieCode" value="${m.movie_Code}"
				name="movieCode">
			<!-- movie-detail -->
			<div class="movie-detail-page">
				<div class="bg-img"
					style="background-image: url(&amp;#39;https://img.megabox.co.kr/SharedImg/2023/09/14/PPbLw390ViPochVJJQxVwzvOF1ywM6mK_570.jpg&amp;#39;);"></div>
				<div class="bg-pattern"></div>
				<div class="bg-mask"></div>

				<!-- movie-detail-cont -->
				<div class="movie-detail-cont">
					<!-- 개봉 예매가능-->

					<p class="title">${m.movie_Title}</p>
					<p class="title-eng"></p>

					<div class="btn-util">
						<button type="button" class="button btn-like"
							style="width: 80px; color: white; background: #792828;"
							data-movie-code="${m.movie_Code}">
							<c:if test="${empty m.interest_Status }">
								<img class="dibs_img"
									src="${pageContext.request.contextPath}/resources/image/movie/heart_empty.png"
									style="width: 15px">
							</c:if>
							<c:if test="${!empty m.interest_Status }">
								<img class="dibs_img"
									src="${pageContext.request.contextPath}/resources/image/movie/heart_full.png"
									style="width: 15px">
							</c:if>
						</button>

					</div>


					<!-- info 지선이 작업 후 수정 필요-->

					<div class="info">
						<div class="score">
							<p class="tit">관람 평점</p>
							<div class="number gt" id="mainMegaScore">
								<!--  <div class="number lt" id="mainMegaScore">
					<p title="관람 전 점수" class="before"><em>0</em><span class="ir">점</span></p>
					<p title="관람 후 점수" class="after"><em>8.7</em><span class="ir">점</span></p> -->
								<p title="실관람 평점" class="before">
									<em>8.7</em><span class="ir">점</span>
								</p>
							</div>
						</div>
						<div class="rate">
							<p class="tit">예매율</p>

							<p class="cont">
								<em>1</em>위 (19.3%)
							</p>
						</div>
						<div class="audience ">
							<div class="tit ">
								<span class="m-tooltip-wrap ">누적관객수 <!-- 2019-09-11 툴팁 보기 수정 -->
									<em class="m-tooltip ml05"> <i
										class="iconset ico-tooltip-gray">툴팁보기</i>
										<div class="m-detail-tooltip">
											<div class="bg-arr bottom"></div>
											<div class="cont-area">
												<p class="reset a-c">
													누적관객 및 전일관객은 영화진흥 위원회<br> 영화관 입장권 통합전산망제공 기준입니다.<br>
													(2023.10.12기준)
												</p>
											</div>
										</div>
								</em>
								</span>
							</div>
							<p class="cont">
								<em>895,690</em> 명
							</p>
						</div>

					</div>
					<!--// info -->

					<div class="poster">
						<div class="wrap">
							<c:choose>
								<c:when
									test="${empty m.movie_Grade or m.movie_Grade eq '전체관람가'}">
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
							<img src="${fn:split(m.movie_Poster, '|')[0]}"
								alt="${m.movie_Title}" class="poster" onerror="noImg(this)">

						</div>
					</div>


					<div class="reserve screen-type col-2">
						<div class="reserve">
							<a
								href="${pageContext.request.contextPath}/booking?movieCode=${m.movie_Code}"
								class="btn reserve" title="영화 예매하기"
								style="width: 100%; border-radius: 5px; cursor: pointer;">예매
							</a>

						</div>
					</div>
				</div>
				<!--// movie-detail-cont -->
			</div>
			<!--// movie-detail -->


			<div id="contentData">

				<div class="inner-wrap">
					<div class="tab-list fixed">
						<ul>
							<li class="on"><a href="#" title="주요정보 탭으로 이동">주요정보</a></li>

						</ul>
					</div>

					<div class="movie-summary infoContent" id="info">

						<div class="txt">${m.movie_Plot}</div>

					</div>

					<div class="movie-info infoContent">

						<div class="line">
							<p>감독&nbsp;: ${m.movie_Director}</p>
							<p>장르&nbsp;: ${m.movie_Genre} / ${m.movie_Runtime}</p>
							<p>등급&nbsp;: ${m.movie_Grade}</p>

							<p>개봉일&nbsp;: ${m.movie_OpenDate}</p>


							<!--           -->
						</div>
						<p>
							출연진:
							<c:forEach items="${fn:split(m.movie_Actors, ',')}" var="actor"
								varStatus="loop">
								<c:if test="${loop.index < 3}">
						      ${actor}
						      <c:if
										test="${loop.index < 2 && loop.index < fn:length(m.movie_Actors) - 1}">
						        ,
						      </c:if>
								</c:if>
							</c:forEach>
						</p>
					</div>

					<!-- movie-graph -->
					<div class="movie-graph infoContent">
						<div class="col">
							<dl>
								<dt>관람포인트</dt>
								<dd id="charByPoint">배우·스토리</dd>
							</dl>

							<div class="graph" style="position: relative; bottom: 29px;">
								<div class="chartjs-size-monitor">
									<div class="chartjs-size-monitor-expand">
										<div class=""></div>
									</div>
									<div class="chartjs-size-monitor-shrink">
										<div class=""></div>
									</div>
								</div>
								<canvas id="chartByStart"
									style="width: 216px; height: 216px; display: block;"
									width="216" height="216" class="chartjs-render-monitor"></canvas>
								<img
									src="./(30일) 주요정보 _ 영화 _ MEET PLAY SHARE, 메가박스_files/no-graph01.jpg"
									alt="기대포인트 결과 없음" style="display: none;">
							</div>
						</div>

						<div class="col" id="subMegaScore">
							<dl>
								<dt>실관람 평점</dt>
							</dl>

							<div class="graph" style="display: none;">
								<img
									src="./(30일) 주요정보 _ 영화 _ MEET PLAY SHARE, 메가박스_files/no-graph02.jpg"
									alt="메가스코어 결과 없음">
							</div>
							<!--
                    <div class="score lt" style="position: relative; bottom: 29px;">
                        <div class="before">
                            <div class="circle"><em>0</em><span class="ir">점</span></div>
                            <p>관람 전</p>
                        </div>

                        <div class="after">
                            <div class="circle"><em>8.7</em><span class="ir">점</span></div>
                            <p>관람 후</p>
                        </div>
                    </div>
                    -->
							<div class="score equal"
								style="position: relative; bottom: 15px;">
								<div class="middle">
									<div class="circle">
										<em>8.7</em><span class="ir">점</span>
									</div>
								</div>
							</div>


							<dl>
								<dt>예매율</dt>
								<dd class="font-roboto regular">
									<span id="rkTag">19.3%</span>
								</dd>
							</dl>
						</div>

						<div class="col">
							<dl>
								<dt>누적관객수</dt>
								<dd class="font-roboto regular">895,690</dd>
							</dl>

							<div class="graph">
								<canvas id="chartByLine"
									style="width: 220px; height: 205px; display: block;"
									width="220" height="205"></canvas>
								<img
									src="./(30일) 주요정보 _ 영화 _ MEET PLAY SHARE, 메가박스_files/no-graph04.jpg"
									alt="일자별 관객수 결과 없음" style="display: none;">
							</div>
						</div>
					</div>
					<!--// movie-graph -->

					<!-- 영화관 선택후 -->

					<!-- 한줄평 있을 때 -->
					<div class="tit-util mt70 mb15 oneContent">
						<h2 class="tit small">
							${m.movie_Title}에 대한 <span id="count" class="font-gblue">${m.review_Count}</span>개의
							이야기가 있어요!
						</h2>
					</div>

					<div class="movie-idv-story oneContent">
						<ul>
							<!-- 로그인이 안되있을시 -->
							<li class="type03">
								<div class="story-area">
									<!-- 프로필영역 -->
									<div class="user-prof">
										<div class="prof-img">
											<img
												src="./(30일) 주요정보 _ 영화 _ MEET PLAY SHARE, 메가박스_files/ico-mega-profile.png"
												alt="MEGABOX">
										</div>
										<p class="user-id">MEGABOX</p>
									</div>
									<!-- // 프로필영역 -->

									<!-- 내용 영역 -->
									<div class="story-box">
										<div class="story-wrap">
											<div class="story-cont">
												<span class="font-gblue">${m.movie_Title}</span> 재미있게 보셨나요?
												영화의 어떤 점이 좋았는지 이야기해주세요.
											</div>

											<div class="story-write">
												<sec:authorize access="isAuthenticated()">
													<sec:authentication property="principal" var="pinfo" />
													<input type="hidden" value="${pinfo.MEMBER_ID}"
														id="loginId">
												</sec:authorize>
												<a href="" title="관람평쓰기"
													class="tooltip-click oneWrtNonMbBtn" id="popupLink"> <i
													class="iconset ico-story-write"></i> 관람평쓰기
												</a>
												<div id="tooltip-layer01" class="tooltip-cont"
													style="width: 225px; height: 80px; left: 800px;">
													<div class="wrap loginTagClick">
														로그인이 필요한 서비스 입니다.<br> <a
															href="javaScript:fn_viewLoginPopup(&#39;default&#39;,&#39;pc&#39;);"
															class="font-green" title="로그인 바로가기">로그인 바로가기 <i
															class="iconset ico-arr-right-green"></i></a>
														<button type="button" class="btn-close-tooltip">툴팁
															닫기</button>
													</div>
												</div>
											</div>
										</div>
									</div>
									<!-- // 내용 영역 -->
								</div>
							</li>


						</ul>
					</div>
				</div>
				<!--// inner-wrap -->

				<!-- movie-detail-poster -->
				<div class="movie-detail-poster mt70 moviepostContent">
					<div class="inner-wrap">

						<!--목록이 있을 때  -->
						<div class="tit-util mb15">
							<h2 class="tit small white">무비포스트</h2>
							<a href="${pageContext.request.contextPath}/moviepost/all"
								id="goMoviePost" class="more" data-nm="30일"
								title="무비포스트 페이지로 이동">더보기 <i
								class="iconset ico-arr-right-white"></i>
							</a>
						</div>

						<!-- movie-post-list -->
						<div class="movie-post-list"
							style="position: relative; height: 400px;">

							<c:forEach var="moviepost" items="${moviePostList}" begin="1" end="4" varStatus="status">
								<div class="grid-item"
									style="position: absolute; left: ${290 * (status.index-1)}px; top: 0px;">
									<div class="wrap">
										<div class="img">
											<a
												href="#"
												title="무비포스트 상세보기" class="moviePostBtn"><img
												src="${moviepost.moviepost_Still}"
												onerror="noImg(this)" alt="${moviepost.movie_Title}"></a>
										</div>

										<div class="cont">
											<div class="writer">

												<a
													href="#"
													title="무비포스트 페이지로 이동" class="moviePostId"
													data-id="1B9C8F3B-F75F-4081-85AE-352A45858E05">${moviepost.member_Id}</a>

											</div>

											<a
												href="#"
												title="무비포스트 상세보기" class="link moviePostBtn">
												<div class="label"></div>

												<p class="tit">${moviepost.movie_Title}</p>
												<p class="txt">${moviepost.moviepost_Content}</p>
												<p class="time">${moviepost.moviepost_Reg_date}</p>
											</a>

										</div>
									</div>
								</div>
							</c:forEach>

						</div>

					</div>
					<!--// movie-post-list -->


				</div>
			</div>
			<!--// movie-detail-poster -->

			<!--
<div class="add-area big infoContent">
    <script data-id="QZQTH4gyTeSwib9iz79Vig" name="megabox_p/sub/sub@sub_bottom_1100x80?mlink=431" src="//cast.imp.joins.com/persona.js" async></script>
</div>
 -->


			<!-- 레이어 : 관람평 등록 -->
			<section id="layer_regi_reply_review" class="modal-layer">
				<div class="wrap" style="top: 30%; width: 478px; left: 35%">
					<header class="layer-header none-ad">
						<h3 class="tit">
							<span class="oneTitle"></span> 작성하기
						</h3>
					</header>

					<div class="layer-con">
						<!-- regi-reply-score review -->
						<div class="regi-reply-score review">

							<!-- score -->
							<div class="score">
								<p class="tit">
									"${m.movie_Title}"<br>영화 어떠셨나요?
								</p>
								<div class="box">
									<div class="box-star-score">
										<div class="star">
											<div class="group">
												<button type="button" class="btn left score-1">1</button>
												<button type="button" class="btn right score-2">2</button>
											</div>
											<div class="group">
												<button type="button" class="btn left score-3">3</button>
												<button type="button" class="btn right score-4">4</button>
											</div>
											<div class="group">
												<button type="button" class="btn left score-5">5</button>
												<button type="button" class="btn right score-6">6</button>
											</div>
											<div class="group">
												<button type="button" class="btn left score-7">7</button>
												<button type="button" class="btn right score-8">8</button>
											</div>
											<div class="group">
												<button type="button" class="btn left score-9">9</button>
												<button type="button" class="btn right score-10">10</button>
											</div>
										</div>
										<div class="num">
											<em>0</em> <span>점</span>
										</div>
									</div>
									<input type="hidden" id="review_num" value="">
									<div class="textarea">
										<textarea id="textarea" rows="5" cols="30" title="한줄평 입력"
											placeholder="실관람평을 남겨주세요." class="input-textarea"></textarea>
										<div class="util">
											<p id="contentCount">
												<span>0</span> / 100
											</p>
										</div>
									</div>
								</div>
							</div>
							<!--// score -->

							<!-- point -->


							<div class="txt-alert errText" style="display: none;">한줄평
								내용을 입력해 주세요.</div>
						</div>
						<!--// regi-reply-score preview -->
					</div>

					<div class="btn-group-fixed">
						<button type="button" class="button close-layer">취소</button>
						<button type="button" class="button purple" id="regOneBtn"
							data-no="" data-cd="" data-mno="">등록</button>
					</div>

					<button type="button" class="btn-modal-close"
						id="review-modal-close">레이어 닫기</button>
				</div>
			</section>

			<!-- 무비포스트 상세 레이어팝업 -->


			<!--################# 무비포스트 상세 레이어팝업으로 변경 ###########################  -->
			<section id="layer_post_detail" class="modal-layer2">
				<div class="wrap">
					<header class="layer-header none-ad">
						<h3 class="tit">무비포스트 상세</h3>
					</header>

					<div class="layer-con">

						<div class="post-detail">
							<div class="tit-area mb30">
								<p class="tit"></p>

								<div class="direct-link">
									<a id="bokdLinkBtn" data-no=""
										href="https://www.megabox.co.kr/movie-detail?rpstMovieNo=23069600"
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
													src="./(30일) 주요정보 _ 영화 _ MEET PLAY SHARE, 메가박스_files/img-P-MO-PO0101-user-img01.png"
													alt="userid80**님의 무비포스트">
											</p>

											<p class="user-id">
												<a
													href="https://www.megabox.co.kr/movie-detail?rpstMovieNo=23069600"
													title="ID"></a>
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

			<!--// 레이어 : 관람평 등록 -->

			<!--레이어 : 삭제 모달 -->
			<section class="alert-popup" id="layerId_04504997593960893"
				style="position: fixed; padding-top: 45px; background: rgb(255, 255, 255); z-index: 5006; top: 360px; left: 369.5px; width: 300px; opacity: 1; display: none">
				<div class="wrap">
					<header class="layer-header">
						<h3 class="tit">알림</h3>
					</header>
					<div class="layer-con" style="height: 200px">
						<p class="txt-common">삭제 하시겠습니까?</p>
						<div class="btn-group">
							<button type="button" class="button lyclose">취소</button>
							<button type="button" class="button purple confirm"
								id="deleteBtn">확인</button>
						</div>
					</div>
					<button type="button" class="btn-layer-close">레이어 닫기</button>
				</div>
			</section>


			<!--//레이어 : 삭제 모달 -->
	</div>



	</div>
	<!--// contents -->
	</div>
	<!--// container -->
	<!-- 		</div> -->
	</c:forEach>

	<jsp:include page="/WEB-INF/views/footer.jsp" />
</body>
</html>