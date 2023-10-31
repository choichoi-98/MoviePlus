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
	src="${pageContext.request.contextPath}/resources/js/moviePost.js"></script>


<link rel="icon" href="${pageContext.request.contextPath}/resources/image/favico.png" type="image/x-icon">
<title>MoviePlus: 모두를 위한 영화관</title>

</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp" />

	<div class="container">
		<!-- page-tit-area -->
		<div class="page-util fixed">
			<div class="inner-wrap">
				<div class="location">
					<span>Home</span> <a href="#" title="영화 페이지로 이동">영화</a> <a href="#"
						title="무비포스트 페이지로 이동">무비포스트</a>
				</div>


			</div>
		</div>
		<!--// page-tit-area -->

		<!-- contents -->
		<div id="contents" class="location-fixed">
			<input type="hidden" id="hidden-movieCode" value="${mp_movie.movie_Code}">
			<!-- inner-wrap -->
			<div class="inner-wrap">
				<h3 class="tit" style="color:#792828">무비포스트 작성</h3>

				<div class="movie-post-step02 selectMovie" style="">
					<div class="user-post-top">
						<p class="tit" id="movieNmTit">${mp_movie.movie_Title}</p>
					</div>

					<div class="post-layout-select">
						<div class="left-cont">
							<h4 class="tit">원하시는 스틸컷을 선택해주세요.</h4>
							<div class="layout-wrap">
								<div class="kind-list postContents" id="stillList">
									<!-- <ul></ul> -->
									<ul>
										<c:forEach var="stillcut" items="${stillCutList}">
											<li><a href="#" class="stillBtn"> <img
													src="${stillcut}" alt=""></a></li>
										</c:forEach>
									</ul>
								</div>
							</div>

						</div>
		
						<div class="right-cont" style="height: 100%;">
							<h4 class="tit">원하시는 스틸컷/예고편을 선택해주세요.</h4>
							<div class="layout-wrap">
								<div class="post-wrap" id="postLayer" style="height: 100%;">

									<div class="select on" style="height: 100%; background-color:white;">
										<div class="post-layer add-post layer-type-01">
											<div class="post-bg" data-no="1011697">
												<img id="form-stillcut" src="" alt="">
											</div>
											<div class="post-txt">
												<textarea style="height: 100%;" name="" id="post_content" title="내용을 작성해 주세요!"
													placeholder="내용을 작성해 주세요!" ></textarea>
											</div>
										</div>
									</div>
								</div>

							</div>
						</div>
					</div>

					<div class="a-c">
						<p>※ 고의적인 영업방해 또는 운영원칙에 어긋나는 게시물은 관리자의 제재 또는 형사적 책임이 수반될 수
							있습니다.</p>
					</div>





					<div class="btn-group mt20">
						<a href="#"
							class="button large purple" id="moviePostInsert" title="등록"> 등록 </a> <a
							onclick="history.back()"
							class="button large" id="postCancelBtn" title="취소">취소</a>
					</div>
				</div>
				<!--// inner-wrap -->
			</div>
			<!--// contents -->
		</div>
	</div>


	<jsp:include page="/WEB-INF/views/footer.jsp" />
</body>
</html>