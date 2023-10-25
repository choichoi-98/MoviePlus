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
				<div class="tab-list fixed">
					<ul>
						<!-- li class="on" id="eventTab_"><a href="javascript:fn_chgEventTab('')">전체</a></li-->
						<li class="" id="eventTab_"><a
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
						<li id="eventTab_CED04" class="on">
						<a href="${pageContext.request.contextPath}/event/curtaincall" 
							title="시사회/무대인사 탭으로 이동"><!-- href="javascript:fn_eventTabMove(&#39;CED04&#39;)"  -->시사회/무대인사</a></li>
						
						<!--  li id="eventTab_CED03"><a href="javascript:fn_chgEventTab('CED03')">메가Pick</a></li-->
						<li id="eventTab_CED03" class=""><a
							href="${pageContext.request.contextPath}/event/reopen"
							title="재개봉 탭으로 이동">재개봉</a></li>
					</ul>
				</div>

				<div id="toptablist" class="toptablist display-none">
				</div>
		</div><!-- inner wrap end -->

		
			<div id="divTopArea" class="event-slider" style="display: none;">
				<div class="inner-wrap">

					<p class="name">추천 이벤트</p>

					<div class="event-pagination swiper-pagination-bullets"></div>

					<div class="event-count">
						<span title="현재 페이지" class="active">0</span> /
						<span title="전체 페이지" class="total">0</span>
					</div>

					<div class="event-util">
						<button type="button" class="event-prev" tabindex="0" role="button" aria-label="Previous slide" style="display: none;">이전 이벤트 보기</button>
						<button type="button" class="event-next" tabindex="0" role="button" aria-label="Next slide" style="display: none;">다음 이벤트 보기</button>
						<button type="button" class="pause on">일시정지</button>
						<button type="button" class="play">자동재생</button>
					</div>

					<div class="event-control">
						<button type="button" class="event-prev" tabindex="0" role="button" aria-label="Previous slide" style="display: none;">이전 이벤트 보기</button>
						<button type="button" class="event-next" tabindex="0" role="button" aria-label="Next slide" style="display: none;">다음 이벤트 보기</button>
					</div>
				</div>

				<div class="event-swiper swiper-container-initialized swiper-container-horizontal">
					<div class="swiper-wrapper" style="transform: translate3d(0px, 0px, 0px); transition-duration: 0ms;">
						<!-- 반복 -->
						
					</div>
				<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
			</div>
		

		<div id="boardSearch" class="inner-wrap" style="">
			

			
				<div class="board-list-util mt40">
			
				<c:set var="curtaincallEventCount" value="${curtaincallEventListCount}" />
				<p class="result-count"><strong>전체 <b>${curtaincallEventCount}</b>건</strong></p>

				<div class="board-search">
					<input type="text" title="검색어를 입력해 주세요." placeholder="검색어를 입력해 주세요." class="input-text">
					<button type="button" class="btn-search-input">검색</button>
				</div>
			</div>
		</div>

		<div id="event-list-wrap">


	<div class="inner-wrap">
		

			<div class="event-list ">
          
			
                <input type="hidden" id="totCount" name="totCount" value="4">
				<ul>
				<c:forEach var="eventcurtaincall" items="${curtaincallEventList}" varStatus="loop" >
					<c:if test='${eventcurtaincall.EVENT_STATUS == "PROGRESS"}'>
					<li>
						<a href="${pageContext.request.contextPath}/event/detail?num=${eventcurtaincall.EVENT_NUM}" data-no="14248" data-netfunnel="N" class="eventBtn" title="&lt;화란&gt; 개봉주 무대인사 상세보기">

							<!--<p class="img"><img src="../../../static/pc/images/event/@img-event-list-megabox.jpg" alt="" /></p>-->
							<p class="img"> <img src="${pageContext.request.contextPath}/upload${eventcurtaincall.EVENT_FILE}" alt="&lt;화란&gt; 개봉주 무대인사" onerror="noImg(this);"></p>

							<p class="tit">
								${eventcurtaincall.EVENT_SUBJECT}
							</p>

							<p class="date">
								<span class="startdate">${eventcurtaincall.EVENT_STARTDATE}</span> ~ <span class="enddate">${eventcurtaincall.EVENT_ENDDATE}</span>
							</p>
						</a>
                
					</li>
					</c:if>
				</c:forEach>	
				</ul>
			</div>

		
		</div>
	</div>
	</div>

	</div>	<!--// container -->


	<jsp:include page="/WEB-INF/views/footer.jsp" />
</body>
</html>