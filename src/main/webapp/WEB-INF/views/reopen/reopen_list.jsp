<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script
	src="${pageContext.request.contextPath}/resources/js/jquery-3.7.0.js"></script>
<title></title>

</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp" />
	<div class="container">

		<div class="page-util">
			<div class="inner-wrap">
				<div class="location">
					<span>Home</span> <a href="#" title="이벤트 메인 페이지로 이동">이벤트</a> <a
						href="https://www.megabox.co.kr/event" title="진행중 이벤트 페이지로 이동">진행중
						이벤트</a>
				</div>


			</div>
		</div>

		<div id="contents" class="">

			<div class="inner-wrap">

				<h2 class="tit">진행중인 이벤트</h2>

				<div class="tab-list fixed">
					<!-- 탭 리스트 -->
					<ul>
						<li id="eventTab_"><a
							href="${pageContext.request.contextPath}/event" title="전체">전체</a></li>

						<li id="eventTab_CED01" class=""><a
							href="${pageContext.request.contextPath}/event/movie"
							title="영화 탭으로 이동">영화</a></li>

						<li id="eventTab_CED02" class=""><a
							href="${pageContext.request.contextPath}/event/theater"
							title="극장 탭으로 이동">극장</a></li>

						<li id="eventTab_CED05" class=""><a
							href="${pageContext.request.contextPath}/event/promotion"
							title="제휴/할인 탭으로 이동">제휴/할인</a></li>

						<li id="eventTab_CED04" class=""><a
							href="${pageContext.request.contextPath}/event/curtaincall"
							title="시사회/무대인사 탭으로 이동">시사회/무대인사</a></li>

						<li class="on" id="eventTab_CED03" class=""><a
							href="${pageContext.request.contextPath}/event/reopen"
							title="재개봉 탭으로 이동">재개봉</a></li>
					</ul>
				</div>
				<!-- 탭 리스트 end -->



			</div>

			<div id="boardSearch" class="inner-wrap" style="">

				<div class="board-list-util mt40">


					<p class="result-count">
						<strong>전체 <b>${reopenMovieCnt}</b>건
						</strong>
					</p>
				</div>
			</div>

			<div id="event-list-wrap">


				<div class="inner-wrap">


					<div class="event-list ">
						<ul>

							<c:forEach var="reopen_movie" items="${reopenMovieList}">
								<li><a
									href="${pageContext.request.contextPath}/event/reopen/detail?movieCode=${reopen_movie.movie_Code}"
									class="eventBtn"
									title="${reopen_movie.movie_Title} 상세보기">
										<p class="img">
											<img src="${reopen_movie.movie_Poster}"
												alt="${reopen_movie.movie_Title}">
										</p>

										<p class="tit">[재개봉] ${reopen_movie.movie_Title}</p>

										<p class="date">${reopen_movie.REOPENING_STARTDATE} ~ ${reopen_movie.REOPENING_ENDDATE}</p>
										<p class="date">현재 동의 수 : <span style="font-weight:bold;">${reopen_movie.REOPEN_COUNT}</span></p>
								</a></li>
							</c:forEach>

						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/footer.jsp" />
</body>
</html>