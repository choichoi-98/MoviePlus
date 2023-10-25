<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MoviePlus: 모두를 위한 영화관</title>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.0.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/event.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp" />

	<!-- container -->
	<div class="container">

		<div class="page-util">
			<div class="inner-wrap">
				<div class="location">
					<span>Home</span> 
					<a href="${pageContext.request.contextPath}/event"	title="이벤트 메인 페이지로 이동">이벤트</a> 
					<a href="${pageContext.request.contextPath}/event" title="진행중 이벤트 페이지로 이동">진행중 이벤트</a>
				</div>
			</div>
		</div>

		<div id="contents">
			<div class="inner-wrap">
				<h2 class="tit">진행중인 이벤트</h2>
				<div class="tab-list fixed">	<!-- 탭 리스트 -->
					<ul>
						<!-- li class="on" id="eventTab_"><a href="javascript:fn_chgEventTab('')">전체</a></li-->
						<li class="on" id="eventTab_"><a
							href="${pageContext.request.contextPath}/event" title="전체">전체</a></li>

						<!--  li id="eventTab_CED01"><a href="javascript:fn_chgEventTab('CED01')">영화</a></li-->
						<li id="eventTab_CED01" class="">
						<a href="${pageContext.request.contextPath}/event/movie"
							title="영화 탭으로 이동">영화</a></li>

						<!--  li id="eventTab_CED02"><a href="javascript:fn_chgEventTab('CED02')">극장</a></li-->
						<li id="eventTab_CED02" class="">
						<a href="${pageContext.request.contextPath}/event/theater"
							title="극장 탭으로 이동">극장</a></li>

						<!--  li id="eventTab_CED05"><a href="javascript:fn_chgEventTab('CED05')">제휴/할인</a></li-->
						<li id="eventTab_CED05" class="">
						<a href="${pageContext.request.contextPath}/event/promotion"
							title="제휴/할인 탭으로 이동">제휴/할인</a></li>

						<!--  li id="eventTab_CED04"><a href="javascript:fn_chgEventTab('CED04')">시사회/무대인사</a></li-->
						<li id="eventTab_CED04" class="">
						<a href="${pageContext.request.contextPath}/event/curtaincall" 
							title="시사회/무대인사 탭으로 이동"><!-- href="javascript:fn_eventTabMove(&#39;CED04&#39;)"  -->시사회/무대인사</a></li>
						
						<!--  li id="eventTab_CED03"><a href="javascript:fn_chgEventTab('CED03')">메가Pick</a></li-->
						<li id="eventTab_CED03" class=""><a
							href="${pageContext.request.contextPath}/event/reopen"
							title="재개봉 탭으로 이동">재개봉</a></li>
					</ul>
				</div>	<!-- 탭 리스트 end -->

				<div id="toptablist" class="toptablist display-none"></div>
			</div> <!-- inner-wrap class end -->


			<div id="boardSearch" class="inner-wrap" style="display: none">

				<div class="board-list-util mt40">
					<p class="result-count"></p>

					<div class="board-search">
						<input type="text" title="검색어를 입력해 주세요."
							placeholder="검색어를 입력해 주세요." class="input-text">
						<button type="button" class="btn-search-input">검색</button>
					</div>
				</div>
			</div>

			<div id="event-list-wrap"> <!-- 이벤트 리스트 (4 x 5) -->

				<div class="inner-wrap">
					<div class="tit-util mt70">
						<h3 class="tit">영화</h3>
						<div class="right">
							<a href="${pageContext.request.contextPath}/event/movie" title="더보기">더보기
								<i class="iconset ico-arr-right-gray ml05"></i>
							</a>
						</div>
					</div>

					<div class="event-list mt15">
						<ul>
						<c:forEach var="eventmovie" items="${movieEventList}" varStatus="loop" begin="0" end="3">
							<li><a href="${pageContext.request.contextPath}/event/detail?num=${eventmovie.EVENT_NUM}"
								data-no="14081" data-netfunnel="N" class="eventBtn"
								title="${eventmovie.EVENT_SUBJECT}"> <!--<p class="img"><img src="../../../static/pc/images/event/@img-event-list-megabox.jpg" alt="" /></p>-->
									<p class="img">
										<img src="${pageContext.request.contextPath}/upload${eventmovie.EVENT_FILE}"
											alt="" onerror="noImg(this);">
									</p>

									<p class="tit">${eventmovie.EVENT_SUBJECT}</p>

									<p class="date"><span class="startdate">${eventmovie.EVENT_STARTDATE}</span> ~ <span class="enddate">${eventmovie.EVENT_ENDDATE}</span> </p>
							</a>
							</li>
						  </c:forEach>	
						</ul>

					</div>


					<div class="tit-util mt70">
						<h3 class="tit">극장</h3>
						<div class="right">
							<a href="${pageContext.request.contextPath}/event/theater" title="더보기">더보기
								<i class="iconset ico-arr-right-gray ml05"></i>
							</a>
						</div>
					</div>


					<div class="event-list mt15">
						<ul>
						<c:forEach var="eventtheater" items="${theaterEventList}" varStatus="loop" begin="0" end="3">
							<li>
								<a href="${pageContext.request.contextPath}/event/detail?num=${eventtheater.EVENT_NUM}"
								data-no="13594" data-netfunnel="N" class="eventBtn"
								title="${eventtheater.EVENT_SUBJECT}"> <!--<p class="img"><img src="../../../static/pc/images/event/@img-event-list-megabox.jpg" alt="" /></p>-->
									<p class="img">
										<img src="${pageContext.request.contextPath}/upload${eventtheater.EVENT_FILE}"
											alt="" onerror="noImg(this);">
									</p>

									<p class="tit">${eventtheater.EVENT_SUBJECT}</p>

									<p class="date"><span class="startdate">${eventtheater.EVENT_STARTDATE}</span> ~ <span class="enddate">${eventtheater.EVENT_ENDDATE}</span></p>
								</a>
							</li>
							</c:forEach>
						</ul>
					</div>


					<div class="tit-util mt70">
						<h3 class="tit">제휴/할인</h3>
						<div class="right">
							<a href="${pageContext.request.contextPath}/event/promotion" title="더보기">더보기
								<i class="iconset ico-arr-right-gray ml05"></i>
							</a>
						</div>
					</div>

					<div class="event-list mt15">
						<ul>
						 <c:forEach var="eventpromotion" items="${promotionEventList}" varStatus="loop" begin="0" end="3">
							<li>
							<a href="${pageContext.request.contextPath}/event/detail?num=${eventpromotion.EVENT_NUM}" data-no="14091" data-netfunnel="N" class="eventBtn"
								title="${eventpromotion.EVENT_SUBJECT}"> <!--<p class="img"><img src="../../../static/pc/images/event/@img-event-list-megabox.jpg" alt="" /></p>-->
									<p class="img">
										<img src="${pageContext.request.contextPath}/upload${eventpromotion.EVENT_FILE}"
											alt="" onerror="noImg(this);">
									</p>

									<p class="tit">${eventpromotion.EVENT_SUBJECT}</p>

									<p class="date"><span class="startdate">${eventpromotion.EVENT_STARTDATE}</span> ~ <span class="enddate">${eventpromotion.EVENT_ENDDATE}</span></p>
							</a>
							</li>
						  </c:forEach>	
						</ul>
					</div>


					<div class="tit-util mt70">
						<h3 class="tit">시사회/무대인사</h3>
						<div class="right">
							<a href="${pageContext.request.contextPath}/event/curtaincall" title="더보기">더보기
								<i class="iconset ico-arr-right-gray ml05"></i>
							</a>
						</div>
					</div>


					<div class="event-list mt15">
						<ul>
						  <c:forEach var="eventcurtaincall" items="${curtaincallEventList}" varStatus="loop"  begin="0" end="3">
							<li>
							<a href="${pageContext.request.contextPath}/event/detail?num=${eventcurtaincall.EVENT_NUM}"	data-no="14167" data-netfunnel="N" class="eventBtn"
								title="${eventcurtaincall.EVENT_SUBJECT}"> <!--<p class="img"><img src="../../../static/pc/images/event/@img-event-list-megabox.jpg" alt="" /></p>-->
									<p class="img">
										<img src="${pageContext.request.contextPath}/upload${eventcurtaincall.EVENT_FILE}"
											alt="" onerror="noImg(this);">
									</p>

									<p class="tit">${eventcurtaincall.EVENT_SUBJECT}</p>

									<p class="date"><span class="startdate">${eventcurtaincall.EVENT_STARTDATE}</span> ~ <span class="enddate">${eventcurtaincall.EVENT_ENDDATE}</span></p>
							</a>
							</li>
						    </c:forEach>
						</ul>
					</div>
					
				
				
				<!-- ******* 재개봉 **********  -->
					<div class="tit-util mt70">
						<h3 class="tit">재개봉</h3>
						<div class="right">
							<a href="${pageContext.request.contextPath}/event/reopen" title="더보기">더보기
								<i class="iconset ico-arr-right-gray ml05"></i>
							</a>
						</div>
					</div>

					<div class="event-list mt15">

						<ul>
							<c:forEach var="reopen_movie" items="${reopenMovieList}" begin="0" end="3">
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
					</div> <!-- 재개봉 end -->
					
					
				</div><!-- inner-wrap end -->
			</div><!-- event-list-wrap end -->



		</div>
	</div>
	<!--// container -->


	<jsp:include page="/WEB-INF/views/footer.jsp" />

	
	
</body>
</html>